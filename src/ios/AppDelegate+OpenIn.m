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

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
         Class class = object_getClass((id)self);

        SEL originalSelector = @selector(application:openURL:options:);
        SEL swizzledSelector = @selector(sw_application:openURL:options:);




      
    
     Method originalMethod = class_getClassMethod(class, originalSelector);
 Method swizzledMethod = class_getClassMethod(class, swizzledSelector);

        BOOL didAddMethod =
            class_addMethod(class,
                originalSelector,
                method_getImplementation(swizzledMethod),
                method_getTypeEncoding(swizzledMethod));

        if (didAddMethod) {
            class_replaceMethod(class,
                swizzledSelector,
                method_getImplementation(originalMethod),
                method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
}

@end
