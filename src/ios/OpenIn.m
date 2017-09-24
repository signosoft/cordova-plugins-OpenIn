/********* OpenIn.m Cordova Plugin Implementation *******/

#import "OpenIn.h"

@implementation OpenIn



#pragma mark Methods, available from JavaScript side

- (void)jsSubscribeForEvent:(CDVInvokedUrlCommand *)command {
    
    
    self.callbackId = command.callbackId;
    self.launchedURL = nil;
}

- (BOOL)handleUrl:(NSURL *)url {
    CDVPluginResult* pluginResult = nil;
    NSString *URLstring=[url absoluteString];
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString: URLstring];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:self.callbackId];
    url = nil;
    return YES;
}

@end
