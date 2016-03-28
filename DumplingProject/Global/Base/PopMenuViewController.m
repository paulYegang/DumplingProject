//
//  PopMenuViewController.m
//  DumplingProject
//
//  Created by 叶刚 on 16/3/28.
//  Copyright © 2016年 dumplingproject. All rights reserved.
//

#import "PopMenuViewController.h"

@interface PopMenuViewController ()

@end

@implementation PopMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor clearColor];
    UIImageView *back = [[UIImageView alloc] init];
    back.image = [UIImage imageNamed:@"22"];
    [self.view addSubview:back];
    
    [back mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(@0);
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) setuPUI{
    
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
