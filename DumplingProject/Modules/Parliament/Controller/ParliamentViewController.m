//
//  ParliamentViewController.m
//  DumplingProject
//
//  Created by 叶刚 on 16/3/17.
//  Copyright © 2016年 dumplingproject. All rights reserved.
//

typedef NS_ENUM(NSInteger,TableViewCurrentType){
    TableViewCurrentTypeRecently, //最近聊天
    TableViewCurrentTypeGroup     //群组
};

#import "ParliamentViewController.h"
#import "IWantDumplingViewController.h"
#import "UIImage+Color.h"
#import "ParliamentTableViewCell.h"
#import "ParliamentNewGroupCell.h"
@interface ParliamentViewController ()<UITableViewDelegate,UITableViewDataSource,ParliamentNewGroupCellDelegate>

@property(nonatomic,strong)UISegmentedControl *segmentedControl;
@property(nonatomic,strong)UITableView *tableView;

@property(nonatomic,assign)TableViewCurrentType tableViewType;

@end

@implementation ParliamentViewController
static NSString *reuseIdentifer=@"cell";
static int count=10;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"议会";
    
    UIBarButtonItem * leftBtn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"个人中心按钮"] style:UIBarButtonItemStyleDone target:self action:@selector(leftBtnAction)];
    leftBtn.tintColor = [UIColor whiteColor];
    [leftBtn setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} forState:UIControlStateNormal];
    self.navigationItem.leftBarButtonItem=leftBtn;
    
    UIBarButtonItem * rightBtn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"消息按钮"] style:UIBarButtonItemStyleDone target:self action:@selector(leftBtnAction)];
    rightBtn.tintColor = [UIColor whiteColor];
    [rightBtn setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem=rightBtn;
    self.tableViewType=TableViewCurrentTypeRecently;
    
    [self setupUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    self.tabBarController.tabBar.hidden = NO;
    self.iconImage.hidden = NO;
    
    //去除naviagtionbar的边框颜色
    UINavigationBar *bar=self.navigationController.navigationBar;
    [bar setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithRed:50/255.0 green:127/255.0 blue:254/255.0 alpha:1]] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    bar.shadowImage=[[UIImage alloc]init];
}

//-(void)viewWillDisappear:(BOOL)animated{
//    [super viewWillDisappear:animated];
//    self.tabBarController.tabBar.hidden = YES;
//    self.iconImage.hidden = YES;
//}

//进入个人中心
-(void)leftBtnAction{
    IWantDumplingViewController *want = [[IWantDumplingViewController alloc] init];
    [self.navigationController pushViewController:want animated:YES];
}

//打开消息中心
-(void)rightBtnAction{
    
}
#pragma mark -创建UI
-(void)setupUI{
    
    //segmentedControl
    UIView *headView=[[UIView alloc]init];
    headView.backgroundColor=[UIColor colorWithRed:50/255.0 green:127/255.0 blue:254/255.0 alpha:1];
    [self.view addSubview:headView];
    [headView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@40);
        make.width.equalTo(@SCREEN_WIDTH);
        make.top.equalTo(@0);
        make.centerX.equalTo(@0);
    }];
    
    _segmentedControl=[[UISegmentedControl alloc]initWithItems:@[@"最近聊天",@"群组"]];
    [headView addSubview:_segmentedControl];
    [_segmentedControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(SCREEN_WIDTH*2/3));
        make.height.equalTo(@30);
        make.centerX.equalTo(@0);
        make.top.equalTo(@0);
    }];
    _segmentedControl.tintColor=[UIColor whiteColor];
    _segmentedControl.selectedSegmentIndex=0;
    [_segmentedControl setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13],
                                               NSForegroundColorAttributeName:[UIColor colorWithRed:50/255.0 green:127/255.0 blue:254/255.0 alpha:1]}
                                    forState:UIControlStateSelected];
    [_segmentedControl setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13]}
                                    forState:UIControlStateNormal];
    [_segmentedControl addTarget:self action:@selector(segmentedControlClickWith:) forControlEvents:UIControlEventValueChanged];
    
    //tableView
    _tableView=[[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(headView.mas_bottom);
        make.left.and.right.equalTo(@0);
        make.bottom.equalTo(@-63);
    }];
    
    [_tableView registerClass:[ParliamentTableViewCell class] forCellReuseIdentifier:reuseIdentifer];
    [_tableView registerClass:[ParliamentNewGroupCell class] forCellReuseIdentifier:@"newgroup"];
    _tableView.dataSource=self;
    _tableView.delegate=self;
    
}
#pragma mark -segmentedcontrol点击事件
-(void)segmentedControlClickWith:(UISegmentedControl *)sender{
    NSLog(@"%s---%ld",__func__,(long)sender.selectedSegmentIndex);
    if (sender.selectedSegmentIndex==0) {
        self.tableViewType=TableViewCurrentTypeRecently;
    }else{
        self.tableViewType=TableViewCurrentTypeGroup;
    }
}
#pragma mark --------------------------
#pragma mark -tableView的代理方法和数据源
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//TODO:议会首页tableview的数据源
    switch (self.tableViewType) {
        case TableViewCurrentTypeRecently:
            return count+5;
            break;
        case TableViewCurrentTypeGroup:
            return count-5;
            break;
        default:
            return count;
            break;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (_tableViewType==TableViewCurrentTypeGroup && indexPath.row==0) {
        ParliamentNewGroupCell *cell=[tableView dequeueReusableCellWithIdentifier:@"newgroup"];
        cell.delegate=self;
        return cell;
    }
    
    ParliamentTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text=[NSString stringWithFormat:@"test%ld",(long)indexPath.row];
    cell.badgeNum=indexPath.row;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return SCREEN_HEIGHT*0.12;
}

#pragma mark -删除操作
-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    return @"删除";
}
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewCellEditingStyleDelete;
}
-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    count--;
    [tableView beginUpdates];
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    [tableView endUpdates];
}

#pragma mark -sectionHeight
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01;
}

#pragma mark -cell的代理方法
#pragma mark -新建群组
-(void)newGroupBtnDidClick:(ParliamentNewGroupCell *)cell{
    //TODO:新建群组操作
    NSLog(@"%s--新建群组",__func__);

}

#pragma mark -setter and getter
-(void)setTableViewType:(TableViewCurrentType)tableViewType{
    _tableViewType=tableViewType;
    
    //tableview switch animation
    switch (tableViewType) {
        case TableViewCurrentTypeRecently:
            [_tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationRight];
            break;
        case TableViewCurrentTypeGroup:
            [_tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationLeft];
            break;
        default:
            break;
    }
    
}

@end
