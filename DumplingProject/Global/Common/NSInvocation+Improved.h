//
//  NSInvocation+Improved.h
//  RailPass
//
//  Created by will on 15-8-8.
//  Copyright (c) 2015年 jukui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSInvocation (Improved)
+ (id)invocationWithTarget:(id)target selector:(SEL)selector;
@end
