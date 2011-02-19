//
//  RootViewController.m
//  DaD_test2
//
//  Created by tobi on 2/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RootViewController.h"


@implementation RootViewController

@synthesize game;
@synthesize setting;
@synthesize score;
@synthesize help;

NSArray *menuItems;

#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad {
    [super viewDidLoad];
	self.title= @"Menu";

	menuItems = [[NSArray alloc] initWithObjects:@"Game",@"Setting",@"Highscore",@"Help",nil];
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


/*
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
*/
/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/
/*
- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
	[super viewDidDisappear:animated];
}
*/


 // Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations.
	return YES;
	//return (interfaceOrientation == UIInterfaceOrientationPortrait);
	//return [self shouldAutorotateToInterfaceOrientation:interfaceOrientation];
}



#pragma mark -
#pragma mark Table view data source

// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [menuItems count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
	// Configure the cell.
	cell.textLabel.text = [menuItems objectAtIndex:indexPath.row];
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source.
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }   
}
*/


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/


/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
	/*
	 <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
	 [self.navigationController pushViewController:detailViewController animated:YES];
	 [detailViewController release];
	 */
	
	switch (indexPath.row) {
		case 0:
			if(self.game == nil){    
				GameViewController *viewController = 
				[[GameViewController alloc] initWithNibName:@"GameViewController" bundle:[NSBundle mainBundle]];
				self.game = viewController;
				[viewController release];        
			}
			[self.navigationController pushViewController:self.game animated:YES];
			self.game.title = @"GAME"; 
			break;
		case 1:
			if(self.setting == nil){    
				SettingViewController *viewController = 
				[[SettingViewController alloc] initWithNibName:@"SettingViewController" bundle:[NSBundle mainBundle]];
				self.setting = viewController;
				[viewController release];        
			}
			[self.navigationController pushViewController:self.setting animated:YES];
			self.setting.title = @"Settings"; 
			break;
		case 2:
			if(self.score == nil){    
				ScoreViewController *viewController = 
				[[ScoreViewController alloc] initWithNibName:@"ScoreViewController" bundle:[NSBundle mainBundle]];
				self.score = viewController;
				[viewController release];        
			}
			[self.navigationController pushViewController:self.score animated:YES];
			self.score.title = @"Highscore"; 
			break;
		case 3:
			if(self.help == nil){    
				HelpViewController *viewController = 
				[[HelpViewController alloc] initWithNibName:@"HelpViewController" bundle:[NSBundle mainBundle]];
				self.help = viewController;
				[viewController release];        
			}
			[self.navigationController pushViewController:self.help animated:YES];
			self.help.title = @"Help"; 
			break;
		default:
			break;
	} 
}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end

