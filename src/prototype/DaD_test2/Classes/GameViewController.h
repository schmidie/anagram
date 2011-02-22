//
//  GameViewController.h
//  DaD_test2
//
//  Created by tobi on 2/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface GameViewController : UIViewController {


	IBOutlet UIView *statusView;
	NSMutableArray *labels;
	//NSMutableArray *originalPos;
	
}

@property(nonatomic,retain) IBOutlet UIView *statusView;
@property(nonatomic,retain) NSMutableArray *labels;

@end
