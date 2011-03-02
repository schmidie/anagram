//
//  SettingViewController.m
//  DaD_test2
//
//  Created by tobi on 2/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SettingViewController.h"
#import "DaD_test2AppDelegate.h"
#import "GameModes.h"


@implementation SettingViewController

@synthesize actualModus;
@synthesize changeModus;

//@synthesize modusInfo;

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.



-(void)refreshModus
{
	Status *stat = [[(DaD_test2AppDelegate *)[[UIApplication sharedApplication] delegate] gameController] getStatus];
	[actualModus setTag:[stat currentGameMode]];
	[actualModus setText: [NSString stringWithFormat:@"Spielmodus: %@",[GameModes getGameModeName:[stat currentGameMode]]]];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
		
    }
    return self;
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	[self refreshModus];
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (IBAction)changeModeClicked:(id)sender
{
	//Status *stat = [[[[UIApplication sharedApplication] delegate] gameController] getStatus];
	[self refreshModus];
	
	if(actualModus.tag == TIMEATTACK )
	{
		
		[[(DaD_test2AppDelegate *)[[UIApplication sharedApplication] delegate] gameController] changeModus:TRAINING];
	}
	else 
	{
		[[(DaD_test2AppDelegate *)[[UIApplication sharedApplication] delegate] gameController] changeModus:TIMEATTACK];
	}

	[self refreshModus];
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
