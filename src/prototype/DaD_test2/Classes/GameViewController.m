//
//  GameViewController.m
//  DaD_test2
//
//  Created by tobi on 2/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "GameViewController.h"
#import "GameController.h"
#import <QuartzCore/QuartzCore.h>


@implementation GameViewController

@synthesize destinationLetters;

NSString *letters;


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
	
	
	//NSLog(@"length %d",[[self shake: @"apple"] length]);
	letters = [[NSString alloc] initWithFormat:@"%@",[self shake: @"apple"]];
	//destinationLetter
	
	
	for (int i= 0; i< [letters length] ; i++) {
		
		//destination Labels
		//UILabel *destLab = [[UILabel alloc] initWithFrame:CGRectMake(i*50, 170, 40, 60)];
		//destLab.layer.cornerRadius = 8;
		//destLab.layer.borderColor = [[UIColor blackColor] CGColor];
		//destLab.layer.borderWidth = 1;
		
		//[self.view addSubview:destLab];
		
		
		// create a label
		UILabel *draglabel = [[UILabel alloc] initWithFrame:CGRectMake(i*50, 10, 40, 40)];
		draglabel.text = [letters substringWithRange:NSMakeRange(i, 1)];
		draglabel.backgroundColor = [UIColor cyanColor];
		draglabel.adjustsFontSizeToFitWidth;
		draglabel.textAlignment = UITextAlignmentCenter;
		draglabel.layer.cornerRadius = 8;
		draglabel.layer.borderColor = [[UIColor blackColor] CGColor];
		draglabel.layer.borderWidth = 1;

		// enable touch delivery
		draglabel.userInteractionEnabled = YES;
		
		UIPanGestureRecognizer *gesture = [[[UIPanGestureRecognizer alloc] 
											initWithTarget:self 
											action:@selector(labelDragged:)] autorelease];
		[draglabel addGestureRecognizer:gesture];
		
		// add it
		[self.view addSubview:draglabel];	
		
	}
	//[letters release];
}


- (void)labelDragged:(UIPanGestureRecognizer *)gesture
{
	UILabel *label = (UILabel *)gesture.view;
	CGPoint translation = [gesture translationInView:label];
	
	NSLog(@"Position x:%d y:%d",label.center.x+translation.x,label.center.y+translation.y);
	
	//NSInteger elementSize = self.view.bounds.size.width/[letters length];
	
	//if(label.center.y + translation.y < 200){
		// if we are in the dogging region but not dogged!
		//if(label.center.y + translation.y > 120
		  // && label.center.y < 170){
		
		//	CGPoint point = CGPointMake(label.center.x + translation.x, 
		//			label.center.y + translation.y);
		
		//	long int position = lround((double)(point.x/elementSize));
			//NSLog(@"Position pos:%d",position);
		//	label.center = CGPointMake(position*elementSize , 200);
		
		//}-
		// we do not move if we have little translation
		//else if (translation.x > 5 || translation.y > 5 ||
		//		 translation.x < -5 || translation.y <-5){
		
		// move label
		label.center = CGPointMake(label.center.x + translation.x, label.center.y + translation.y);
		
		//}
	//}

	//float rounded = round(label.center.x + translation.x / elementSize*10);
	
	//label.center = CGPointMake(rounded, 200);
	
	// reset translation
	[gesture setTranslation:CGPointZero inView:label];
	
	//if(label.center.x > 200)
		//[self labelDog:gesture];
}

- (void)check:(UIPanGestureRecognizer *)gesture
{
	
}

- (NSString *)shake:(NSMutableString *)text
{
	NSMutableString * randamString = [NSMutableString stringWithCapacity:[text length]];
	//NSMutableString * tmp = [NSMutableString stringWithCapacity:[text length]];
	int leng = [text length];
	
	for(int i = 0; i < leng; i++){
	
		char *c = [text characterAtIndex:rand()%[text length]];
		[randamString appendFormat:@"%c" , c];
		
		//[text replaceOccurrencesOfString:@"p" 
		//					  withString:@"" options:NSCaseInsensitiveSearch 
		//						   range:(NSMakeRange(0, [text length]))];
		
	}
	return randamString;
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
