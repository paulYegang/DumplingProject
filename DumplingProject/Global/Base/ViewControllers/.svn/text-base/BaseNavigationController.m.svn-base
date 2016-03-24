//
//  BaseNavigationController.m
//  RailPass
//
//  Created by liujukui on 15/6/8.
//  Copyright (c) 2015年 jukui. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (instancetype)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSDictionary *attr = @{
                           NSForegroundColorAttributeName:RP_COLOR_WHITE,
                           NSFontAttributeName:[UIFont systemFontOfSize:17]
                           };
    self.navigationBar.titleTextAttributes = attr;
    [self.navigationBar setBarTintColor:RP_COLOR_BLUE_NAVBAR];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    UIViewController *topViewController = [self topViewController];
    UIStatusBarStyle preferredStyle = [topViewController preferredStatusBarStyle];
    if (preferredStyle) {
        return preferredStyle;
    }else {
        return UIStatusBarStyleLightContent;
    }
}

@end
