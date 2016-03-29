//
//  SetGroupNameViewController.m
//  DumplingProject
//
//  Created by 顾新生 on 16/3/29.
//  Copyright © 2016年 dumplingproject. All rights reserved.
//

#import "SetGroupNameViewController.h"

@interface SetGroupNameViewController ()<UITextFieldDelegate>
@property(nonatomic,weak)UITextField *inputField;
@end

@implementation SetGroupNameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupNavi];

    //mask
    UIView *bottomView=[[UIView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:bottomView];
    bottomView.backgroundColor=[UIColor colorWithWhite:0.8 alpha:1.0];
    
    UITextField *inputField=[[UITextField alloc]init];
    [bottomView addSubview:inputField];
    [inputField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@5);
        make.height.equalTo(@40);
        make.width.equalTo(@(SCREEN_WIDTH));
        make.centerX.equalTo(@0);
        
    }];
    inputField.backgroundColor=[UIColor whiteColor];
    inputField.delegate=self;
    inputField.placeholder=_groupName;
    _inputField=inputField;
    
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(viewDidTapped)];
    [self.view addGestureRecognizer:tap];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden=!self.tabBarController.tabBar.isHidden;
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.tabBarController.tabBar.hidden=!self.tabBarController.tabBar.isHidden;
}

#pragma mark -导航条
-(void)setupNavi{
    UIBarButtonItem *rightItem=[[UIBarButtonItem alloc]initWithTitle:@"确定" style:UIBarButtonItemStylePlain target:self action:@selector(rightNaviDoneBtnClick)];
    self.navigationItem.rightBarButtonItem=rightItem;
}

-(void)rightNaviDoneBtnClick{
    self.completeBlock(_inputField.text);
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark -背景点击
-(void)viewDidTapped{
    [_inputField resignFirstResponder];
}

-(void)dealloc{
    NSLog(@"%@释放了",self);
    
}

#pragma mark -textField的代理方法
-(BOOL)textFieldShouldClear:(UITextField *)textField{
    return NO;
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    textField.text=_groupName;
    return YES;
}



@end
