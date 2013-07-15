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
    [self.infoArray addObject:[self cellWithText:@"User name:" detailText:[dbInfo objectForKey:@"GitUserName"]]];
    [self.infoArray addObject:[self cellWithText:@"User email:" detailText:[dbInfo objectForKey:@"GitUserEmail"]]];
    [self.infoArray addObject:[self cellWithText:@"Branch status:" detailText:[dbInfo objectForKey:@"BranchStatus"]]];
    [self.infoArray addObject:[self cellWithText:@"Build config:" detailText:[dbInfo objectForKey:@"BuildConfiguration"]]];
    
    UITableViewCell *cell = [self cellWithText:@"" detailText:@""];
    //cell.frame = CGRectMake(cell.frame.origin.x, cell.frame.origin.y, cell.frame.size.width, 100);
    [self.infoArray addObject:cell];
    
    NSArray *notices = [dbInfo objectForKey:@"Notices"];
    UITextView *textView = [UITextView new];
    textView.frame = CGRectMake(0, 0, self.tableView.frame.size.width, 100);

    NSString *allNotices = [NSString new];
    allNotices = @"Release notices:\n\n";
    
    for (NSString* s in notices)
    {
        //[self.infoArray addObject:[self cellWithText:@"" detailText:s]];
        allNotices = [NSString stringWithFormat:@"%@*    %@\n", allNotices, s];
    }
    
    textView.text = allNotices;
    
    [cell addSubview:textView];
    cell.frame = CGRectMake(cell.frame.origin.x, cell.frame.origin.y, cell.frame.size.width, textView.frame.size.height);
    
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


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.infoArray objectAtIndex:indexPath.row];
    return  cell.frame.size.height;
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
