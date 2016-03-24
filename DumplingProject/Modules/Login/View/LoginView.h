//
//  LoginView.h
//  DumplingProject
//
//  Created by 叶刚 on 16/3/14.
//  Copyright © 2016年 dumplingproject. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginModel.h"

typedef NS_ENUM(NSInteger,BtnType) {

    BtnTypelogin,
    BtnTyperegist,
    BtnTypeforget
};

@interface LoginView : UIView <UITextFieldDelegate>

@property (nonatomic, copy) void(^loginBlock)(BtnType,LoginModel*);

@end
