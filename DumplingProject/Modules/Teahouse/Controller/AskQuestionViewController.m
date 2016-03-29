//
//  AskQuestionViewController.m
//  DumplingProject
//
//  Created by 叶刚 on 16/3/29.
//  Copyright © 2016年 dumplingproject. All rights reserved.
//

#import "AskQuestionViewController.h"
#import "AskQuestionVIew.h"
@interface AskQuestionViewController ()

@property (nonatomic,strong)AskQuestionVIew *askquestionview;
@end

@implementation AskQuestionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"提问";
    
    _askquestionview = [[AskQuestionVIew alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT)];
    [self.view addSubview:_askquestionview];

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
