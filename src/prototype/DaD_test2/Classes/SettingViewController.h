//
//  SettingViewController.h
//  DaD_test2
//
//  Created by tobi on 2/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Status.h"
#import "GameModes.h"

@interface SettingViewController : UIViewController {

	IBOutlet UILabel *actualModus;
	IBOutlet UIButton *changeModus;
	IBOutlet UIPickerView *picker;
	//IBOutlet UITextView *modusInfo	
}
-(IBAction)changeModeClicked:(id)sender;

@property(nonatomic,retain) IBOutlet UILabel *actualModus;
@property(nonatomic,retain) IBOutlet UIButton *changeModus;
//@property(nonatomic,retain) IBOutlet UITextView *modusInfo

@end
