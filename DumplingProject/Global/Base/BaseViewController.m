//
//  BaseViewController.m
//  DumplingProject
//
//  Created by 叶刚 on 16/3/16.
//  Copyright © 2016年 dumplingproject. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController


- (void)viewDidLoad {
    [super viewDidLoad];
//    self.navigationController.navigationBarHidden = YES;
    
    self.view.backgroundColor = [UIColor colorWithRed:231/256.0 green:238/256.0 blue:236/256.0 alpha:1];

    [UINavigationBar appearance].barTintColor = [UIColor colorWithRed:50/255.0 green:127/255.0 blue:254/255.0 alpha:1];
//    self.view.backgroundColor = [UIColor whiteColor];
    [UINavigationBar appearance].tintColor=[UIColor whiteColor];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont boldSystemFontOfSize:19]};
    // Do any additional setup after loading the view.
    
     _iconImage = [[UIImageView alloc] init];
    _iconImage.backgroundColor = [UIColor clearColor];
    _iconImage.layer.cornerRadius = 5;
    _iconImage.layer.borderColor = [UIColor colorWithWhite:0.8 alpha:0.5].CGColor;
    _iconImage.layer.borderWidth =0.5;
    
    _iconImage.image  = [UIImage imageNamed:@"tab-蓝色渐变条"];
    [self.view addSubview:_iconImage];
    [_iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(SCREEN_WIDTH));
        make.height.equalTo(@3);
        make.bottom.equalTo(@(-59));
    }];

    UIBarButtonItem * leftBtn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"返回按钮"] style:UIBarButtonItemStyleDone target:self action:@selector(leftBtnAction)];
    leftBtn.tintColor = [UIColor whiteColor];
    [leftBtn setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} forState:UIControlStateNormal];
    self.navigationItem.leftBarButtonItem=leftBtn;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//-(void) setUPUI{
//    UIBarButtonItem * leftBtn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"返回按钮"] style:UIBarButtonItemStyleDone target:self action:@selector(leftBtnAction)];
//    leftBtn.tintColor = [UIColor whiteColor];
//    [leftBtn setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} forState:UIControlStateNormal];
//    self.navigationItem.leftBarButtonItem=leftBtn;
//}

//返回上一页面
-(void)leftBtnAction{
    [self.navigationController popViewControllerAnimated:YES];
}
//-(UIStatusBarStyle)preferredStatusBarStyle{
//    return UIStatusBarStyleLightContent;
//}

//- (UIStatusBarStyle)preferredStatusBarStyle:
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
/**
 *  给cell底部添加分隔条
 *
 *  @param cell cell
 */
-(void)addSeperator:(UITableViewCell *)cell{
    //分隔条
    UILabel *seperator=[[UILabel alloc]init];
    seperator.backgroundColor=[UIColor colorWithWhite:0.8 alpha:0.5];
    [cell.contentView addSubview:seperator];
    [seperator mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@1);
        make.width.equalTo(@(SCREEN_WIDTH));
        make.bottom.equalTo(@0);
        make.centerX.equalTo(@0);
    }];
    
}

-(void)showAlertWithTitle:(NSString *)title message:(NSString *)msg{
    UIAlertController *alertVC=[UIAlertController alertControllerWithTitle:title message:msg preferredStyle:UIAlertControllerStyleAlert];
    [alertVC addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        [alertVC dismissViewControllerAnimated:YES completion:nil];
    }]];
    [alertVC addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        [alertVC dismissViewControllerAnimated:YES completion:nil];
    }]];
    [self presentViewController:alertVC animated:YES completion:nil];
}

@end
