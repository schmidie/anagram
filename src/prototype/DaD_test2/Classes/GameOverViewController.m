//
//  GameOverViewController.m
//  DaD_test2
//
//  Created by tobi on 2/27/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "GameOverViewController.h"
#import "DaD_test2AppDelegate.h"
#import "GameModes.h"


@implementation GameOverViewController

@synthesize points;
@synthesize solvedWords;
@synthesize currentGameMode;
@synthesize player;

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
		self.navigationItem.leftBarButtonItem = [[[UIBarButtonItem alloc] initWithTitle:@"nochmal" 
																				 style:UIBarButtonItemStylePlain
																				 target:self 
																				 action:@selector(restartGame)] 
																				 autorelease];
		//.title = @"Nochmal";
		//self.navigationItem.leftBarButtonItem.action= @selector(restartGame);
		
		self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithTitle:@"Menu" 
																			style:UIBarButtonItemStyleDone 
																			target:self 
																			action:@selector(showMenu)] 
																			autorelease];
    }
    return self;
}


//tastatur verschwindet wenn man wo anders rein tippt
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
	
    if ([player isFirstResponder] && [touch view] != player)
    {
        //The textView is currently being edited, and the user touched outside the text view
        [player resignFirstResponder];
    }
}



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}

// reload the current scores
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
	
	Status *stat = [[(DaD_test2AppDelegate *)[[UIApplication sharedApplication] delegate] gameController] getStatus];
	
	[currentGameMode setText:[NSString stringWithFormat:@"Schwierigkeit: %@",[GameModes getGameModeName:[stat currentGameMode]]]];
	[solvedWords setText:[NSString stringWithFormat:@"gelöste Wörter: %d",[stat solvedWords]]];
	calculatedPoints = ([stat solvedWords]*100) + ([stat lifesRemaining]*10);
	[points setText:[NSString stringWithFormat:@"Punkte: %d",calculatedPoints]];
}



// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    //return (interfaceOrientation == UIInterfaceOrientationPortrait);
	return YES;
}

-(void)showMenu{
    [[(DaD_test2AppDelegate *)[[UIApplication sharedApplication] delegate] gameController] 
										addNewHighscore:
												player.text:
												calculatedPoints
	];
	[self.navigationController popToRootViewControllerAnimated:YES];
}

-(void)restartGame{
    [[(DaD_test2AppDelegate *)[[UIApplication sharedApplication] delegate] gameController] 
	 addNewHighscore:
	 player.text:
	 calculatedPoints
	 ];
	[[(DaD_test2AppDelegate *)[[UIApplication sharedApplication] delegate] gameController] startNewGame];
	[self.navigationController popViewControllerAnimated:YES];
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
}


- (void)dealloc {
    [super dealloc];
}


@end
