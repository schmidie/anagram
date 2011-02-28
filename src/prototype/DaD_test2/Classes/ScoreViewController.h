//
//  ScoreViewController.h
//  DaD_test2
//
//  Created by tobi on 2/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ScoreViewController : UIViewController {
	
	IBOutlet UITabBarItem *training;
	IBOutlet UITabBarItem *timeattack;
	IBOutlet UITabBar *tabbar;
	IBOutlet UITableView *table;
	
}

@property(nonatomic, retain) IBOutlet UITabBarItem *training;
@property(nonatomic, retain) IBOutlet UITabBarItem *timeattack;
@property(nonatomic, retain) IBOutlet UITabBar *tabbar;
@property(nonatomic, retain) IBOutlet UITableView *table;

-(IBAction)trainingClicked:(id)sender;
-(IBAction)timeAttackClicked:(id)sender;

@end
