/********* OpenIn.m Cordova Plugin Implementation *******/

#import "OpenIn.h"


@implementation OpenIn

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.launchedURL = [launchOptions objectForKey:UIApplicationLaunchOptionsURLKey];

}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    if (self.launchedURL) {
         pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:self.launchedURL];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:self.callbackId];
        self.launchedURL = nil;
    }
}

#pragma mark Methods, available from JavaScript side

- (void)jsSubscribeForEvent:(CDVInvokedUrlCommand *)command {

    CDVPluginResult* pluginResult = nil;
   
    self.callbackId = command.callbackId;
    self.launchedURL = nil;
}

@end
