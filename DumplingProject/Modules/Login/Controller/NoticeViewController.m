//
//  NoticeViewController.m
//  DumplingProject
//
//  Created by 叶刚 on 16/3/14.
//  Copyright © 2016年 dumplingproject. All rights reserved.
//

#import "NoticeViewController.h"
#import "KSGuideManager.h"
#import "WelcomeViewController.h"
#import "NoticeView.h"
@interface NoticeViewController ()

@end

@implementation NoticeViewController


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

    NoticeView *notice = [[NoticeView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    self.view = notice;
    notice.actionBLock = ^(ActionType types){
        
        switch (types) {
            case ActionTypeAccept:
                [self acceptAction];
                break;
                
            case ActionTypeRefuse:
                break;
                
            default:
                break;
        }
    };
    
    
    NSString *currentversion = [[NSBundle mainBundle].infoDictionary objectForKey:@"CFBundleShortVersionString"];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:currentversion forKey:@"CFBundleVersionString"];

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
//接受按钮响应事件
-(void) acceptAction{
    
  WelcomeViewController  *noticess = [[WelcomeViewController alloc] init];
    [self.navigationController pushViewController:noticess animated:YES];
    
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
