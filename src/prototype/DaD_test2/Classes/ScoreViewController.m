//
//  ScoreViewController.m
//  DaD_test2
//
//  Created by tobi on 2/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ScoreViewController.h"
#import "DaD_test2AppDelegate.h"
#import "Score.h"


@implementation ScoreViewController

@synthesize training;
@synthesize timeattack;
@synthesize tabbar;
@synthesize table;


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
	tableItems = [NSArray array];
	table.dataSource = self;
}

-(void)reloadTable{
	NSInteger gameMode = tabbar.selectedItem.tag;
	
	NSArray * scores = [[(DaD_test2AppDelegate *)[[UIApplication sharedApplication] delegate] gameController] getHighscores:gameMode];
	NSMutableArray *newItems = [[NSMutableArray array]retain];
	
	for (Score *s in scores){
		NSString *name = [[NSString stringWithString:s.player]retain];
		NSInteger p = s.points;
		NSString *score = @"fsgds";//[NSString stringWithFormat:@"%@ - %@",name, p];
		[newItems addObject:score];
	}
	
	tableItems = newItems;
	[table reloadData];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
	// Configure the cell.
	cell.textLabel.text = [tableItems objectAtIndex:indexPath.row];
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
	return tableItems.count;
}

// reload the current scores and select training
-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
	
	tabbar.selectedItem = training;
	[self reloadTable];
}

- (void)viewWillDisappear:(BOOL)animated {
	
	
    [super viewWillDisappear:animated];
}

// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
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
}


- (void)dealloc {
	[training release];
	[timeattack release];
	[tabbar release];
	[table release];
    [super dealloc];
}


@end
