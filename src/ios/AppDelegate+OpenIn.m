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
    NSLog( @"2nd url is %@", [url absoluteString]);
  NSMutableDictionary* dictionary = @{}.mutableCopy;
  [self application:app openURL:url
  sourceApplication:@&amp;quot;&amp;quot; annotation:dictionary]

    return YES;
}


void DumpObjcMethods(Class clz) {
    
    unsigned int methodCount = 0;
    Method *methods = class_copyMethodList(clz, &methodCount);
    
    NSLog(@"Found %d methods on '%s'\n", methodCount, class_getName(clz));
    
    for (unsigned int i = 0; i < methodCount; i++) {
        Method method = methods[i];
        
        NSLog(@"\t'%s' has method named '%s' of encoding '%s'\n",
              class_getName(clz),
              sel_getName(method_getName(method)),
              method_getTypeEncoding(method));
        
        /**
         *  Or do whatever you need here...
         */
    }
    
    free(methods);
}

+ (void)load {

       DumpObjcMethods(self);
    DumpObjcMethods(object_getClass(self) /* Metaclass */);
}



@end
