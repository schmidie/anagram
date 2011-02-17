//
//  RootViewController.h
//  DaD_test2
//
//  Created by tobi on 2/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameViewController.h"
#import "DraggableLabel.h"

@interface RootViewController : UITableViewController {
	GameViewController * game;
}


@property(nonatomic,retain)GameViewController * game;


@end
