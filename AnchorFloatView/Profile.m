//
//  Profile.m
//  AnchorFloatView
//
//  Created by Carlos Eduardo Arantes Ferreira on 03/01/15.
//  Copyright (c) 2015 Mobistart. All rights reserved.
//

#import "Profile.h"

@implementation Profile

- (instancetype)initWithName:(NSString *)name andPicture:(NSString *)picture andPosition:(NSString *)position {
    
    self = [super init];
    if (self) {
        self.picture = picture;
        self.name = name;
        self.position = position;
    }
    return self;
}

@end
