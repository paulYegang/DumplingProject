//
//  DataHandler.m
//  CityList
//
//  Created by 顾新生 on 15/10/14.
//  Copyright © 2015年 guxinsheng. All rights reserved.
//

#import "DataHandler.h"
#import "City.h"

@implementation DataHandler


/**
 *  城市比较方法
 */
NSInteger cityNameSort(id user1, id user2, void *context)
{
    City *u1,*u2;
    //类型转换
    u1 = (City*)user1;
    u2 = (City*)user2;
    return  [u1.cityEname localizedCompare:u2.cityEname];
}
/**
 *  实例化(单例）
 *
 *  @return 返回一个对象
 */
+(instancetype)handler{
    static DataHandler *handler;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        handler=[[DataHandler alloc]init];
    });
    return handler;
}
-(instancetype)initWithArray:(NSArray *)cities{
    DataHandler *handler=[DataHandler handler];
    handler.cities=cities;
    handler.citiesSorted=[handler getCitiesSortByName];
    handler.letters=[handler getCityLetters];
    handler.citiesGrouped=[handler getCitiesGrouped];
    return handler;
}
/**
 *  字典转模型
 *
 *  @return 转为模型数组
 */
//-(NSArray *)getCities{
//    NSArray *dictArr=[self loadData];
//    NSMutableArray *cities=[NSMutableArray array];
//    for (NSDictionary *dict in dictArr) {
//        City *newCity=[City cityWithDict:dict];
//        [cities addObject:newCity];
//    }
//    return cities;
//}

/**
 *  加载数组
 *
 *  @return 城市字典数组
 */
//-(NSArray *)loadData{
//    NSString *path=[[NSBundle mainBundle]pathForResource:@"city.json" ofType:nil];
//    NSData *data=[NSData dataWithContentsOfFile:path];
//    NSArray *citiesDictArr=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
//    return citiesDictArr;
//}

/**
 *  按照名称排序
 *
 *  @return 按照名称排序的城市数组
 */
-(NSArray *)getCitiesSortByName{
    return [self getCitiesSortByNameWithArray:[self cities]];
}
-(NSArray *)getCitiesSortByNameWithArray:(NSArray *)arr{
    NSArray *cities=arr;
    NSArray *newArr=[cities sortedArrayUsingFunction:cityNameSort context:nil];
    
    return newArr;
}

/**
 *  城市首字母的数组（已经排好序）
 *
 *  @return 城市首字母的数组
 */
-(NSArray *)getCityLetters{
    NSMutableArray *letters=[NSMutableArray array];
    for (City *city in self.citiesSorted) {
        unichar character=[city.cityEname characterAtIndex:0];
        NSString *letter=[NSString stringWithCharacters:&character length:1];
        if (![letters containsObject:letter]){
            [letters addObject:letter];
        }else continue;
    }
    return letters;
}

/**
 *  按照城市首字母分组的数组
 *
 *  @return 按照城市首字母分组的数组
 */
-(NSArray *)getCitiesGrouped{
    NSMutableArray *citiesGrouped=[NSMutableArray array];
    for (NSString *letter in self.letters) {
        NSMutableArray *cities=[NSMutableArray array];
        for (City *city in self.citiesSorted) {
            if ([city.cityEname hasPrefix:letter]) {
                [cities addObject:city];
            }
        }
        NSDictionary *dict=[NSDictionary dictionaryWithObject:cities forKey:letter];
        [citiesGrouped addObject:dict];
    }
    return citiesGrouped;
}


@end
