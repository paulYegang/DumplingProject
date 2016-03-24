//
//  LoginViewController.m
//  DumplingProject
//
//  Created by 叶刚 on 16/3/14.
//  Copyright © 2016年 dumplingproject. All rights reserved.
//
//typedef <#existing#> <#new#>;

#import "LoginViewController.h"
#import "LoginView.h"
#import "MainTabViewController.h"
#import "RegistViewController.h"
#import "ChagnePwdViewController.h"
#import "NoticeViewController.h"
@interface LoginViewController ()

@end

@implementation LoginViewController

static id _instace;
+(instancetype) shareInstanceType{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instace = [[self alloc] init];
    });
    return _instace;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   
    self.navigationController.navigationBarHidden = YES;
        LoginView *log = [[LoginView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        self.view = log;
        log.loginBlock = ^(BtnType type,LoginModel *model){
            
            switch (type) {
                case BtnTypelogin:
                    [self OpenTheHomeView];
                    break;
                case BtnTypeforget:
                    [self changePwdAction];
                    break;
                    
                case BtnTyperegist:
                    [self registBtnACtion];
                    break;
                default:
                    break;
            }
        };

      
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];//白色
}


-(void) OpenTheHomeView{
   
    [[NSNotificationCenter defaultCenter] postNotificationName:CHANGEROOTEVIERNOTICE object:nil];
//    MainTabViewController *maintab = [[MainTabViewController alloc] init];
//    [self.navigationController pushViewController:maintab animated:YES
//     ];
    
}

//修改密码action
-(void) changePwdAction{
    ChagnePwdViewController *change = [[ChagnePwdViewController alloc] init];
    [self.navigationController pushViewController:change animated:YES];
}
//注册action
-(void) registBtnACtion{

    RegistViewController *regists = [[RegistViewController alloc] init];
    [self.navigationController pushViewController:regists animated:YES];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
