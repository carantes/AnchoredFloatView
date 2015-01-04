//
//  Profile.h
//  AnchorFloatView
//
//  Created by Carlos Eduardo Arantes Ferreira on 03/01/15.
//  Copyright (c) 2015 Mobistart. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Profile : NSObject

@property (nonatomic, assign) int displayOrder;
@property (nonatomic, retain) NSString * picture;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * position;
@property (nonatomic, assign) BOOL isSelected;

- (instancetype)initWithName:(NSString *)name andPicture:(NSString *)picture andPosition:(NSString *)position;

@end
