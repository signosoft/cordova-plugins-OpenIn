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
    NSLog(@"The code runs through handleurl!");
    if (! [[url scheme] isEqual:@"file"]) {
        NSLog(@"The code runs through not a file!");
 
        return NO;
    } else {
        NSString *Filestring=[[url path] lastPathComponent];
        NSLog(@"The code runs through the file handling!");
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString: Filestring];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:self.callbackId];
        url=nil;
        return YES;
    }
   
}

@end
