//
//  BaseModel.h
//  
//
//  Created by liujukui on 15/6/8.
//  Copyright (c) 2015年 jukui. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JSONModel.h>

@interface BaseModel : JSONModel<NSCoding>

/**
 *  userToken 是用来判断当前登录用户是否被服务器安排下线，deviceToken是手持设备编号
 */
@property(nonatomic,copy)NSString *userToken;
/**
 *  Description
 */
@property(nonatomic,copy)NSString *userId;
@property(nonatomic,copy)NSString *username;
@property(nonatomic,copy)NSString *userPhone;
@property(nonatomic,copy)NSString *deviceToken;
@property(nonatomic,copy)NSString *deviceType;
@property(nonatomic,copy)NSString *alias;

@end
