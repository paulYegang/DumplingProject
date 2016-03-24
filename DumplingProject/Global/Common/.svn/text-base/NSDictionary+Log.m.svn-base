//
//  NSDictionary+Log.m
//  CityList
//
//  Created by 顾新生 on 15/10/14.
//  Copyright © 2015年 guxinsheng. All rights reserved.
//

#import "NSDictionary+Log.h"

@implementation NSDictionary (Log)
- (NSString *)descriptionWithLocale:(id)locale{
    NSArray *allKeys = [self allKeys];
    NSMutableString *str = [[NSMutableString alloc] initWithFormat:@"{\t\n "];
    for (NSString *key in allKeys) {
        id value= self[key];
        [str appendFormat:@"\t \"%@\" = %@,\n",key, value];
    }
    [str appendString:@"}"];
    return str;
}
@end
