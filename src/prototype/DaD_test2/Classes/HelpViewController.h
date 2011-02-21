//
//  HelpViewController.h
//  DaD_test2
//
//  Created by tobi on 2/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HelpTextViewController.h"

@interface HelpViewController : UITableViewController {
	
	HelpTextViewController * helpText;

	@private NSArray *menuItems;
	@private NSArray *helpFileName;
}

@property(nonatomic,retain)HelpTextViewController * helpText;
//@property(readwrite, assign) NSArray *menuItems;
//@property(readwrite, assign) NSArray *helpFileName;

@end
