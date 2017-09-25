//
//  AppDelegate+OpenIn.m
//  MyApp
//
//  Created by Denis Mulder on 9/24/17.
//
//

#import "AppDelegate+OpenIn.h"
#import "OpenIn.h"
#import <objc/runtime.h>
#import "JRSwizzle.h"

@implementation AppDelegate (OpenIn)

static NSString *const PLUGIN_NAME = @"OpenIn";

- (BOOL)sw_application:(UIApplication *)app
            openURL:(NSURL *)url
            options:(NSDictionary<UIApplicationOpenURLOptionsKey, id> *)options;
{
    BOOL returnvalue;
    returnvalue= [self sw_application:(UIApplication *)app
                              openURL:(NSURL *)url
                              options:(NSDictionary<UIApplicationOpenURLOptionsKey, id> *)options];
    if (url == nil) {
        return returnvalue;
    }
    
    // get instance of the plugin and let it handle the url object
    OpenIn *plugin = [self.viewController getCommandInstance:PLUGIN_NAME];
    if (plugin == nil) {
        return returnvalue;
    }
    [plugin handleUrl:url];
    return returnvalue;
}
+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSError *error;
        BOOL result = [[self class] jr_swizzleMethod:@selector(application:openURL:options:) withMethod:@selector(sw_application:openURL:options:) error:&error];
        if (!result || error) {
            NSLog(@"Can't swizzle methods - %@", [error description]);
        }
    });
}
@end
