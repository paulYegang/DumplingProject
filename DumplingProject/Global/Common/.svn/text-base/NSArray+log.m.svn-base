//
//  NSArray+log.m
//  MMTravel
//
//  Created by 顾新生 on 15/11/6.
//  Copyright © 2015年 super. All rights reserved.
//

#import "NSArray+Log.h"

@implementation NSArray (Log)

- (NSString *)descriptionWithLocale:(id)locale
{
    NSMutableString *strM = [NSMutableString stringWithString:@"(\n"];
    
    for (id obj in self) {
        [strM appendFormat:@"\t%@,\n", obj];
    }
    
    [strM appendString:@")\n"];
    
    return strM;
}


@end
