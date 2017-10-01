/********* OpenIn.m Cordova Plugin Implementation *******/

#import "OpenIn.h"
#import <objc/runtime.h>
#import "AppDelegate.h"

@implementation OpenIn
    



#pragma mark Methods, available from JavaScript side

- (void)jsSubscribeForEvent:(CDVInvokedUrlCommand *)command {
    
    
    self.callbackId = command.callbackId;
    self.launchedURL = nil;
}

void classListMethods(Class c)
{
    NSMutableString *classInfo;   
    {
        Class superClass;
        classInfo=[NSMutableString stringWithFormat:@"\nHierarchy: %@ ",c]; 
        superClass=[c superclass];
        while(superClass)
        {
            [classInfo appendFormat:@"-> %@ ",superClass];
            superClass=[superClass superclass];
        }
    }
    
    
    while (c) {
        unsigned int numMethods = 0;
        Method * methods = class_copyMethodList(c, &numMethods);
        [classInfo appendFormat:@"\n\nclass %@ has %d methods\n", c,numMethods];
        for(int i=0;i<numMethods;i++)
        {
            [classInfo appendFormat:@"%0.3d) %s\n",i+1,sel_getName(method_getName(methods[i]))];
        }
        if(methods) free(methods);
        c=[c superclass];
    }

    NSLog(@"%@",classInfo);
    return;
}

- (BOOL)handleUrl:(NSURL *)url {
    CDVPluginResult* pluginResult = nil;
    NSLog(@"The code runs through handleurl!");
    
classListMethods([AppDelegate class]);
    
    
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
