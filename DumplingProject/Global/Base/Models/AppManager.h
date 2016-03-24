//
//  AppManager.h
//  RailPass
//
//  Created by will on 15-8-8.
//  Copyright (c) 2015年 jukui. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserModel.h"
#import "LoginVC.h"
#include <ifaddrs.h>
#include <arpa/inet.h>

@interface AppManager : NSObject

@property (nonatomic, strong) UserModel * currentUser;
@property(nonatomic,copy)NSString * LocationCityStr;        //城市
@property(nonatomic,copy)NSString * LocationStr;            //详细地址
@property(nonatomic,assign)BOOL isUserTokenValidate;
@property(nonatomic,strong)NSArray *cities;



+ (instancetype)sharedManager;
- (BOOL)isLogined;
/**
 *  正则判断email地址
 *
 *  @param email email地址
 *
 *  @return bool
 */
-(BOOL)isEmailAddress:(NSString *)email;

/**
 *  正则判断手机号
 *
 *  @param mobileNum 手机号
 *
 *  @return bool
 */
- (BOOL)isMobileNumber:(NSString *)mobileNum;

/**
 *  获取identifierForVendor
 *
 *  @return identifierForVendor
 */
-(NSString *)getDeviceToken;

/**
 *  保存当前用户
 *
 *  @param currentUser 当前用户
 */
- (void)setCurrentUser:(UserModel *)currentUser;

/**
 *  注销
 */
- (void)logout;

/**
 *  判断是否为空
 */
-(BOOL)checkIsEmpty:(NSString *)str;
-(BOOL)validateEmail:(NSString*)email;
-(NSString *)deviceIPAdress;
-(void) alertTitle:(NSString *) messages;
-(NSString *)searchDictName:(NSString *)districtId;
-(NSString *)searchAreaName:(NSString *)AreaId;
-(NSString *)searchCityName:(NSString *)CiytId;
- (NSString *)getIPAddress:(BOOL)preferIPv4;
@end
