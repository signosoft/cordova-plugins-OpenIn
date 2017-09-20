/********* OpenIn.m Cordova Plugin Implementation *******/

#import "OpenIn.h"

@implementation OpenIn

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.launchedURL = [launchOptions objectForKey:UIApplicationLaunchOptionsURLKey];
    return YES;

}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    CDVPluginResult* pluginResult = nil;
    NSString *URLstring=[self.launchedURL absoluteString];
    
    if (self.launchedURL) {
         pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString: URLstring];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:self.callbackId];
        self.launchedURL = nil;
    }
}

#pragma mark Methods, available from JavaScript side

- (void)jsSubscribeForEvent:(CDVInvokedUrlCommand *)command {

   
    self.callbackId = command.callbackId;
    self.launchedURL = nil;
}

@end
