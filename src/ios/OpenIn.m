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
    if (! [[url scheme] isEqual:@"file"]) {
        return NO;
    } else {
        NSString *Filestring=[[url path] lastPathComponent];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString: Filestring];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:self.callbackId];
        return YES;
    }
   
}

@end
