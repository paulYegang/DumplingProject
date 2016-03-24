//
//  DataHandler.h
//  CityList
//  城市列表数据处理
//  Created by 顾新生 on 15/10/14.
//  Copyright © 2015年 guxinsheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataHandler : NSObject
/**
 *  城市首字母
 */
@property(nonatomic,strong)NSArray *letters;
/**
 *  所有城市列表
 */
@property(nonatomic,strong)NSArray *cities;
/**
 *  按照名称排序后的城市
 */
@property(nonatomic,strong)NSArray *citiesSorted;
@property(nonatomic,strong)NSArray *citiesGrouped;





+(instancetype)handler;
-(instancetype)initWithArray:(NSArray *)cities;
-(NSArray *)getCitiesSortByNameWithArray:(NSArray *)arr;
@end
