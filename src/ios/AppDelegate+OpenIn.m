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

@implementation AppDelegate (OpenIn)

static NSString *const PLUGIN_NAME = @"OpenIn";

- (BOOL)application:(UIApplication *)app
               openURL:(NSURL *)url
               options:(NSDictionary<UIApplicationOpenURLOptionsKey, id> *)options;
{
    BOOL returnvalue;
    returnvalue= [self sw_application:app
                              openURL:url
                              options:options];
    if (url == nil) {

        return NO;
    }
    
    // get instance of the plugin and let it handle the url object
    OpenIn *plugin = [self.viewController getCommandInstance:PLUGIN_NAME];
    if (plugin == nil) {

        return NO;
    }
    NSLog( @"1st url is %@", [url absoluteString]);
    [plugin handleUrl:url];
    NSLog(@"The code runs through here!");
    NSLog( @"2nd url is %@", [url absoluteString]);

    return YES;
}




@end
