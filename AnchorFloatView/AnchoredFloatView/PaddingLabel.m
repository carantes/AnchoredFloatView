//
//  PaddingLabel.m
//  AnchoredFloatView
//
//  Created by Carlos Eduardo Arantes Ferreira on 03/01/15.
//  Copyright (c) 2015 Mobistart. All rights reserved.
//

#import "PaddingLabel.h"

#define PADDING 10

@implementation PaddingLabel


- (void)drawTextInRect:(CGRect)rect {
    UIEdgeInsets insets = {2, PADDING, 2, PADDING};
    [super drawTextInRect:UIEdgeInsetsInsetRect(rect, insets)];
}

- (CGRect)textRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines
{
    return CGRectInset([self.attributedText boundingRectWithSize:CGSizeMake(999, 999)
                                                         options:NSStringDrawingUsesLineFragmentOrigin
                                                         context:nil], -PADDING, -2);
}

@end
