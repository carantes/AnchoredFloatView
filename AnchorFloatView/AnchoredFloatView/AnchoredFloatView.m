//
//  AnchoredFloatView.m
//  AnchoredFloatView
//
//  Created by Carlos Eduardo Arantes Ferreira on 03/01/15.
//  Copyright (c) 2015 Mobistart. All rights reserved.
//

#import "AnchoredFloatView.h"
#import "PaddingLabel.h"

@interface AnchoredFloatView ()

@property (nonatomic, strong) PaddingLabel *messageLabel;
@property (nonatomic, strong) UIImageView *directionImageView;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSIndexPath *targetIndexPath;

@end

@implementation AnchoredFloatView

static const NSInteger DEFAULT_HEIGHT = 30;
//static const NSInteger DEFAULT_MARGIN_X = 50;
static const NSInteger DEFAULT_MARGIN_Y = 5;


- (id)initWithTableView:(UITableView *)tableView andTargetIndexPath:(NSIndexPath *)targetIndexPath
{
    self = [super initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, DEFAULT_HEIGHT)];
    
    if (self) {
    
        if (![tableView isKindOfClass:[UITableView class]]) return nil;
        
        self.tableView = tableView;
        self.targetIndexPath = targetIndexPath;
        
        [self.tableView addObserver:self
                             forKeyPath:@"contentOffset"
                                options:0
                                context:NULL];
        
        [self setupViews];
    }
    
    
    return self;
}


- (void)dealloc
{
    if (self.tableView) {
        [self.tableView removeObserver:self forKeyPath:@"contentOffset"];
    }
}

- (void)layoutSubviews {

    [super layoutSubviews];

    self.messageLabel.frame = self.bounds;
    [self.messageLabel sizeToFit];
    self.messageLabel.center = CGPointMake(self.center.x - self.frame.origin.x, self.center.y- self.frame.origin.y);
}


- (void)setupViews
{
    self.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    self.backgroundColor = [UIColor clearColor];
    self.alpha = 0;
}

- (PaddingLabel *)messageLabel {
    
    if (!_messageLabel) {
        _messageLabel = [[PaddingLabel alloc] initWithFrame:self.frame];
        _messageLabel.lineBreakMode = NSLineBreakByWordWrapping;
        _messageLabel.textAlignment = NSTextAlignmentCenter;
        _messageLabel.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.7];
        //[_messageLabel addTarget:self action:@selector(messageButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [_messageLabel.layer setMasksToBounds:YES];
        _messageLabel.layer.cornerRadius = 10.0f;
        _messageLabel.clipsToBounds = YES;
        
        _directionImageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 2, 20, 20)];
        
        [_messageLabel addSubview:_directionImageView];
        [_messageLabel layoutIfNeeded];
        
        [_messageLabel setUserInteractionEnabled:YES];
        UITapGestureRecognizer *labelTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(floatViewClick:)];
        [_messageLabel addGestureRecognizer:labelTap];
        
        [self addSubview:_messageLabel];
    }
    
    return _messageLabel;
}

- (void)setMessage:(NSString *)message
{
    
    //image space
    _message = [NSString stringWithFormat:@"    %@", message];
    
    
    NSMutableAttributedString *messageString = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@", _message]];
    
    [messageString addAttributes:@{
                                   NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue-thin" size:18],
                                   NSForegroundColorAttributeName: [UIColor whiteColor]
                                   }
                           range:NSMakeRange(0, messageString.length)];
    
    [self.messageLabel setAttributedText:messageString];
    
    [self.messageLabel sizeToFit];
    
    CGRect newFrame = self.messageLabel.frame;
    newFrame.size.height = DEFAULT_HEIGHT;
    
    self.messageLabel.frame = newFrame;
    
    [self.messageLabel setCenter:CGPointMake(self.frame.size.width/2, self.frame.size.height/2)];
    
    [self startSplashAnimation];
}

- (void)floatViewClick:(id)sender {
    
    [self.tableView scrollToRowAtIndexPath:self.targetIndexPath
                         atScrollPosition:UITableViewScrollPositionMiddle
                                 animated:YES];
}

- (void)startSplashAnimation {
    [self setAlpha:1.f];
    
    // Create a basic animation changing the transform.scale value
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    
    // Set the initial and the final values
    [scaleAnimation setFromValue:[NSNumber numberWithFloat:1.0f]];
    [scaleAnimation setToValue:[NSNumber numberWithFloat:1.3f]];
    [scaleAnimation setAutoreverses:YES];
    [scaleAnimation setRepeatCount:1.0];
    
    // Set duration
    [scaleAnimation setDuration:0.1f];
    
    [scaleAnimation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
    
    // Set animation to be consistent on completion
    [scaleAnimation setRemovedOnCompletion:NO];
    [scaleAnimation setFillMode:kCAFillModeForwards];
    
    // Add animation to the view's layer
    [[self layer] addAnimation:scaleAnimation forKey:@"scale"];
}


#pragma mark - KVO

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context {
    if (([keyPath isEqualToString:@"frame"]) || ([keyPath isEqualToString:@"contentOffset"])) {
        [self adjustFloatingViewFrame];
        [self findRowByPosition];
    }
}

- (void)adjustFloatingViewFrame
{
    CGRect newFrame = self.frame;
    
    newFrame.origin.x = self.center.x - (self.bounds.size.width/2.0);
    newFrame.origin.y = self.tableView.contentOffset.y + CGRectGetHeight(self.tableView.bounds) - (CGRectGetHeight(self.bounds)+DEFAULT_MARGIN_Y);
    
    self.frame = newFrame;
    [self.tableView bringSubviewToFront:self];
}

- (void)findRowByPosition {
    
    CGPoint startVisiblePoint = self.tableView.contentOffset;
    //startVisiblePoint.y += self.tableView.rowHeight;
    
    CGPoint endVisiblePoint = self.tableView.contentOffset;
    endVisiblePoint.y += CGRectGetHeight(self.tableView.bounds);
    
    NSIndexPath *startIndexPath = [self.tableView indexPathForRowAtPoint:startVisiblePoint];
    NSIndexPath *finishIndexPath = [self.tableView indexPathForRowAtPoint:endVisiblePoint];
    
    if ((self.targetIndexPath.row >= startIndexPath.row) && (self.targetIndexPath.row <= finishIndexPath.row)) {
        self.alpha = 0;
    }
    else {
        if (self.alpha == 0) {
            
            NSString *message;
            UIImage *imageDirection;
            
            if (self.targetIndexPath.row < startIndexPath.row) {
                message = NSLocalizedString(@"float-view-up-message", nil);
                imageDirection = [UIImage imageNamed:@"arrow_up"];
            }
            else {
                message = NSLocalizedString(@"float-view-down-message", nil);
                imageDirection = [UIImage imageNamed:@"arrow_down"];
            }
            
            [self setMessage:message];
            [self.directionImageView setImage:imageDirection];
        }
    }
}


@end
