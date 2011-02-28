//
//  GameOverViewController.m
//  DaD_test2
//
//  Created by tobi on 2/27/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "GameOverViewController.h"


@implementation GameOverViewController

@synthesize points;
@synthesize solvedWords;
@synthesize currentGameMode;

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
		self.navigationItem.leftBarButtonItem.title = @"Nochmal";
		
		self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithTitle:@"Menu" 
																			style:UIBarButtonItemStylePlain 
																			target:self 
																			action:@selector(showMenu)] 
																			autorelease];
    }
    return self;
}



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	Status *stat = [[[[UIApplication sharedApplication] delegate] gameController] getStatus];
	
	[currentGameMode setText:[NSString stringWithFormat:@"MODE: %d",[stat currentGameMode]]];
	[solvedWords setText:[NSString stringWithFormat:@"SOLVED: %d",[stat solvedWords]]];
	int p = ([stat solvedWords]*100) + ([stat lifesRemaining]*10);
	[points setText:[NSString stringWithFormat:@"POINTS: %d",p]];
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

-(void)showMenu{

	[self.navigationController popToRootViewControllerAnimated:YES];
	
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
