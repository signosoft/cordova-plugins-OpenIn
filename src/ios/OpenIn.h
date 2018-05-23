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
@property (strong) NSString* unhandleURL;

- (BOOL)handleUrl:(NSURL *)url;
- (void)jsSubscribeForEvent:(CDVInvokedUrlCommand *)command;

@end

