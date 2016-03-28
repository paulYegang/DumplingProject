//
//  NewGroupTableViewController.m
//  DumplingProject
//
//  Created by 顾新生 on 16/3/28.
//  Copyright © 2016年 dumplingproject. All rights reserved.
//

#import "NewGroupTableViewController.h"
#import "GroupIconCell.h"
#import "GroupMembersCell.h"

@interface NewGroupTableViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@end

@implementation NewGroupTableViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStyleGrouped];
    [self.view addSubview:_tableView];
    _tableView.backgroundColor=[UIColor whiteColor];
    _tableView.dataSource=self;
    _tableView.delegate=self;
    self.tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    [self.tableView registerClass:[GroupIconCell class] forCellReuseIdentifier:@"GroupIconCell"];
    [self.tableView registerClass:[GroupMembersCell class] forCellReuseIdentifier:@"GroupMembersCell"];
    
    //setupNavi
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
#pragma mark -设置导航条
-(void)setupNavi{
    UIBarButtonItem *leftItem=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"返回按钮"] style:UIBarButtonItemStylePlain target:self action:@selector(naviReturnBtnClick)];
    self.navigationItem.leftBarButtonItem=leftItem;
    UIBarButtonItem *rightItem=[[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(naviDoneBtnClick)];
    self.navigationItem.rightBarButtonItem=rightItem;
}
-(void)naviReturnBtnClick{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)naviDoneBtnClick{
    NSLog(@"%s",__func__);

}

#pragma mark -tableview的代理方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=nil;
    if (indexPath.row==0) {
        cell=[[GroupIconCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"GroupIconCell"];
    }else if (indexPath.row==1) {
        cell=[[GroupMembersCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"GroupMembersCell"];
    }else if (indexPath.row==2) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"groupname"];
        cell.textLabel.text=@"群组名称";
        cell.textLabel.font=[UIFont systemFontOfSize:15];
        cell.detailTextLabel.text=@"饺子1群";
        cell.detailTextLabel.font=[UIFont systemFontOfSize:13];
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        
        
    }
    [self addSeperator:cell];
    return cell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==2) {
        return 44;
    }
    return 100;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01;
}

-(void)dealloc{
    NSLog(@"%s",__func__);
    
}

@end
