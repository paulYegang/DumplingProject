//
//  MainTabViewController.m
//  DumplingProject
//
//  Created by 叶刚 on 16/3/17.
//  Copyright © 2016年 dumplingproject. All rights reserved.
//

#import "MainTabViewController.h"
#import "ParliamentViewController.h"
#import "TeaHouseViewController.h"
#import "FriendsViewController.h"
#import "CodeViewController.h"
#import "MainNoticeViewController.h"

@interface MainTabViewController ()

@end

@implementation MainTabViewController

-(void)viewWillLayoutSubviews{

    [super viewWillLayoutSubviews];
    CGRect frame=self.tabBar.frame;
    frame.size.height=60;
    frame.origin.y=SCREEN_HEIGHT-60;
    self.tabBar.frame=frame;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        [self addChildViewcontrollers:@"ParliamentViewController" bartitle:@"议会" itemImage:@"议会"];
        [self addChildViewcontrollers:@"MainNoticeViewController" bartitle:@"布告" itemImage:@"布告"];
        [self addChildViewcontrollers:@"CodeViewController" bartitle:@"法典" itemImage:@"法典"];
        [self addChildViewcontrollers:@"TeaHouseViewController" bartitle:@"茶馆" itemImage:@"茶馆"];
        [self addChildViewcontrollers:@"FriendsViewController" bartitle:@"好友" itemImage:@"好友"];
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    self.tabBar.backgroundImage = [UIImage imageNamed:@"tab-蓝色渐变条"];
    self.tabBar.backgroundColor = [UIColor colorWithRed:247/255.0 green:246/255.0 blue:246/255.0 alpha:1];
    
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.tabBar.frame = CGRectMake(0, SCREEN_HEIGHT-60, SCREEN_WIDTH, 0);
    

   }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) addChildViewcontrollers:(NSString*) className bartitle:(NSString *) title  itemImage:(NSString*) itemImagename{
    
   Class childClass =  NSClassFromString(className);
    UIViewController *vc =  [[childClass alloc] init];
    UINavigationController *nag = [[UINavigationController alloc] initWithRootViewController:vc];
    [self addChildViewController:nag];

    vc.tabBarItem.title = title;
    vc.tabBarItem.imageInsets = UIEdgeInsetsMake(-5, 0, 5, 0);
    [vc.tabBarItem setTitlePositionAdjustment:UIOffsetMake(0, -5)];
    
    [vc.tabBarItem setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} forState:UIControlStateNormal];
    
    [vc.tabBarItem setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} forState:UIControlStateSelected];
    
    vc.tabBarItem.image = [UIImage imageNamed:itemImagename];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:[NSString stringWithFormat:@"%@-选中",itemImagename]];
    
}

@end
