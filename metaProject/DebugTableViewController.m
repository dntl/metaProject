//
//  DebugTableViewController.m
//  metaProject
//
//  Created by dimakey on 13.07.13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//


#import "DebugTableViewController.h"

@implementation DebugTableViewController

@synthesize infoArray = _infoArray;

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
        self.title = @"Debug";
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.infoArray = [NSMutableArray array];
    
    NSString *infoPlistPath = [NSBundle.mainBundle pathForResource:@"debugInfo" ofType:@"plist"];
    NSDictionary *dbInfo = [NSDictionary dictionaryWithContentsOfFile:infoPlistPath];
    
    NSString *commitStr = [dbInfo objectForKey:@"CommitHash"];
    if (commitStr.length == 0)
        commitStr = @"N/A";        
    
    UITableViewCell *commitHashCell = [UITableViewCell emptyCellForTableView:self.tableView];
    commitHashCell.textLabel.text = @"Commit hash:";
    commitHashCell.detailTextLabel.text = commitStr;
    
    [self.infoArray addObject:commitHashCell];
    
    UITableViewCell *committerNameCell = [UITableViewCell emptyCellForTableView:self.tableView];
    committerNameCell.textLabel.text = @"Committer name:";
    committerNameCell.detailTextLabel.text = [dbInfo objectForKey:@"CommitterName"];
    
    [self.infoArray addObject:committerNameCell];
    
    UITableViewCell *committerEmailCell = [UITableViewCell emptyCellForTableView:self.tableView];
    committerEmailCell.textLabel.text = @"Committer email:";
    committerEmailCell.detailTextLabel.text = [dbInfo objectForKey:@"CommitterEmail"];
    
    [self.infoArray addObject:committerEmailCell];
    
    UITableViewCell *buildTimeCell = [UITableViewCell emptyCellForTableView:self.tableView];
    buildTimeCell.textLabel.text = @"Build time:";
    buildTimeCell.detailTextLabel.text = [dbInfo objectForKey:@"BuildTime"];
    
    [self.infoArray addObject:buildTimeCell];
    
    UITableViewCell *branchStatusCell = [UITableViewCell emptyCellForTableView:self.tableView];
    branchStatusCell.textLabel.text = @"Branch status:";
    branchStatusCell.detailTextLabel.text = [dbInfo objectForKey:@"BranchStatus"];
    
    [self.infoArray addObject:branchStatusCell];    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.infoArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{    
    return [self.infoArray objectAtIndex:indexPath.row];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
