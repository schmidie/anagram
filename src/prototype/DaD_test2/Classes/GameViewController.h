//
//  GameViewController.h
//  DaD_test2
//
//  Created by tobi on 2/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameController.h"
#import <QuartzCore/QuartzCore.h>
#import "GameOverViewController.h"


@interface GameViewController : UIViewController {


	IBOutlet UIView *statusView;
	NSMutableArray *labels;
	
	IBOutlet UILabel *timeRemaining;
	IBOutlet UILabel *livesRemaining;
	IBOutlet UILabel *solvedWords;
	IBOutlet UILabel *currentGameMode;
	
	NSTimer *gameTimer;
	Status *stat;
	
	GameOverViewController * gameOver;
	
}

@property(nonatomic,retain) IBOutlet UIView *statusView;
//@property(nonatomic,retain) NSMutableArray *labels;

@property(nonatomic,retain)GameOverViewController * gameOver;

@property(nonatomic,retain) IBOutlet UILabel *timeRemaining;
@property(nonatomic,retain) IBOutlet UILabel *livesRemaining;
@property(nonatomic,retain) IBOutlet UILabel *solvedWords;
@property(nonatomic,retain) IBOutlet UILabel *currentGameMode;

-(void) showWord:(NSString *)word;

@end
