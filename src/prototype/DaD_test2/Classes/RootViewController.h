//
//  RootViewController.h
//  DaD_test2
//
//  Created by tobi on 2/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameViewController.h"
#import "SettingViewController.h"
#import "ScoreViewController.h"
#import "HelpViewController.h"


@interface RootViewController : UITableViewController {
	GameViewController * game;
	SettingViewController * setting;
	ScoreViewController * score;
	HelpViewController * help;
}


@property(nonatomic,retain)GameViewController * game;
@property(nonatomic,retain)SettingViewController * setting;
@property(nonatomic,retain)ScoreViewController * score;
@property(nonatomic,retain)HelpViewController * help;

@end
