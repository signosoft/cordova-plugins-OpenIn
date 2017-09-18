/********* OpenIn.m Cordova Plugin Implementation *******/

#import "OpenIn.h"


@implementation OpenIn

@synthesize callbackId, launchedURL;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.launchedURL = [launchOptions objectForKey:UIApplicationLaunchOptionsURLKey];
    if (self.launchedURL != nil) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:self.launchedURL];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:self.callbackId];

    }

self.launchedURL = nil;

    
  
}




#pragma mark Methods, available from JavaScript side

- (void)jsSubscribeForEvent:(CDVInvokedUrlCommand *)command {

    CDVPluginResult* pluginResult = nil;
   
    self.callbackId = command.callbackId;
    self.launchedURL = nil;
}





@end
