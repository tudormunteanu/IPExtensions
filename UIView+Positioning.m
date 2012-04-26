//
//  UIView+Positioning.m
//  SchunkTool
//
//  Created by Tudor Munteanu on 25/04/2012.
//  Copyright (c) 2012 Siller AG. All rights reserved.
//

#import "UIView+Positioning.h"

@implementation UIView (Positioning)

- (void) setOrigin:(CGPoint)origin {
    
    [self setFrame:CGRectMake(origin.x, origin.y, self.frame.size.width, self.frame.size.height)];
}

- (void) setOriginAt:(CGPoint)distancePoint rightOfView:(UIView *)view {
    
    [self setFrame:CGRectMake(view.frame.origin.x + view.frame.size.width + distancePoint.x, 
                              view.frame.origin.y + distancePoint.y, 
                              self.frame.size.width, 
                              self.frame.size.height)];
}

@end
