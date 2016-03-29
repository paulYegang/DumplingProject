//
//  MessageViewController.m
//  DumplingProject
//
//  Created by 顾新生 on 16/3/28.
//  Copyright © 2016年 dumplingproject. All rights reserved.
//

#import "MessageViewController.h"
#import "MessageCell.h"
@interface MessageViewController()<UITableViewDataSource,UITableViewDelegate,MessageCellDelegate>
@property(nonatomic,strong)UITableView *tableView;
@end
@implementation MessageViewController


-(void)viewDidLoad{
    [super viewDidLoad];
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64) style:UITableViewStyleGrouped];
    _tableView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:_tableView];
    _tableView.dataSource=self;
    _tableView.delegate=self;
    _tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden=!self.tabBarController.tabBar.isHidden;
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.tabBarController.tabBar.hidden=!self.tabBarController.tabBar.isHidden;
}


#pragma mark -tableView的代理方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MessageCell *cell=[tableView dequeueReusableCellWithIdentifier:@"messagecell"];
    if (cell==nil) {
        cell=[[MessageCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"messagecell"];
    }
    if (indexPath.row%3==0) {
        cell.cellType=MessageCellTypeButtonShow;
    }
    cell.delegate=self;
    [self addSeperator:cell];
    return cell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 64;
}

#pragma mark -cell的代理方法
-(void)cellBtnDidClick:(BOOL)flag{
    //TODO:need agree or refuse actions
    NSLog(@"%@",[NSString stringWithFormat:@"按钮点击了－%@",flag?@"同意":@"拒绝"]);
}

-(void)dealloc{
    NSLog(@"释放了");

}
@end
