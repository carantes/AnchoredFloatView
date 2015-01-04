//
//  AnchoredFloatView.h
//  AnchoredFloatView
//
//  Created by Carlos Eduardo Arantes Ferreira on 03/01/15.
//  Copyright (c) 2015 Mobistart. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnchoredFloatView : UIControl

@property (nonatomic, strong) NSString *message;

- (id)initWithTableView:(UITableView *)tableView andTargetIndexPath:(NSIndexPath *)targetIndexPath;

@end
