//
//  District.m
//  MMTravel
//
//  Created by 顾新生 on 15/11/18.
//  Copyright © 2015年 super. All rights reserved.
//

#import "District.h"

@implementation District
+(JSONKeyMapper *)keyMapper{
    return [[JSONKeyMapper alloc]initWithDictionary:@{
                                                     @"id":@"dId",
                                                     @"areaId":@"districtId",
                                                     @"areaName":@"districtName"
                                                     }];
}

@end
