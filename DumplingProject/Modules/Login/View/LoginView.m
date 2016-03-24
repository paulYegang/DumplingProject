//
//  LoginView.m
//  DumplingProject
//
//  Created by 叶刚 on 16/3/14.
//  Copyright © 2016年 dumplingproject. All rights reserved.
//

#import "LoginView.h"

@implementation LoginView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

 */

-(instancetype) initWithFrame:(CGRect)frame{
    if (self== [super initWithFrame:frame]) {
        [self setUpUi];
    }
    return self;
}

//初始化界面控件
-(void) setUpUi{
     self.backgroundColor = [UIColor colorWithRed:235/256.0 green:241/256.0 blue:240/256.0 alpha:1];
    //背景
    UIView *back = [[UIView alloc] init];
    back.backgroundColor = [UIColor whiteColor];
    back.layer.cornerRadius = 2;
    back.layer.shadowColor = [UIColor grayColor].CGColor;
    back.layer.shadowOffset = CGSizeMake(0,2);
    back.layer.shadowOpacity = 0.5;
    [self addSubview:back];
    [back mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.centerY.equalTo(self.mas_centerY);
        make.width.equalTo(@(SCREEN_WIDTH-60));
        make.height.equalTo(@320);
        
    }];
    CGFloat width = (SCREEN_WIDTH-60)/3;
    
    UIImageView *iconImage1 = [[UIImageView alloc] init];
    iconImage1.backgroundColor = [UIColor whiteColor];
    iconImage1.layer.cornerRadius = (width+15)*0.5;
    iconImage1.layer.borderColor = [UIColor colorWithWhite:0.8 alpha:0.5].CGColor;
    iconImage1.layer.borderWidth =0.5;
    iconImage1.layer.shadowColor = [UIColor grayColor].CGColor;
    iconImage1.layer.shadowOffset = CGSizeMake(0,2);
    iconImage1.layer.shadowOpacity = 0.5;
    //    iconImage1.image  = [UIImage imageNamed:@"_0000_叹号"];
    [self addSubview:iconImage1];
    [iconImage1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.equalTo(@(width+15));
        make.centerY.equalTo(back.mas_top).offset(-15);
        make.centerX.equalTo(@0);
    }];
    
    //头像
    
    UIImageView *iconImage = [[UIImageView alloc] init];
    iconImage.backgroundColor = [UIColor whiteColor];
    iconImage.layer.cornerRadius = width*0.5;
    iconImage.layer.borderColor = [UIColor colorWithWhite:0.8 alpha:0.5].CGColor;
    iconImage.layer.borderWidth =0.5;
    iconImage.layer.shadowColor = [UIColor grayColor].CGColor;
    iconImage.layer.shadowOffset = CGSizeMake(0,2);
    iconImage.layer.shadowOpacity = 0.5;

    iconImage.image  = [UIImage imageNamed:@"_0000_叹号"];
    [self addSubview:iconImage];
    [iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.equalTo(@(width));
        make.centerY.equalTo(back.mas_top).offset(-15);
        make.centerX.equalTo(@0);
    }];
    
    UITextField *textfield = [[UITextField alloc] init];
    //    [textfield setBackgroundColor: [UIColor colorWithPatternImage:[UIImage imageNamed:@"_0003_账号密码框"]]];
    textfield.placeholder = @"手机号";
    textfield.delegate = self;
    textfield.adjustsFontSizeToFitWidth = YES;
    textfield.borderStyle = UITextBorderStyleRoundedRect;
    textfield.layer.borderColor = [UIColor grayColor].CGColor;
    textfield.layer.borderWidth = 0.5;
    textfield.layer.cornerRadius = 5;
    textfield.keyboardType = UIKeyboardTypeNumberPad;
    [back addSubview:textfield];
  
    [textfield mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo (@20);
        make.right.equalTo(@(-20));
        make.height.equalTo(@40);
        make.top.equalTo(@70);
    }];
    //
    
    UITextField *textfield1 = [[UITextField alloc] init];
    //    [textfield setBackgroundColor: [UIColor colorWithPatternImage:[UIImage imageNamed:@"_0003_账号密码框"]]];
    textfield1.placeholder = @"密码";
    textfield1.delegate = self;
    //    textfield1.borderStyle = UITextBorderStyleRoundedRect;
    textfield1.layer.borderColor = [UIColor grayColor].CGColor;
    textfield1.layer.borderWidth = 0.5;
    textfield1.layer.cornerRadius = 5;
    textfield1.secureTextEntry = YES;
    [back addSubview:textfield1];
    textfield1.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 8, 0)];
    textfield1.leftViewMode = UITextFieldViewModeAlways;
    [textfield1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo (@20);
        make.right.equalTo(@(-20));
        make.height.equalTo(@40);
        make.top.equalTo(textfield.mas_bottom).offset(30);
    }];
    
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    loginBtn.backgroundColor = [UIColor clearColor];
    [loginBtn setBackgroundImage:[UIImage imageNamed:@"登陆注册等按钮"] forState:UIControlStateNormal];
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [[loginBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        if (self.loginBlock) {
            self.loginBlock(BtnTypelogin,nil);
        }
    }];
    [back addSubview:loginBtn];
    
    [loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@65);
        make.right.equalTo(@(-65));
        make.height.equalTo(@45);
        make.bottom.equalTo(@(-30));
    }];
    
    
    UIButton *forgetPwd = [UIButton buttonWithType:UIButtonTypeCustom];
    forgetPwd.backgroundColor = [UIColor clearColor];
    [forgetPwd setBackgroundImage:[UIImage imageNamed:@"_0001_忘记密码_注册按钮"] forState:UIControlStateNormal];
    [forgetPwd setTitle:@"忘记密码" forState:UIControlStateNormal];
    [self addSubview:forgetPwd];
    
    [[forgetPwd rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        if (self.loginBlock) {
            self.loginBlock(BtnTypeforget,nil);
        }
    }];

    [forgetPwd mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@20);
        make.width.equalTo(@100);
        make.height.equalTo(@33);
        make.bottom.equalTo(@(-20));
    }];
    
    
    UIButton *registBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    registBtn.backgroundColor = [UIColor clearColor];
    [registBtn setBackgroundImage:[UIImage imageNamed:@"_0001_忘记密码_注册按钮"] forState:UIControlStateNormal];
    [registBtn setTitle:@"注册" forState:UIControlStateNormal];
    [self addSubview:registBtn];
    [[registBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        if (self.loginBlock) {
            self.loginBlock(BtnTyperegist,nil);
        }
    }];

    [registBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        //        make.left.equalTo(@65);
        make.right.equalTo(@(-20));
        make.width.equalTo(@100);
        make.height.equalTo(@33);
        make.bottom.equalTo(@(-20));
    }];
    
    
    
}
//创建imageView
-(UIImageView*) createImage:(NSString *) image view:(UIView*) views{
    UIImageView *back = [[UIImageView alloc] init];
    back.backgroundColor = [UIColor clearColor];
    back.image = [UIImage imageNamed:image];
    [views addSubview:back];
    
    return back;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self endEditing:YES];
}
@end
