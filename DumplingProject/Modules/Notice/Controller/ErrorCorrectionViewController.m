//
//  ErrorCorrectionViewController.m
//  DumplingProject
//
//  Created by 叶刚 on 16/3/21.
//  Copyright © 2016年 dumplingproject. All rights reserved.
//

#import "ErrorCorrectionViewController.h"
#import "AlertView.h"
@interface ErrorCorrectionViewController () <UITextViewDelegate>
@property (nonatomic, strong) AlertView *alertview;
@end

@implementation ErrorCorrectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"我要纠错";
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(keyboardHide:)];
    tapGesture.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tapGesture];
    [self setUPUI];
}

-(void)keyboardHide:(UITapGestureRecognizer*)tap{
    [_errorText resignFirstResponder];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
    self.iconImage.hidden = YES;
}

-(void) setUPUI{
    
    _errorText = [[UITextView alloc] init];
    _errorText.backgroundColor = [UIColor whiteColor];
    _errorText.layer.borderColor = [UIColor grayColor].CGColor;
    _errorText.layer.borderWidth = 0.5;
    _errorText.layer.cornerRadius = 2;
    _errorText.layer.shadowColor = [UIColor grayColor].CGColor;
    _errorText.layer.shadowOffset = CGSizeMake(2,2);
    _errorText.layer.shadowOpacity = 0.8;
    _errorText.delegate = self;

    [self.view addSubview:_errorText];
    
    [_errorText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@74);
        make.left.equalTo(@8);
        make.right.equalTo(@(-8));
        make.height.equalTo(@300);
    }];
    

    UIButton *regitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    regitBtn.backgroundColor = [UIColor clearColor];
    [regitBtn setBackgroundImage:[UIImage imageNamed:@"蓝色按钮"] forState:UIControlStateNormal];
    [regitBtn setTitle:@"提交" forState:UIControlStateNormal];
    regitBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [[regitBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        [self regitBtnAction];
    }];
    regitBtn.layer.cornerRadius = 20;
    
    [self.view addSubview:regitBtn];
    
    [regitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
    
        make.top.equalTo(_errorText.mas_bottom).offset(30);
        make.centerX.equalTo(_errorText.mas_centerX);
        make.width.equalTo(@150);
        make.height.equalTo(@40);
    }];

    
}


-(void) regitBtnAction{
    _alertview = [[AlertView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    //    _alertview.delegate = self;
    _alertview.title.text = @"提交成功";
    [self.view addSubview: _alertview];
    [[_alertview.backBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        
        [self dismissContactView];
    }];

    
}

-(void)dismissContactView
{
    __weak typeof(self)weakSelf = self;
    [UIView animateWithDuration:0.5 animations:^{
        weakSelf.alertview.alpha = 0;
        
    } completion:^(BOOL finished) {
        [weakSelf.alertview removeFromSuperview];
        
    }];
    
}
//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    [self endEditing:YES];
//}
@end
