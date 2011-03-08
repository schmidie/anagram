//
//  GameViewController.m
//  DaD_test2
//
//  Created by tobi on 2/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "GameViewController.h"
#import "RootViewController.h"
#import "DaD_test2AppDelegate.h"
#import "GameModes.h"

@implementation GameViewController

@synthesize statusView;
@synthesize timeRemaining;
@synthesize livesRemaining;
@synthesize solvedWords;
@synthesize currentGameMode;
@synthesize gameOver;

//@synthesize gameTimer;

const int labelSize = 40;

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
		// hide the standard back button
		self.navigationItem.hidesBackButton = YES;
		// add a button to exit
		self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithTitle:@"Aufgeben" 
																				  style:UIBarButtonItemStylePlain 
																				  target:self 
																				  action:@selector(showGameOver)] 
																					autorelease];

    }
    return self;
}


-(void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
	[self becomeFirstResponder];
}

-(BOOL)canBecomeFirstResponder {
    return YES;
}


-(void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event {
	
}


-(void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
	[[NSNotificationCenter defaultCenter] addObserver:self
											 selector:@selector(shake) name:@"shake" object:nil];
	// if we shake
	if(event.type == UIEventTypeMotion && event.subtype == UIEventSubtypeMotionShake){
		//NSLog(@"motion Ended");
		// remove one life
		[[(DaD_test2AppDelegate*)[[UIApplication sharedApplication] delegate] gameController] removeLife];
		
		if([stat lifesRemaining]>0){
			// if we have still some life show the solution in a modal view
			NSString* curword = [[[(DaD_test2AppDelegate*)[[UIApplication sharedApplication] delegate] gameController] getStatus]currentWord];
			UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Lösung lautet" 
															message:curword
														   delegate:nil 
												  cancelButtonTitle:@"OK" 
												  otherButtonTitles: nil];
			[alert show];
			[alert release];
			
			// show the next word
			NSString* next = [[(DaD_test2AppDelegate*)[[UIApplication sharedApplication] delegate] gameController] getNextWord];
			[self showWord:next];
		}
	}
	
}


-(void)setStatus{
	// load the current game status to the labels
	[[self timeRemaining] setText: [NSString stringWithFormat:@"%d",[stat timeRemaining]]];
	[[self livesRemaining] setText: [NSString stringWithFormat:@"Leben: %d",[stat lifesRemaining]]];
	[[self solvedWords] setText: [NSString stringWithFormat:@"gelöste Wörter: %d",[stat solvedWords]]];
	[[self currentGameMode] setText: [NSString stringWithFormat:@"Spielmodus: %@",[GameModes getGameModeName:[stat currentGameMode]]]];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self becomeFirstResponder];
	
	// load the game status and show the next word
	stat = [[(DaD_test2AppDelegate*)[[UIApplication sharedApplication] delegate] gameController] getStatus];
	NSString* next = [[(DaD_test2AppDelegate*)[[UIApplication sharedApplication] delegate] gameController] getNextWord];
	[self showWord:next];
	
	//create a timer
	gameTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self 
											   selector:@selector(tick:) 
											   userInfo:nil 
												repeats:YES];
	// if we have the game mode TIMEATACK we start the timer and show the labels
	if([stat currentGameMode] == TIMEATTACK){
		[gameTimer fire];
		[self.timeRemaining setHidden:NO];
		[self.livesRemaining setHidden:NO];
	}
	// if we are in training do not start the timer
	else {
		[self.timeRemaining setHidden:YES];
		[self.livesRemaining setHidden:YES];
	}

}

- (void)viewWillDisappear:(BOOL)animated {
    [self resignFirstResponder];
    [super viewWillDisappear:animated];
	
}




-(void)showGameOver{
	
	// initialize GameOver ViewController
	if(self.gameOver == nil){    
		GameOverViewController *viewController = 
		[[GameOverViewController alloc] initWithNibName:@"GameOverViewController" bundle:[NSBundle mainBundle]];
		self.gameOver = viewController;
		[viewController release];        
	}
	//stop the timer !
	if(gameTimer != nil){
		[gameTimer invalidate];
		[[[(DaD_test2AppDelegate*)[[UIApplication sharedApplication] delegate] gameController] gameTimer] invalidate];
	}
	self.gameOver.title = @"Spielende";
	
	// Push the gameOver View
	[self.navigationController pushViewController:self.gameOver animated:YES];

}

//the gameTimer
-(void)tick:(NSTimer *)theTimer
{
	// get the current status
	stat = [[(DaD_test2AppDelegate*)[[UIApplication sharedApplication] delegate] gameController] getStatus];
	[self setStatus];
	
	// if we have no more time show the solution in a modal view
	if([stat timeRemaining]==0){
		
		NSString* curword = [[[(DaD_test2AppDelegate*)[[UIApplication sharedApplication] delegate] gameController] getStatus]currentWord];
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Lösung lautet" 
														message:curword
													   delegate:nil 
											  cancelButtonTitle:@"OK" 
											  otherButtonTitles: nil];
		[alert show];
		[alert release];
		// show the next word
		NSString* next = [[(DaD_test2AppDelegate*)[[UIApplication sharedApplication] delegate] gameController] getNextWord];
		[self showWord:next];
	}
	// if we have no more time and no more lifes stop game and show gameover
	if([stat lifesRemaining]==0 && [stat timeRemaining]==0){
		//gameOver! -> push View controller
		[self showGameOver];
		
	}
}

-(void)showWord:(NSString*) word
{
	//remove old labels from the view
	for (id v in self.view.subviews) {
		if([v isKindOfClass: [UILabel class]])
		{
			[v removeFromSuperview];
		}
	}
	//create new label array
	[labels release];
	labels = [[NSMutableArray alloc] initWithCapacity:[word length]];
	
	// fill each label with one letter
	for (int i= 0; i < [word length] ; i++) {
		
		// create a label
		// Alle Buchstaben auf der View sichtbar!
		int height = 10;
		int width = i*50;
		if (i>5){
			height = height + 60;
			width = width - 300;
		}
		
		// format the labels
		UILabel *draglabel = [[UILabel alloc] initWithFrame:CGRectMake(width, height, labelSize,labelSize)];
		draglabel.text = [word substringWithRange:NSMakeRange(i, 1)];
		UIColor* mycolor= [[UIColor alloc]initWithRed:0.7 green:0.8 blue:0.9 alpha:0.7];
		draglabel.backgroundColor = mycolor;
		draglabel.adjustsFontSizeToFitWidth;
		draglabel.font = [UIFont boldSystemFontOfSize:24];
		draglabel.textAlignment = UITextAlignmentCenter;
		draglabel.layer.cornerRadius = 8;
		draglabel.layer.borderColor = [[UIColor blackColor] CGColor];
		draglabel.layer.borderWidth = 1;
		
		// enable touch delivery
		draglabel.userInteractionEnabled = YES;
		// the gesture recognizer
		UIPanGestureRecognizer *gesture = [[[UIPanGestureRecognizer alloc] 
											initWithTarget:self 
											action:@selector(labelDragged:)] autorelease];
		// add the gesture Recognizer
		[draglabel addGestureRecognizer:gesture];
		
		// add it
		[self.view addSubview:draglabel];	
		[labels addObject:draglabel];
		[draglabel release];
	}
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	//get the current word from the controller - it is already shaked !
	//get status from controller
	//stat = [[(DaD_test2AppDelegate*)[[UIApplication sharedApplication] delegate] gameController] getStatus];
	//[gameTimer fire];
	//[word autorelease];
	//[stat autorelease];
	
}

// check if we have a collision with the labels
-(Boolean)isCollision:(CGPoint)pos fromLabel:(UILabel *)_label
{
	//check for all labels if we have a collision
	for (UILabel *label in labels) {

		// not for self
		if (![label isEqual:_label]) {
			/* ***********************************
			 *	check with pytagoras:
			 *
			 *	distance = sqrt((labelSize^2)/2)
			 *	-> distance = ((labelSize^2/2)^(1/2))
			 * 
			 **************************************/
			//int distance = (int)pow((pow(labelSize,2)/2),(0.5));
			
			// cheap hack for making it more beautifull :)
			int distance = labelSize-12;
			
			//int tmp = (int)pow(labelSize,2)/2;
			//int distance = (int) pow(tmp, (0.5) ); 
			/*
			 *	we need the diagonal of the rectangle from the two center-points!
			 *	this diagonal should not be longer than 2 * distance
			 *	
			 *	rectangle sides :	a = rec2_x - rec1_x	(or opposite)
			 *						b = rec1_y - rec2_y	(or opposite)
			 *	-> pytagoras: (like first step)
			 *	
			 *	diagonal = ((a^2+b^2)^(1/2))
			 */
			double side_a;
			double side_b;
			
			if(pos.x > label.center.x)
				side_a = pos.x - label.center.x;
			else 
				side_a = label.center.x - pos.x;
			
			if(pos.y > label.center.y)
				side_b = pos.y - label.center.y;
			else 
				side_b = label.center.y - pos.y;
			
			int diagonal = (int)pow(pow(side_a,2)+pow(side_b,2),(0.5));
			
			// we have a collision
			if(diagonal < distance)
				return YES;
		}
	}
	return NO;
}

// move the label away until we do not have any collision
-(void)moveAway:(UIPanGestureRecognizer *)gesture{
	
	UILabel *label = (UILabel *)gesture.view;
	
	/* ***********************************
	 *	pytagoras:
	 *
	 *	distance = sqrt((labelSize^2)/2)
	 *	-> distance = ((labelSize^2/2)^(1/2))
	 * 
	 **************************************/
	//int distance = (int)pow((pow(labelSize,2)/2),(0.5));
	
	//move away
	//label.center = CGPointMake(label.center.x + (distance/2), label.center.y +(distance/2));
	
	// cheap hack
	label.center = CGPointMake(label.center.x + (5), label.center.y +(5));
	
	//if we have still collision move away untilt we do not!
	while ([self isCollision:label.center fromLabel:label]) {
		label.center = CGPointMake(label.center.x + (5), label.center.y +(5));
	}
}


NSComparisonResult labelSort(UILabel * l1, UILabel * l2, void *context){
	
	// sort the labels with their position
	return[[NSNumber numberWithDouble:l1.center.x] compare:[NSNumber numberWithDouble:l2.center.x]];
}


-(NSString *)detectWord{
	
	// get the labels in the order of theit position
	NSArray * sorted =[labels sortedArrayUsingFunction:labelSort context:nil];
	NSString *word = [[NSString alloc] init];
	
	for (UILabel *label in sorted) {
		// get the letters of the labels and create the recognized word
		word = [word stringByAppendingString:label.text];
	}
	//return the recognized word
	return word;
}

- (void)labelDragged:(UIPanGestureRecognizer *)gesture
{
	// only drag the label if we have lifes and time
	if([stat lifesRemaining] > 0 || [stat timeRemaining] > 0){
		UILabel *label = (UILabel *)gesture.view;
		CGPoint translation = [gesture translationInView:label];
		
		// set the new possition of the label
		CGPoint newPos = CGPointMake(label.center.x + translation.x, label.center.y + translation.y);

		// check the gesture states
		switch ([gesture state]) {
				//always when we drag
			case UIGestureRecognizerStateChanged:			
				// set the new position
				label.center = newPos;
				[gesture setTranslation:CGPointZero inView:label];
				break;
				
				// we do collision recognizion in the state ended to protect energy :)
			case UIGestureRecognizerStateEnded:
				// check if we have collision
				if([self isCollision:newPos fromLabel:label]){
					// if we have collision move away until we do not
					[self moveAway:gesture];
				}
				// check if we have the solution
				Boolean solved = [[(DaD_test2AppDelegate*)[[UIApplication sharedApplication] delegate] gameController] checkSolution:[self detectWord]];
				if(solved){
					// if we solved show next word
					NSString* next = [[(DaD_test2AppDelegate*)[[UIApplication sharedApplication] delegate] gameController] getNextWord];
					[self showWord:next];
					//NSLog(@"solved !!");
				}
				//NSLog([self detectWord]);
				break;
			default:
				break;
		}
	}
	
}


// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    //return (interfaceOrientation == UIInterfaceOrientationPortrait);
	return YES;
}




- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
	[self resignFirstResponder]; 
	[labels release];
	[stat release];
}


- (void)dealloc {
    [super dealloc];
	[stat release];
	[labels release];
}


@end
