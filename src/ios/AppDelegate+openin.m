//
//  AppDelegate+openin.m
//  MyApp
//
//  Created by Denis Mulder on 9/24/17.
//
//

#import "AppDelegate+openin.h"
#import "openin.h"
#import <objc/runtime.h>

@implementation AppDelegate (openin)

static NSString *const PLUGIN_NAME = @"openin";

- (BOOL)application:(UIApplication *)app
               openURL:(NSURL *)url
               options:(NSDictionary<UIApplicationOpenURLOptionsKey, id> *)options;

{
NSMutableDictionary* dictionary = @{}.mutableCopy;
     if (! [[url scheme] isEqual:@"file"]) {
[super application:app openURL:url options:options];;
     }
    if (url == nil) {

        return NO;
    }
    
    // get instance of the plugin and let it handle the url object
    openin *plugin = [self.viewController getCommandInstance:PLUGIN_NAME];
    if (plugin == nil) {

        return NO;
    }
    NSLog( @"1st url is %@", [url absoluteString]);
    [plugin handleUrl:url];
    NSLog( @"2nd url is %@", [url absoluteString]);

    return YES;
}






@end
