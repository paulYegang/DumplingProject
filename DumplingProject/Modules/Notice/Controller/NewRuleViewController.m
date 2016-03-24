//
//  NewRuleViewController.m
//  DumplingProject
//
//  Created by 叶刚 on 16/3/18.
//  Copyright © 2016年 dumplingproject. All rights reserved.
//

#import "NewRuleViewController.h"
#import "NewRuleCell.h"
#import "ReadRuleViewController.h"
@interface NewRuleViewController () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableview;
@end

@implementation NewRuleViewController

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
    self.title= @"新规范";
    self.view.backgroundColor = [UIColor colorWithRed:235/256.0 green:241/256.0 blue:240/256.0 alpha:1];
    
    
    [self setUPUI];

}

//返回上一页面
-(void)leftBtnAction{
    [self.navigationController popViewControllerAnimated:YES];
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
    
    UIBarButtonItem * leftBtn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"返回按钮"] style:UIBarButtonItemStyleDone target:self action:@selector(leftBtnAction)];
    leftBtn.tintColor = [UIColor whiteColor];
    [leftBtn setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} forState:UIControlStateNormal];
    self.navigationItem.leftBarButtonItem=leftBtn;

    _tableview = [[UITableView alloc] initWithFrame:CGRectMake(10, 64, SCREEN_WIDTH-20, SCREEN_HEIGHT) style:UITableViewStyleGrouped];
    _tableview.dataSource = self;
    _tableview.delegate = self;
    _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableview.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_tableview];
    
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 10;
}
-(CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 1;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 170;
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellidentifier = @"cellidentifier";
    NewRuleCell *cell = [tableView dequeueReusableCellWithIdentifier:cellidentifier];
    
    if (cell==nil) {
        cell = [[NewRuleCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellidentifier];
    }

    return cell;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    
    ReadRuleViewController *read = [[ReadRuleViewController alloc] init];
    [self.navigationController pushViewController:read animated:YES];
}

@end
