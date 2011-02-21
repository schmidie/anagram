//
//  HelpTextViewController.h
//  DaD_test2
//
//  Created by tobi on 2/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface HelpTextViewController : UIViewController {

	IBOutlet UIWebView *textView;
}

@property(nonatomic,retain)UIWebView * textView;

@end
