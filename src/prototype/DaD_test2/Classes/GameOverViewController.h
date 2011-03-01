//
//  GameOverViewController.h
//  DaD_test2
//
//  Created by tobi on 2/27/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Status.h"


@interface GameOverViewController : UIViewController {
	
	//IBOutlet UILabel *timeRemaining;
	//IBOutlet UILabel *livesRemaining;
	IBOutlet UILabel *solvedWords;
	IBOutlet UILabel *currentGameMode;
	IBOutlet UILabel *points;
	IBOutlet UITextField *player;
	NSInteger calculatedPoints;
	
}

//@property(nonatomic,retain) IBOutlet UILabel *timeRemaining;
//@property(nonatomic,retain) IBOutlet UILabel *livesRemaining;
@property(nonatomic,retain) IBOutlet UILabel *solvedWords;
@property(nonatomic,retain) IBOutlet UILabel *currentGameMode;
@property(nonatomic,retain) IBOutlet UILabel *points;
@property(nonatomic,retain) IBOutlet UITextField *player;
@end
