//
//  AppDelegate+OpenIn.h
//  MyApp
//
//  Created by Denis Mulder on 9/24/17.
//
//

#import "AppDelegate.h"
#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "Infrastructure.h"
#import "DeepLinkController.h"
#import "OSNavigationController.h"


@interface AppDelegate (OpenIn)

@property (strong, nonatomic) DeepLinkController *deepLinkController;
@property (strong, nonatomic) NSMutableArray *trustedHosts;

- (BOOL)application:(UIApplication *)app
               openURL:(NSURL *)url
               options:(NSDictionary<UIApplicationOpenURLOptionsKey, id> *)options;


@end

