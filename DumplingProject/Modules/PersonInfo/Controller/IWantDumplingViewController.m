//
//  IWantDumplingViewController.m
//  DumplingProject
//
//  Created by 叶刚 on 16/3/22.
//  Copyright © 2016年 dumplingproject. All rights reserved.
//

#import "IWantDumplingViewController.h"

@interface IWantDumplingViewController ()

@end

@implementation IWantDumplingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"我要饺子";
    
    [self setUPUI];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
    self.iconImage.hidden = YES;
}


-(void) setUPUI{
    UIImageView *back = [[ UIImageView alloc] init];
    back.backgroundColor = [UIColor clearColor];
    back.image = [UIImage imageNamed:@"我要饺子 框"];
    [self.view addSubview:back];
    
    [back mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@16);
        make.left.equalTo(@20);
        make.right.equalTo(@(-20));
        make.bottom.equalTo(@(-16));
    }];
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
