//
//  ParliamentViewController.m
//  DumplingProject
//
//  Created by 叶刚 on 16/3/17.
//  Copyright © 2016年 dumplingproject. All rights reserved.
//

#import "ParliamentViewController.h"
#import "IWantDumplingViewController.h"

@interface ParliamentViewController ()

@end

@implementation ParliamentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"议会";
    
    UIBarButtonItem * leftBtn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"个人中心按钮"] style:UIBarButtonItemStyleDone target:self action:@selector(leftBtnAction)];
    leftBtn.tintColor = [UIColor whiteColor];
    [leftBtn setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} forState:UIControlStateNormal];
    self.navigationItem.leftBarButtonItem=leftBtn;
    
    UIBarButtonItem * rightBtn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"消息按钮"] style:UIBarButtonItemStyleDone target:self action:@selector(leftBtnAction)];
    rightBtn.tintColor = [UIColor whiteColor];
    [rightBtn setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem=rightBtn;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    self.tabBarController.tabBar.hidden = NO;
    self.iconImage.hidden = NO;
}

//-(void)viewWillDisappear:(BOOL)animated{
//    [super viewWillDisappear:animated];
//    self.tabBarController.tabBar.hidden = YES;
//    self.iconImage.hidden = YES;
//}

//进入个人中心
-(void)leftBtnAction{
    IWantDumplingViewController *want = [[IWantDumplingViewController alloc] init];
    [self.navigationController pushViewController:want animated:YES];
}

//打开消息中心
-(void)rightBtnAction{
    
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
