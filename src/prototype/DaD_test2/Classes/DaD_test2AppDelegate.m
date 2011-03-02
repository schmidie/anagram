//
//  DaD_test2AppDelegate.m
//  DaD_test2
//
//  Created by tobi on 2/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DaD_test2AppDelegate.h"
#import "RootViewController.h"
#import "GameModes.h"


@implementation DaD_test2AppDelegate

@synthesize window;
@synthesize navigationController;
@synthesize gameController;
@synthesize gameModel;

//NSString * const modusTraining = @"Training";
//NSString * const modusProfi = @"Profi";

#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
	//create NavigationController
	//navigationController = [[UINavigationController alloc] init];
	
    // Override point for customization after application launch.
	releasePool = [[NSAutoreleasePool alloc]init];
	
	gameModel = [[GameModel alloc]init];
	
	// TODO: write init method...
	[gameModel setTimeRemaining:60];
	[gameModel setLifesRemaining:3];
	[gameModel setSolvedWords:0];
	[gameModel setCurrentGameMode:TIMEATTACK];
	
	
	gameController = [[GameController alloc]initWithGameModel:gameModel];
	
	//push first ViewController
	//[navigationController pushViewController: RootViewController animated:NO];
	
    // Add the navigation controller's view to the window and display.
    [self.window addSubview:navigationController.view];
    [self.window makeKeyAndVisible];

    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
	[releasePool release];
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
	[releasePool release];
}


- (void)dealloc {
	[navigationController release];
	[window release];
	[super dealloc];
}


@end

