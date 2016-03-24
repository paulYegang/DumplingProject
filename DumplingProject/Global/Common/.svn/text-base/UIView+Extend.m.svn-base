//
//  UIView+Extend.m
//  MMTravel
//
//  Created by 顾新生 on 15/9/29.
//  Copyright © 2015年 super. All rights reserved.
//

#import "UIView+Extend.h"

@implementation UIView (Extend)

- (UIViewController*)viewController {
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}

@end
