//
//  RecuritInNoticeViewController.m
//  DumplingProject
//
//  Created by 叶刚 on 16/3/22.
//  Copyright © 2016年 dumplingproject. All rights reserved.
//

#import "RecuritInNoticeViewController.h"
#import "RecuritInfoCell.h"
#import "RecuritDetailViewController.h"

@interface RecuritInNoticeViewController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableview;
@end

@implementation RecuritInNoticeViewController

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
    self.title = @"招募信息";
    // Do any additional setup after loading the view.
    [self setUPUI];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
    self.iconImage.hidden = YES;
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.tabBarController.tabBar.hidden = NO;
    self.iconImage.hidden = NO;
}


-(void) setUPUI{
    
    _tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
    _tableview.dataSource = self;
    _tableview.delegate = self;
    _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableview.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_tableview];
    

}
#pragma tableview的代理方法
-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 8;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}

#warning 数据需要通过api从服务器获取并展示
-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellidentifier = @"cellidentifier";

    RecuritInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:cellidentifier];
    
    if (cell==nil) {
        cell = [[RecuritInfoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellidentifier];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    
//    ReadRuleViewController *read = [[ReadRuleViewController alloc] init];
//    [self.navigationController pushViewController:read animated:YES];
    RecuritDetailViewController *detail = [RecuritDetailViewController shareInstanceType];
    [self.navigationController pushViewController:detail animated:YES];
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
