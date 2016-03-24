//
//  City.m
//  CityList
//
//  Created by 顾新生 on 15/10/14.
//  Copyright © 2015年 guxinsheng. All rights reserved.
//

#import "City.h"

@implementation City

+(JSONKeyMapper *)keyMapper{
    return [[JSONKeyMapper alloc]initWithDictionary:@{
                                                     @"id":@"cId",
                                                     }];
}

+(instancetype)cityWithDict:(NSDictionary *)dict{
    City *newCity=[[City alloc]init];
    [newCity setValuesForKeysWithDictionary:dict];
    return newCity;
}

-(NSString *)description{
    return [NSString stringWithFormat:@"name:%@--ename:%@---initial:%@",_cityName ,_cityEname,_cityInitial];
}
@end
