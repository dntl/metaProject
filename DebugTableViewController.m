//==============================================================================
//
//  DebugTableViewController.m
//  metaProject
//
//  Created by krasylnikov on 13.07.13.
//  Copyright (c) 2013 Design and Test lab. All rights reserved.
//
//==============================================================================

#import "DebugTableViewController.h"

//==============================================================================

@implementation DebugTableViewController

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


- (UITableViewCell *)emptyCellForTableView:(UITableView *)tableView
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.textLabel.text = @"";
        cell.detailTextLabel.text = @"";
    }
    return cell;
}


//==============================================================================


- (UITableViewCell *)cellWithText:(NSString *)text detailText:(NSString *)detail
{
    UITableViewCell *cell = [self emptyCellForTableView:self.tableView];
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
    
    _infoArray = [NSMutableArray array];
    
    NSString *infoPlistPath = [NSBundle.mainBundle pathForResource:@"debugInfo" ofType:@"plist"];
    NSDictionary *dbInfo = [NSDictionary dictionaryWithContentsOfFile:infoPlistPath];
    
    [_infoArray addObject:[self cellWithText:@"Commit hash:" detailText:[dbInfo objectForKey:@"CommitHash"]]];
    [_infoArray addObject:[self cellWithText:@"Commit date:" detailText:[dbInfo objectForKey:@"CommitDate"]]];
    [_infoArray addObject:[self cellWithText:@"Built by:" detailText:[dbInfo objectForKey:@"GitUserName"]]];
    [_infoArray addObject:[self cellWithText:@"Email:" detailText:[dbInfo objectForKey:@"GitUserEmail"]]];
    [_infoArray addObject:[self cellWithText:@"Branch status:" detailText:[dbInfo objectForKey:@"BranchStatus"]]];
    [_infoArray addObject:[self cellWithText:@"Build config:" detailText:[dbInfo objectForKey:@"BuildConfiguration"]]];
    [_infoArray addObject:[self cellWithText:@"The \"IF\" coefficient:" detailText:[dbInfo objectForKey:@"IfCoef"]]];
    
    UITableViewCell *cell = [self cellWithText:@"" detailText:@""];
    [_infoArray addObject:cell];
    
    NSArray *notices = [dbInfo objectForKey:@"Notices"];
    UITextView *textView = [UITextView new];
    textView.frame = cell.bounds;

    NSString *allNotices = @"Release notices:\n\n";
    
    for (NSString* s in notices)
        allNotices = [NSString stringWithFormat:@"%@*    %@\n", allNotices, s];
    
    textView.text = allNotices;
    
    [cell addSubview:textView];
    cell.frame = CGRectMake(cell.frame.origin.x, cell.frame.origin.y, cell.frame.size.width, textView.frame.size.height);
    
    [_infoArray addObject:[self cellWithText:@"Build date:" detailText:[dbInfo objectForKey:@"BuildTime"]]];
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
    UITableViewCell *cell = [_infoArray objectAtIndex:indexPath.row];
    return  cell.frame.size.height;
}


//==============================================================================


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return _infoArray.count;
}


//==============================================================================


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{    
    return [_infoArray objectAtIndex:indexPath.row];
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

//==============================================================================