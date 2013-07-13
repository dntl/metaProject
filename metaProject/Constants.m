//==============================================================================
//
//  Constants.m
//  metaProject
//
//  Created by dimakey on 13.07.13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//
//==============================================================================

@implementation UITableViewCell (MyExtensions)

//==============================================================================

+ (UITableViewCell *)emptyCellForTableView:(UITableView *)tableView
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

@end

