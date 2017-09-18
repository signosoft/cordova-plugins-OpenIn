/********* OpenIn.m Cordova Plugin Implementation *******/

#import <Cordova/CDV.h>
#import <Foundation/Foundation.h>
#import <Cordova/CDVPlugin.h>
#import <Cordova/CDVPluginResult.h>

@interface OpenIn : CDVPlugin {
  NSString *_subscribers;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions;
- (void)applicationDidBecomeActive:(UIApplication *)application;
- (void)tryToConsumeEvent;
- (void)jsSubscribeForEvent:(CDVInvokedUrlCommand *)command;
- (void)jsUnsubscribeFromEvent:(CDVInvokedUrlCommand *)command;
- (void)onAppTerminate;

@property (nonatomic, strong) NSURL *launchedURL;
@end

@implementation OpenIn



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.launchedURL = [launchOptions objectForKey:UIApplicationLaunchOptionsURLKey];
    
  
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    if (self.launchedURL) {
        [self tryToConsumeEvent];
        self.launchedURL = nil;
    }
}

- (void)tryToConsumeEvent {
    if (_subscribers == nil) {
        return;
    }
    
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:self.launchedURL];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackID];
    
    
}

#pragma mark Methods, available from JavaScript side

- (void)jsSubscribeForEvent:(CDVInvokedUrlCommand *)command {
    NSString *eventName = [command eventName];
    CDVPluginResult* pluginResult = nil;
    if (eventName.length == 0) {
        return;
    }
    
    _subscribers = command.callbackId;
    [self tryToConsumeEvent];
}

- (void)jsUnsubscribeFromEvent:(CDVInvokedUrlCommand *)command {
    NSString *eventName = [command eventName];
    if (eventName.length == 0) {
        return;
    }
    
    _subscribers = nil;
}
- (void)onAppTerminate {

    _subscribers = nil;

    
    [super onAppTerminate];
}


@end
