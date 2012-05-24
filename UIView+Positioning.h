//
//  UIView+Positioning.h
//  SchunkTool
//
//  Created by Tudor Munteanu on 25/04/2012.
//  Copyright (c) 2012 Siller AG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Positioning)

//
// Adjusting positions and sizes of UIViews
//
- (void) alignRightWithMargin:(float)margin;
- (void) adjustWidthTo:(float)width;
- (void) adjustHeightTo:(float)height;
- (void) adjustX:(CGFloat)x;
- (void) adjustY:(CGFloat)y;
- (void) expandHeightBy:(float)height;
- (void) expandToBottom;
- (void) expandWidth:(float)width;
- (void) moveOriginTo:(CGPoint)origin;
- (void) moveToPoint:(CGPoint)point;
- (void) moveToPoint:(CGPoint)point offset:(CGSize)offset;
- (void) moveXBy:(float)offset;
- (void) moveYBy:(float)offset;
- (void) moveToBottomWithMargin:(float)margin;

//
// Positioning UIViews relative to other UIViews
//
- (void) moveOriginTo:(CGPoint)distancePoint rightOfView:(UIView *)view;
- (void) appendToView:(UIView *)view margin:(float)margin;
- (void) appendToView:(UIView *)view margin:(float)margin;
- (void) addToRightOfView:(UIView *)view withMargin:(float)margin;


//
// Animations
//
- (void) showAnimated:(BOOL)animated completion:(void (^)(void))completionBlock;
- (void) hideAnimated:(BOOL)animated completion:(void (^)(void))completionBlock;


//
// Information about UIViews
//
- (CGPoint) pointAfterFrameWithOffset:(CGSize)offset;
- (float) bottom;

@end