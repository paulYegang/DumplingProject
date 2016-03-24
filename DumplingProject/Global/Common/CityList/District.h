//
//  District.h
//  MMTravel
//
//  Created by 顾新生 on 15/11/18.
//  Copyright © 2015年 super. All rights reserved.
//

//商圈
#import <JSONModel/JSONModel.h>

@interface District : JSONModel
@property(nonatomic,copy)NSString *dId;
@property(nonatomic,copy)NSString *districtId;
@property(nonatomic,copy)NSString *districtName;
@property(nonatomic,copy)NSString *cityId;

@end
