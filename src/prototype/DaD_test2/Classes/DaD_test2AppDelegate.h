//
//  DaD_test2AppDelegate.h
//  DaD_test2
//
//  Created by tobi on 2/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameController.h"
#import "GameModel.h"

@interface DaD_test2AppDelegate : NSObject <UIApplicationDelegate> {
    
    UIWindow *window;
    UINavigationController *navigationController;
	
	GameController *gameController;
	GameModel *gameModel;
	NSAutoreleasePool *releasePool;
	
	//extern NSString * const modusTraining;
	//extern NSString * const modusProfi;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;
@property (nonatomic, retain) GameController *gameController;
@property (nonatomic, retain)  GameModel *gameModel;

@end

