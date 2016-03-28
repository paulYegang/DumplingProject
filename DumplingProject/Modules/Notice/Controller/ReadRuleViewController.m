//
//  ReadRuleViewController.m
//  DumplingProject
//
//  Created by 叶刚 on 16/3/21.
//  Copyright © 2016年 dumplingproject. All rights reserved.
//

#import "ReadRuleViewController.h"
#import "ErrorCorrectionViewController.h"
#import "UpLoadViewController.h"
@interface ReadRuleViewController ()

@end

@implementation ReadRuleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"阅读";
    [self setUPUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) setUPUI{
    
    UIBarButtonItem * rightBtn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"消息按钮"] style:UIBarButtonItemStyleDone target:self action:@selector(rightBtnAction)];
    rightBtn.tintColor = [UIColor whiteColor];
    [rightBtn setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem=rightBtn;
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
    self.iconImage.hidden = YES;
}

//返回上一页面
-(void)leftBtnAction{
    [self.navigationController popViewControllerAnimated:YES];
}

//选择纠错，补充
-(void) rightBtnAction{
    
    
    ErrorCorrectionViewController *errors = [[ErrorCorrectionViewController alloc] init];
    [self.navigationController pushViewController:errors animated:YES];
    
//    UpLoadViewController *upload = [[UpLoadViewController alloc] init];
//    [self.navigationController pushViewController:upload animated:YES];
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
