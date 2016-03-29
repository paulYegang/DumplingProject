//
//  MyQuestionViewController.m
//  DumplingProject
//
//  Created by 叶刚 on 16/3/29.
//  Copyright © 2016年 dumplingproject. All rights reserved.
//

#import "MyQuestionViewController.h"

@interface MyQuestionViewController ()

@end

@implementation MyQuestionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title =@"我提出的问题";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
    self.iconImage.hidden = YES;
    //    self.iconImage.hidden = YES;
    //    [self initSearchController];
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
