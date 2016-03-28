//
//  GroupSessionViewController.m
//  DumplingProject
//
//  Created by 顾新生 on 16/3/28.
//  Copyright © 2016年 dumplingproject. All rights reserved.
//

#import "GroupSessionViewController.h"
@interface GroupSessionViewController()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@end
@implementation GroupSessionViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStyleGrouped];
    [self.view addSubview:_tableView];
    _tableView.dataSource=self;
    _tableView.delegate=self;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    [self setupNavi];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden=!self.tabBarController.tabBar.isHidden;
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.tabBarController.tabBar.hidden=!self.tabBarController.tabBar.isHidden;
}

#pragma mark -导航条
-(void)setupNavi{
    UIBarButtonItem *rightItem=[[UIBarButtonItem alloc]initWithTitle:@"群详情" style:UIBarButtonItemStylePlain target:self action:@selector(naviRightItemClick)];
    self.navigationItem.rightBarButtonItem=rightItem;
}
-(void)naviRightItemClick{
    NSLog(@"%s",__func__);

}
#pragma mark -tableview的代理方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text=@"test";
    return cell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01;
}
@end
