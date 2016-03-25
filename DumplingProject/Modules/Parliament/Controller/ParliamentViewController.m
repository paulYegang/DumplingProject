//
//  ParliamentViewController.m
//  DumplingProject
//
//  Created by 叶刚 on 16/3/17.
//  Copyright © 2016年 dumplingproject. All rights reserved.
//

#import "ParliamentViewController.h"
#import "IWantDumplingViewController.h"
#import "UIImage+Color.h"
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
    
    
    [self setupUI];
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

    //去除naviagtionbar的边框颜色
    UINavigationBar *bar=self.navigationController.navigationBar;
    [bar setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithRed:50/255.0 green:127/255.0 blue:254/255.0 alpha:1]] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    bar.shadowImage=[[UIImage alloc]init];
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
/**
 *  创建segmentcontrol和tableview
 */
-(void)setupUI{
    
    UIView *headView=[[UIView alloc]init];
    headView.backgroundColor=[UIColor colorWithRed:50/255.0 green:127/255.0 blue:254/255.0 alpha:1];
    [self.view addSubview:headView];
    [headView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@50);
        make.width.equalTo(@SCREEN_WIDTH);
        make.top.equalTo(@0);
        make.centerX.equalTo(@0);
    }];
    
    
    UISegmentedControl *segmentedControl=[[UISegmentedControl alloc]initWithItems:@[@"最近聊天",@"群组"]];
    [headView addSubview:segmentedControl];
    [segmentedControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(SCREEN_WIDTH*2/3));
        make.height.equalTo(@35);
        make.centerX.equalTo(@0);
        make.top.equalTo(@0);
    }];
    segmentedControl.tintColor=[UIColor whiteColor];
    segmentedControl.selectedSegmentIndex=0;
    [segmentedControl setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15],
                                               NSForegroundColorAttributeName:[UIColor colorWithRed:50/255.0 green:127/255.0 blue:254/255.0 alpha:1]}
                                    forState:UIControlStateSelected];
    [segmentedControl setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]}
                                    forState:UIControlStateNormal];
    
   }

@end
