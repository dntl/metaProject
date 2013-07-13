//==============================================================================
//
//  DebugTableViewController.m
//  metaProject
//
//  Created by dimakey on 13.07.13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//
//==============================================================================

#import "DebugTableViewController.h"

//==============================================================================

@implementation DebugTableViewController

//==============================================================================

@synthesize infoArray = _infoArray;

//==============================================================================

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
        self.title = @"Debug";
    }
    return self;
}


//==============================================================================


- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}


//==============================================================================


- (UITableViewCell *)cellWithText:(NSString *)text detailText:(NSString *)detail
{
    UITableViewCell *cell = [UITableViewCell emptyCellForTableView:self.tableView];
    cell.textLabel.text = text ? text : @"N/A";
    cell.detailTextLabel.text = detail ? detail : @"N/A";
    return cell;
}


//==============================================================================

#pragma mark - View lifecycle

//==============================================================================


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.infoArray = [NSMutableArray array];
    
    NSString *infoPlistPath = [NSBundle.mainBundle pathForResource:@"debugInfo" ofType:@"plist"];
    NSDictionary *dbInfo = [NSDictionary dictionaryWithContentsOfFile:infoPlistPath];
    
    [self.infoArray addObject:[self cellWithText:@"Commit hash:" detailText:[dbInfo objectForKey:@"CommitHash"]]];
    [self.infoArray addObject:[self cellWithText:@"Commit date:" detailText:[dbInfo objectForKey:@"CommitDate"]]];
    [self.infoArray addObject:[self cellWithText:@"Committer name:" detailText:[dbInfo objectForKey:@"CommitterName"]]];
    [self.infoArray addObject:[self cellWithText:@"Committer email:" detailText:[dbInfo objectForKey:@"CommitterEmail"]]];
    [self.infoArray addObject:[self cellWithText:@"Branch status:" detailText:[dbInfo objectForKey:@"BranchStatus"]]];
    [self.infoArray addObject:[self cellWithText:@"Release notices:" detailText:@""]];
    
    NSArray *notices = [dbInfo objectForKey:@"Notices"];
    
    for (NSString* s in notices)
        [self.infoArray addObject:[self cellWithText:@"" detailText:s]];   
    
    [self.infoArray addObject:[self cellWithText:@"Build time:" detailText:[dbInfo objectForKey:@"BuildTime"]]];
}


//==============================================================================


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


//==============================================================================


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}


//==============================================================================


- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}


//==============================================================================


- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}


//==============================================================================


- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}


//==============================================================================


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


//==============================================================================

#pragma mark - Table view data source

//==============================================================================


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}


//==============================================================================


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.infoArray.count;
}


//==============================================================================


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{    
    return [self.infoArray objectAtIndex:indexPath.row];
}


//==============================================================================

#pragma mark - Table view delegate

//==============================================================================


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


//==============================================================================

@end
