//
//  UIView+Positioning.m
//  SchunkTool
//
//  Created by Tudor Munteanu on 25/04/2012.
//  Copyright (c) 2012 Siller AG. All rights reserved.
//

#import "UIView+Positioning.h"

@implementation UIView (Positioning)

- (void) moveOriginTo:(CGPoint)origin {
    
    [self setFrame:CGRectMake(origin.x, origin.y, self.frame.size.width, self.frame.size.height)];
}

- (void) moveOriginTo:(CGPoint)distancePoint rightOfView:(UIView *)view {
    
    [self setFrame:CGRectMake(view.frame.origin.x + view.frame.size.width + distancePoint.x, 
                              view.frame.origin.y + distancePoint.y, 
                              self.frame.size.width, 
                              self.frame.size.height)];
}

- (void) moveToPoint:(CGPoint)point {
    
    CGRect thisFrame = self.frame;
    thisFrame.origin = point;
    self.frame = thisFrame;
    
}

- (void) moveToPoint:(CGPoint)point offset:(CGSize)offset {
    CGRect thisFrame = self.frame;
    thisFrame.origin = point;
    thisFrame.origin.x += offset.width;
    thisFrame.origin.y += offset.height;
    self.frame = thisFrame;
}

- (void) moveXBy:(float)offset {
    
    CGRect thisFrame = self.frame;
    thisFrame.origin.x += offset;
    self.frame = thisFrame;
}

- (void) moveYBy:(float)offset {
    
    CGRect thisFrame = self.frame;
    thisFrame.origin.y += offset;
    self.frame = thisFrame;
}

- (void) appendToView:(UIView *)view margin:(float)margin {
    
    CGRect thisFrame = self.frame;
    thisFrame.origin.y = [view bottom] + margin;
    thisFrame.origin.x = view.frame.origin.x;
    self.frame = thisFrame;
}

- (void) addToRightOfView:(UIView *)view withMargin:(float)margin {
    
    CGRect frame = self.frame;
    frame.origin.y = view.frame.origin.y;
    frame.origin.x = view.frame.origin.x + view.frame.size.width + margin;
    self.frame = frame;
}

- (float) bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void) expandToBottom {
    CGRect thisFrame = self.frame;
    thisFrame.size.height = self.superview.frame.size.height - thisFrame.origin.y;
    self.frame = thisFrame;
}

- (void) moveToBottomWithMargin:(float)margin {
    CGRect thisFrame = self.frame;
    thisFrame.origin.y = self.superview.frame.size.height - thisFrame.size.height - margin;
    self.frame = thisFrame;
}

- (void) adjustX:(CGFloat)x {
    CGRect thisFrame = self.frame;
    thisFrame.origin.x = x;
    self.frame = thisFrame;
}

- (void) adjustY:(CGFloat)y {
    
    CGRect thisFrame = self.frame;
    thisFrame.origin.y = y;
    self.frame = thisFrame;
}

- (void) expandWidth:(float)width {
    CGRect thisFrame = self.frame;
    thisFrame.size.width +=width;
    self.frame = thisFrame;
}

- (void) expandHeightBy:(float)height {
    CGRect thisFrame = self.frame;
    thisFrame.size.height +=height;
    self.frame = thisFrame;
}

- (void) adjustWidthTo:(float)width {
    
    CGRect thisFrame = self.frame;
    thisFrame.size.width = width;
    self.frame = thisFrame;    
}

- (void) alignRightWithMargin:(float)margin {
    
    CGRect thisFrame = self.frame;
    thisFrame.origin.x = self.superview.frame.size.width - thisFrame.size.width - margin;
    self.frame = thisFrame;
}

- (CGPoint) pointAfterFrameWithOffset:(CGSize)offset {
    CGRect thisFrame = self.frame;
    return CGPointMake(thisFrame.origin.x + thisFrame.size.width + offset.width, thisFrame.origin.y + offset.height);
}

- (void) adjustHeightTo:(float)height {
    CGRect thisFrame = self.frame;
    thisFrame.size.height = height;
    self.frame = thisFrame;   
}

- (void) showAnimated:(BOOL)animated completion:(void (^)(void))completionBlock {
    
    __block CGRect thisFrame = self.frame;
    
    float duration = 0;
    
    if (animated) duration = 0.35;
    
    thisFrame.origin.y = self.superview.bounds.size.height;
    self.frame = thisFrame;
    
    [UIView animateWithDuration:duration delay:0 options:0 animations:^{
        thisFrame.origin.y = self.superview.bounds.size.height - thisFrame.size.height;
        self.frame = thisFrame;
    } completion:^(BOOL finished) {
        completionBlock();
    }];
}

- (void) hideAnimated:(BOOL)animated completion:(void (^)(void))completionBlock {
    
    __block CGRect thisFrame = self.frame;
    
    float duration = 0;
    
    if (animated) duration = 0.35;
    
    [UIView animateWithDuration:duration delay:0 options:0 animations:^{
        thisFrame.origin.y = self.superview.bounds.size.height;
        self.frame = thisFrame;
    } completion:^(BOOL finished) {
        completionBlock();
    }];
}

@end
