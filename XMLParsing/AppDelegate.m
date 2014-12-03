//
//  AppDelegate.m
//  XMLParsing
//
//  Created by 润华联动 on 14-11-19.
//  Copyright (c) 2014年 润华联动. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "PPMoviePlayer.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    ViewController * viewCtl = [[ViewController alloc] init];
    [self.window setRootViewController:viewCtl];
    [self.window makeKeyAndVisible];
    
    [self performSelector:@selector(startP2PEngine) withObject:nil afterDelay:2];
    
    return YES;
}

#pragma mark - pptv p2p

- (void)startP2PEngine {
    [PPMoviePlayer startP2PEngine];
}

- (void)restartP2PEngine {
    [PPMoviePlayer restartP2PEngine];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
#if !TARGET_IPHONE_SIMULATOR
    if ([PPMoviePlayer testLocalServer] == NO) {
        [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(startP2PEngine) object:nil];
        [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(restartP2PEngine) object:nil];
        [self performSelector:@selector(restartP2PEngine) withObject:nil afterDelay:2];
    }
#endif
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
