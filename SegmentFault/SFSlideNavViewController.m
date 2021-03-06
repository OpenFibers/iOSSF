//
//  SFSlideNavViewController.m
//  SegmentFault
//
//  Created by jiajun on 11/26/12.
//  Copyright (c) 2012 SegmentFault.com. All rights reserved.
//

#import "SFSlideNavViewController.h"

#define CELL_HEIGHT             44.0f
#define SECTION_HEADER_HEIGHT   31.0f

@interface SFSlideNavViewController ()

@end

@implementation SFSlideNavViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.slideView.dataSource = self;
    self.slideView.delegate = self;
    self.slideView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.slideView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"slide_navigator_dark_backgrond.png"]];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.items[section] count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.items count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"UMSlideNavigationControllerSlideViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];

        UIImageView *bg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"slide_navigator_cell_background.png"]];
        bg.frame = CGRectMake(0.0f, 0.0f, 320.0f, CELL_HEIGHT);
        UIImageView *chevron = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"slide_navigator_cell_chevron.png"]];
        chevron.frame = CGRectMake(238.0f, 14.0f, 12.0f, 17.0f);
        chevron.layer.shadowColor = [UIColor blackColor].CGColor;
        chevron.layer.shadowOffset = CGSizeMake(0.0f, -1.0f);
        chevron.layer.shadowOpacity= 1.0f;
        chevron.layer.shadowRadius= 0.0f;
        [bg addSubview:chevron];
        cell.backgroundView = bg;

        
        UIImageView *selectedBg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"slide_navigator_cell_selected_background.png"]];
        selectedBg.frame = CGRectMake(0.0f, 0.0f, 320.0f, CELL_HEIGHT);
        UIImageView *selectedChevron = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"slide_navigator_cell_selected_chevron.png"]];
        selectedChevron.frame = CGRectMake(238.0f, 14.0f, 12.0f, 17.0f);
        selectedChevron.layer.shadowColor = [UIColor blackColor].CGColor;
        selectedChevron.layer.shadowOffset = CGSizeMake(0.0f, -1.0f);
        selectedChevron.layer.shadowOpacity= 1.0f;
        selectedChevron.layer.shadowRadius= 0.0f;
        [selectedBg addSubview:selectedChevron];
        cell.selectedBackgroundView = selectedBg;
    }
    
    [cell.contentView removeAllSubviews];
    
    cell.textLabel.font = [UIFont boldSystemFontOfSize:18.0f];
    cell.textLabel.text = [(UIViewController *)self.items[indexPath.section][indexPath.row] title];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.backgroundColor = [UIColor clearColor];
    cell.textLabel.shadowColor = [UIColor blackColor];
    cell.textLabel.shadowOffset = CGSizeMake(0.0f, -1.0f);

    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return CELL_HEIGHT;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (1 == section) {
        return SECTION_HEADER_HEIGHT;
    }
    return 0.0f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (1 == section) {
        UIImageView *bg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"slide_navigator_section_header_background.png"]];
        bg.frame = CGRectMake(0.0f, 0.0f, 320.0f, SECTION_HEADER_HEIGHT);
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(6.0f, 3.0f, 320.0f, SECTION_HEADER_HEIGHT - 6.0f)];
        label.backgroundColor = [UIColor clearColor];
        label.textColor = RGBCOLOR(202.0f, 190.0f, 172.0f);
        label.font = [UIFont boldSystemFontOfSize:16.0f];
        label.text = @"我的";
        label.shadowColor = [UIColor blackColor];
        label.shadowOffset = CGSizeMake(0.0f, -1.0f);
        [bg addSubview:label];
        return bg;
    }

    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    [self showItemAtIndex:indexPath];
}

@end
