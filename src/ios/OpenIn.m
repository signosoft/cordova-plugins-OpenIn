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
    
           DumpObjcMethods(self);
    DumpObjcMethods(object_getClass(self) /* Metaclass */);
    
    
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


@end
