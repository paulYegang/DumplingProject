//
//  UserModel.h
//  MMTravel
//
//  Created by 顾新生 on 15/11/5.
//  Copyright © 2015年 super. All rights reserved.
//

#define kUserLogin @"user/userLoginMobile.do" //用户登录接口
#define kUserAvatar @"user/queryUserAvatarMobile.do" //请求用户头像接口
#define kUserLogout @"user/userLogoutMobile.do" //用户退出登录接口
#define kUserSignIn @"user/userChickin.do" //用户签到接口
#import <JSONModel/JSONModel.h>
#import "BaseModel.h"

@protocol UserModel
@end


@interface UserModel : BaseModel<NSCoding>
@property(nonatomic,copy)NSString *password;
@property(nonatomic,copy)NSString *cellphone;
@property(nonatomic,copy)NSString *lastLoginTime;
@property(nonatomic,copy)NSString *email;
@end
