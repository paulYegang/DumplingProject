//
//  City.h
//  CityList
//
//  Created by 顾新生 on 15/10/14.
//  Copyright © 2015年 guxinsheng. All rights reserved.
//  JSON:{"label":"北京Beijing010","name":"北京","pinyin":"Beijing","zip":"010"}
//

#import <Foundation/Foundation.h>
#import <JSONModel.h>
@interface City : JSONModel

@property(nonatomic,copy)NSString *cId;
@property(nonatomic,copy)NSString *cityId;
@property(nonatomic,copy)NSString *cityName;
@property(nonatomic,copy)NSString *cityEname;
@property(nonatomic,copy)NSString *cityInitial;
@property(nonatomic,copy)NSString *provinceId;
@property(nonatomic,copy)NSString *showOrder;

+(instancetype)cityWithDict:(NSDictionary *)dict;
@end
