//
//  RegistView.m
//  DumplingProject
//
//  Created by 叶刚 on 16/3/14.
//  Copyright © 2016年 dumplingproject. All rights reserved.
//

#import "changePwdView.h"

@implementation changePwdView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


-(instancetype) initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
         self.backgroundColor = [UIColor colorWithRed:235/256.0 green:241/256.0 blue:240/256.0 alpha:1];
        [self setUpUI];
    }
    return self;
}


-(void) setUpUI{
    
    UILabel *title = [[UILabel alloc] init];
    title.text = @"修改密码";
    title.font = [UIFont boldSystemFontOfSize:19];
    title.backgroundColor = [UIColor clearColor];
    [self addSubview:title];
    
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@30);
        make.centerX.equalTo(@0);
        make.height.equalTo(@30);
        
    }];
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.backgroundColor = [UIColor clearColor];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"_0002_返回"] forState:UIControlStateNormal];
//    [acceptBtn setTitle:@"接受" forState:UIControlStateNormal];
    backBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [self addSubview:backBtn];
    [[backBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        if (self.backBlock) {
            self.backBlock(BtnTypeBack);
        }
    }];
    
    [backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(title.mas_centerY);
        make.left.equalTo(@10);
        make.width.height.equalTo(@20);
       
    }];
    
    UIView *back = [[UIView alloc] init];
    back.backgroundColor = [UIColor whiteColor];
    back.layer.cornerRadius = 2;
    back.layer.shadowColor = [UIColor grayColor].CGColor;
    back.layer.shadowOffset = CGSizeMake(1,2);
    back.layer.shadowOpacity = 0.5;
    [self addSubview:back];
    [back mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.centerY.equalTo(self.mas_centerY).offset(-20);
        make.width.equalTo(@(SCREEN_WIDTH-80));
        make.height.equalTo(@310);
        
    }];
    
    UITextField *textfield1 = [[UITextField alloc] init];
    //    [textfield setBackgroundColor: [UIColor colorWithPatternImage:[UIImage imageNamed:@"_0003_账号密码框"]]];
    textfield1.placeholder = @"手机号码";
    textfield1.delegate = self;
    //    textfield1.borderStyle = UITextBorderStyleRoundedRect;
    textfield1.layer.borderColor = [UIColor grayColor].CGColor;
    textfield1.layer.borderWidth = 0.5;
    textfield1.layer.cornerRadius = 2;
    textfield1.font = [UIFont systemFontOfSize:14];
//    textfield1.secureTextEntry = YES;
    [back addSubview:textfield1];
    textfield1.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 8, 0)];
    textfield1.leftViewMode = UITextFieldViewModeAlways;
    [textfield1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo (@10);
        make.right.equalTo(@(-10));
        make.height.equalTo(@35);
        make.top.equalTo(@20);
    }];


    UITextField *textfield2 = [[UITextField alloc] init];
    //    [textfield setBackgroundColor: [UIColor colorWithPatternImage:[UIImage imageNamed:@"_0003_账号密码框"]]];
    textfield2.placeholder = @"验证码";
    textfield2.delegate = self;

    //    textfield1.borderStyle = UITextBorderStyleRoundedRect;
    textfield2.layer.borderColor = [UIColor grayColor].CGColor;
    textfield2.layer.borderWidth = 0.5;
    textfield2.layer.cornerRadius = 2;
    //    textfield1.secureTextEntry = YES;
     textfield2.font = [UIFont systemFontOfSize:14];
    [back addSubview:textfield2];
    textfield2.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 8, 0)];
    textfield2.leftViewMode = UITextFieldViewModeAlways;
    [textfield2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo (@10);
        make.right.equalTo(@(-10));
        make.height.equalTo(@35);
        make.top.equalTo(textfield1.mas_bottom).offset(20);
    }];
    
    UIButton *testBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    testBtn.backgroundColor = [UIColor clearColor];
    [testBtn setBackgroundImage:[UIImage imageNamed:@"_0000_获取验证码按钮"] forState:UIControlStateNormal];
//    [testBtn setTitle:@"接受" forState:UIControlStateNormal];
    testBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [back addSubview:testBtn];
    [[testBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        if (self.backBlock) {
            self.backBlock(BtnTypeTest);
        }
    }];
    
    [testBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(textfield2.mas_centerY);
        make.right.equalTo(@(-15));
        make.height.equalTo(@25);
        make.width.height.equalTo(@80);
        
    }];

    
    
    

    UITextField *textfield3 = [[UITextField alloc] init];
    //    [textfield setBackgroundColor: [UIColor colorWithPatternImage:[UIImage imageNamed:@"_0003_账号密码框"]]];
    textfield3.placeholder = @"新密码";
    textfield3.delegate = self;
    //    textfield1.borderStyle = UITextBorderStyleRoundedRect;
    textfield3.layer.borderColor = [UIColor grayColor].CGColor;
    textfield3.layer.borderWidth = 0.5;
    textfield3.layer.cornerRadius = 2;
    //    textfield1.secureTextEntry = YES;
     textfield3.font = [UIFont systemFontOfSize:14];
    [back addSubview:textfield3];
    textfield3.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 8, 0)];
    textfield3.leftViewMode = UITextFieldViewModeAlways;
    [textfield3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo (@10);
        make.right.equalTo(@(-10));
        make.height.equalTo(@35);
        make.top.equalTo(textfield2.mas_bottom).offset(20);
    }];

    UITextField *textfield4 = [[UITextField alloc] init];
    //    [textfield setBackgroundColor: [UIColor colorWithPatternImage:[UIImage imageNamed:@"_0003_账号密码框"]]];
    textfield4.placeholder = @"确认新密码";
    textfield4.delegate = self;
    //    textfield1.borderStyle = UITextBorderStyleRoundedRect;
    textfield4.layer.borderColor = [UIColor grayColor].CGColor;
    textfield4.layer.borderWidth = 0.5;
    textfield4.layer.cornerRadius = 2;
    //    textfield1.secureTextEntry = YES;
     textfield4.font = [UIFont systemFontOfSize:14];
    [back addSubview:textfield4];
    textfield4.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 8, 0)];
    textfield4.leftViewMode = UITextFieldViewModeAlways;
    [textfield4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo (@10);
        make.right.equalTo(@(-10));
        make.height.equalTo(@35);
        make.top.equalTo(textfield3.mas_bottom).offset(20);

    }];

    
    UIButton *registBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    registBtn.backgroundColor = [UIColor clearColor];
    [registBtn setBackgroundImage:[UIImage imageNamed:@"登陆注册等按钮"] forState:UIControlStateNormal];
    [registBtn setTitle:@"确认" forState:UIControlStateNormal];
    registBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [back addSubview:registBtn];
    [[registBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        if (self.backBlock) {
            self.backBlock(BtnTypeChange);
        }
    }];
    
    [registBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo (@40);
        make.right.equalTo(@(-40));
        make.height.equalTo(@40);
        make.top.equalTo(textfield4.mas_bottom).offset(20);

        
    }];

}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self endEditing:YES];
}
@end
