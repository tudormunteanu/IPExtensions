//
//  UIView+Positioning.h
//  SchunkTool
//
//  Created by Tudor Munteanu on 25/04/2012.
//  Copyright (c) 2012 Siller AG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Positioning)

- (void) setOrigin:(CGPoint)origin;

//
// Position an UIView relative to another UIView, at the right and 
// starting from the same y.
//
- (void) setOriginAt:(CGPoint)distancePoint rightOfView:(UIView *)view;

@end