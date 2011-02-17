//
//  GameViewController.m
//  DaD_test2
//
//  Created by tobi on 2/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "GameViewController.h"


@implementation GameViewController

@synthesize destinationLetters;


// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	NSString *letters = @"test";
	
	for (int i= 0; i< [letters length] ; i++) {
		
		// create a label
		UILabel *draglabel = [[[UILabel alloc] initWithFrame:CGRectMake(i*50, 10, 30, 30)] 
							  autorelease];
		draglabel.text = [letters substringFromIndex:i];
		
		// enable touch delivery
		draglabel.userInteractionEnabled = YES;
		
		UIPanGestureRecognizer *gesture = [[[UIPanGestureRecognizer alloc] 
											initWithTarget:self 
											action:@selector(labelDragged:)] autorelease];
		[draglabel addGestureRecognizer:gesture];
		
		// add it
		[self.view addSubview:draglabel];	
		
	}
}


- (void)labelDragged:(UIPanGestureRecognizer *)gesture
{
	UILabel *label = (UILabel *)gesture.view;
	CGPoint translation = [gesture translationInView:label];
	
	// move label
	label.center = CGPointMake(label.center.x + translation.x, 
							   label.center.y + translation.y);
	
	// reset translation
	[gesture setTranslation:CGPointZero inView:label];
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
