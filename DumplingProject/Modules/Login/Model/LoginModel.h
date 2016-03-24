//
//  LoginModel.h
//  DumplingProject
//
//  Created by 叶刚 on 16/3/14.
//  Copyright © 2016年 dumplingproject. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface LoginModel : JSONModel

@property (nonatomic, strong) NSString *phoneNum;
@property (nonatomic, strong) NSString *password;

@end
