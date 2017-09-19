//
//  OpenIn.h
//  
//
//  Created by Denis Mulder on 9/18/17.
//
//

#import <Foundation/Foundation.h>
#import <Cordova/CDV.h>

@interface OpenIn : CDVPlugin

@property (nonatomic, strong) NSURL* launchedURL;
@property (strong) NSString* callbackId;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions;
- (void)jsSubscribeForEvent:(CDVInvokedUrlCommand *)command;


@end
