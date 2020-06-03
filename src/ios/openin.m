/********* openin.m Cordova Plugin Implementation *******/

#import "openin.h"

@implementation openin



#pragma mark Methods, available from JavaScript side

- (void)jsSubscribeForEvent:(CDVInvokedUrlCommand *)command {
    
    self.callbackId = command.callbackId;
    self.launchedURL = nil;

    if([self.unhandleURL length] != 0) {
        NSLog(@"The code runs through the unhandleURL!");
        CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString: self.unhandleURL];
        [pluginResult setKeepCallbackAsBool:YES];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:self.callbackId];
        self.unhandleURL = nil;
    }
}

- (BOOL)handleUrl:(NSURL *)url {
    CDVPluginResult* pluginResult = nil;
    NSLog(@"The code runs through handleurl!");
   if (! [[url scheme] isEqual:@"file"]) {
        NSLog(@"The code runs through not a file!");
        return NO;
    } else {
        NSString *Filestring=[[url path] lastPathComponent];
        NSLog(@"The code runs through the file handling!");

        if([self.callbackId length] == 0) {
            self.unhandleURL = [url absoluteString];
        }

        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString: [url absoluteString]];
        [pluginResult setKeepCallbackAsBool:YES];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:self.callbackId];
        url=nil;
        return YES;
    }

   
}

@end
