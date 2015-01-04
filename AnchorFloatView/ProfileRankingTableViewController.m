//
//  ProfileRankingTableViewController.m
//  AnchorFloatView
//
//  Created by Carlos Eduardo Arantes Ferreira on 03/01/15.
//  Copyright (c) 2015 Mobistart. All rights reserved.
//

#import "ProfileRankingTableViewController.h"
#import "ProfileTableViewCell.h"
#import "Profile.h"
#import "ProfileDataSource.h"
#import "AnchoredFloatView.h"

@interface ProfileRankingTableViewController ()

@property (nonatomic, strong) NSArray *profileDataSource;
@property (nonatomic, strong) NSIndexPath *targetIndexPath;

@end

@implementation ProfileRankingTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSSortDescriptor* sortOrder = [NSSortDescriptor sortDescriptorWithKey: @"name" ascending: YES];

    self.profileDataSource = [[[ProfileDataSource alloc] init].profileList sortedArrayUsingDescriptors:[NSArray arrayWithObject:sortOrder]];
    
    self.targetIndexPath = [NSIndexPath indexPathForItem:11 inSection:0];
    
    [self setupAnchoredFloatView];

}

- (void)setupAnchoredFloatView {
    
    AnchoredFloatView *floatView = [[AnchoredFloatView alloc] initWithTableView:self.tableView andTargetIndexPath:self.targetIndexPath];
        
    [self.view addSubview:floatView];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.profileDataSource count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ProfileTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"profileCell" forIndexPath:indexPath];
    
    Profile *profile = [self.profileDataSource objectAtIndex:indexPath.row];
    
    // Configure the cell...
    cell.profileNameLabel.text = profile.name;
    cell.displayOrderLabel.text = [NSString stringWithFormat:@"%2li", indexPath.row+1];
    cell.profileImageView.image = [UIImage imageNamed:profile.picture];
    cell.positionLabel.text = profile.position;
    
    
    if (indexPath.row == self.targetIndexPath.row) {
        cell.contentView.backgroundColor = [UIColor colorWithRed:(74/255.0) green:(144/255.0) blue:(226/255.0) alpha:0.7f];
        cell.displayOrderLabel.textColor = [UIColor whiteColor];
        cell.positionLabel.textColor = [UIColor whiteColor];
    }
    else {
        cell.contentView.backgroundColor = [UIColor whiteColor];
        cell.displayOrderLabel.textColor = [UIColor lightGrayColor];
        cell.positionLabel.textColor = [UIColor lightGrayColor];
    }
    
    return cell;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
