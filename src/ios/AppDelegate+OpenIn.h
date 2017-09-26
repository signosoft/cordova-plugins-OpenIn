//
//  AppDelegate+OpenIn.h
//  MyApp
//
//  Created by Denis Mulder on 9/24/17.
//
//

#import "AppDelegate.h"


@interface AppDelegate (OpenIn)

- (BOOL)sw_application:(UIApplication *)app
            openURL:(NSURL *)url
            options:(NSDictionary<UIApplicationOpenURLOptionsKey, id> *)options;

@end
