//
//  RegistViewController.m
//  DumplingProject
//
//  Created by 叶刚 on 16/3/14.
//  Copyright © 2016年 dumplingproject. All rights reserved.
//

#import "RegistViewController.h"
#import "RegistView.h"
#import "AlertView.h"
@interface RegistViewController ()
{
    UIView *bgView;
    AlertView *alertview;
}
@property (nonatomic, strong) UIView  *contentView;
@property (nonatomic, strong) AlertView *alertview;
@end

@implementation RegistViewController

@synthesize alertview = _alertview;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   
    RegistView *log = [[RegistView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    self.view = log;
    
    log.backBlock = ^(BtnType type){
       
        switch (type) {
            case BtnTypeBack:
                [self.navigationController popViewControllerAnimated:YES];
                break;
            case BtnTyperegist:
                [self registAction];
                break;
                
            case BtnTypeTest:
                
                break;
            default:
                break;
        }
       
    };
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];//白色
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;//退出当前ViewController后变回黑色
}

//注册
-(void) registAction{
    NSLog(@"注册");
    _alertview = [[AlertView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
//    _alertview.delegate = self;
    _alertview.title.text = @"注册成功";
    [self.view addSubview: _alertview];
    [[_alertview.backBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        
        [self dismissContactView];
    }];
    
}


//-(void) tapRemoveViewDelegate{
//
//    [self dismissContactView];
//}


-(void)dismissContactView
{
    __weak typeof(self)weakSelf = self;
    [UIView animateWithDuration:0.5 animations:^{
        weakSelf.alertview.alpha = 0;

    } completion:^(BOOL finished) {
        [weakSelf.alertview removeFromSuperview];
       
    }];
    
}


//获取验证码
-(void) getTestNum{
    NSLog(@"获取验证码");
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
