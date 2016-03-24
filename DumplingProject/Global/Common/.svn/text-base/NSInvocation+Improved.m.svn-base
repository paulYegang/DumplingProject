//
//  NSInvocation+Improved.m
//  RailPass
//
//  Created by will on 15-8-8.
//  Copyright (c) 2015年 jukui. All rights reserved.
//

#import "NSInvocation+Improved.h"

@implementation NSInvocation (Improved)
+ (id)invocationWithTarget:(id)target selector:(SEL)selector
{
    NSMethodSignature *methodSig = [target methodSignatureForSelector:selector];
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:methodSig];
    [invocation setTarget:target];
    [invocation setSelector:selector];
    return invocation;
}
@end
