//
//  OpenIn.h
//  
//
//  Created by Denis Mulder on 9/18/17.
//
//

#import <Foundation/Foundation.h>
#import <Cordova/CDVPlugin.h>

@interface OpenIn : CDVPlugin {
    
    NSString* callbackId;
    NSURL* launchedURL;
}

@property (nonatomic, strong) NSURL* launchedURL;
@property (strong) NSString* callbackId;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions;
- (void)applicationDidBecomeActive:(UIApplication *)application;
- (void)tryToConsumeEvent;
- (void)jsSubscribeForEvent:(CDVInvokedUrlCommand *)command;
- (void)jsUnsubscribeFromEvent:(CDVInvokedUrlCommand *)command;

@end
