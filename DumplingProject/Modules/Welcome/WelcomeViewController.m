//
//  WelcomeViewController.m
//  DumplingProject
//
//  Created by 叶刚 on 16/3/16.
//  Copyright © 2016年 dumplingproject. All rights reserved.
//

#import "WelcomeViewController.h"
#import "KSGuideManager.h"
#import "LoginViewController.h"
@interface WelcomeViewController ()

@end

@implementation WelcomeViewController
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
    NSMutableArray *paths = [NSMutableArray new];
    
    [paths addObject:[[NSBundle mainBundle] pathForResource:@"1" ofType:@"jpg"]];
    [paths addObject:[[NSBundle mainBundle] pathForResource:@"2" ofType:@"jpg"]];
    [paths addObject:[[NSBundle mainBundle] pathForResource:@"3" ofType:@"jpg"]];
    [paths addObject:[[NSBundle mainBundle] pathForResource:@"4" ofType:@"jpg"]];
    
    KSGuideManager *manager = [KSGuideManager shared];
    [manager showGuideViewWithImages:paths];
    
    manager.NextBlock = ^(){
        [self.navigationController pushViewController:[LoginViewController shareInstanceType] animated:YES];
    };

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
