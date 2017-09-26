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

- (BOOL)sw_application:(UIApplication *)app
            openURL:(NSURL *)url
            options:(NSDictionary<UIApplicationOpenURLOptionsKey, id> *)options;
{
    BOOL returnvalue;
    returnvalue= [self sw_application:app
                              openURL:url
                              options:options];
    if (url == nil) {
        [self sw_application:app
                              openURL:url
                              options:options];
                return NO;
    }
    
    // get instance of the plugin and let it handle the url object
    OpenIn *plugin = [self.viewController getCommandInstance:PLUGIN_NAME];
    if (plugin == nil) {
                [self sw_application:app
                              openURL:url
                              options:options];
        return NO;
    }
            NSLog( @"1st url is %@", [url absoluteString]);
    [plugin handleUrl:url];
            NSLog(@"The code runs through here!");
            NSLog( @"2nd url is %@", [url absoluteString]);
            [self sw_application:app
                              openURL:url
                              options:options];
    return YES;
}

// void defaultMethodIMP (id self, SEL _cmd) { /* nothing to do here */ }


+ (void) load
{
if ([self respondsToSelector:@selector(application:openURL:options:)]) {
    NSLog(@"application:openURL:options: is present");
} else {
    NSLog(@"application:openURL:options: is NOT present");
}
            
            if ([self respondsToSelector:@selector(openURL(_:))]) {
    NSLog(@"openURL(_:) is present");
} else {
    NSLog(@"openURL(_:) is NOT present");
}
            
                        if ([self respondsToSelector:@selector(application:handleOpenURL:)]) {
    NSLog(@"application:handleOpenURL: is present");
} else {
    NSLog(@"application:handleOpenURL: is NOT present");
}
            
            if ([self respondsToSelector:@selector(application:openURL:sourceApplication:annotation:)]) {
    NSLog(@"application:openURL:sourceApplication:annotation: is present");
} else {
    NSLog(@"application:openURL:sourceApplication:annotation: is NOT present");
}
    [self exchange_methods:@selector(application:openURL:options:)
                  swizzled:@selector(sw_application:openURL:options:)];

}
+ (void) exchange_methods:(SEL)original swizzled:(SEL)swizzled
{
  //  class_addMethod(self, original, (IMP) defaultMethodIMP, "v@:");

    Method original_method = class_getInstanceMethod(self, original);
    Method swizzled_method = class_getInstanceMethod(self, swizzled);

    method_exchangeImplementations(original_method, swizzled_method);
}

@end
