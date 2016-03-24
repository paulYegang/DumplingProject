//
//  RegistViewController.m
//  DumplingProject
//
//  Created by 叶刚 on 16/3/14.
//  Copyright © 2016年 dumplingproject. All rights reserved.
//

#import "ChagnePwdViewController.h"
#import "changePwdView.h"
@interface ChagnePwdViewController ()

@end

@implementation ChagnePwdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   
    changePwdView *log = [[changePwdView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    self.view = log;
    
    log.backBlock = ^(BtnType type){
       
        switch (type) {
            case BtnTypeBack:
                [self.navigationController popViewControllerAnimated:YES];
                break;
            case BtnTypeChange:
                [self changeAction];
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

//注册
-(void) changeAction{
    NSLog(@"注册");
}


//获取验证码
-(void) getTestNum{
    
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
