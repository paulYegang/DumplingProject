//
//  UnResolveViewController.m
//  DumplingProject
//
//  Created by 叶刚 on 16/3/25.
//  Copyright © 2016年 dumplingproject. All rights reserved.
//

#import "UnResolveViewController.h"
#import "UnResolveProCell.h"
#import "QuestionTitleView.h"
#import "ReplyViewController.h"
@interface UnResolveViewController ()
@property (nonatomic,strong) QuestionTitleView *titleview;
@end

@implementation UnResolveViewController

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
    [self setUPUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
    self.iconImage.hidden = YES;
    //    self.iconImage.hidden = YES;
//    [self initSearchController];
}
-(void) setUPUI{
    
    _titleview = [[QuestionTitleView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, 120)];
    _titleview.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_titleview];
    
    _answerTable = [[UITableView alloc] initWithFrame:CGRectMake(5, 64+120, SCREEN_WIDTH-10, SCREEN_HEIGHT-50) style:UITableViewStyleGrouped];
    _answerTable.dataSource = self;
    _answerTable.delegate = self;
    _answerTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    _answerTable.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_answerTable];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor colorWithRed:50/255.0 green:127/255.0 blue:254/255.0 alpha:1];
//    [button setBackgroundImage:[UIImage imageNamed:@"蓝色按钮"] forState:UIControlStateNormal];
    [button setTitle:@"我来答" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont boldSystemFontOfSize:20];
    [[button rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        ReplyViewController *rel = [ReplyViewController shareInstanceType];
        [self.navigationController pushViewController:rel animated:YES];
    }];
    [self.view addSubview:button];
    
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(@0);
        make.height.equalTo(@50);
        make.bottom.equalTo(@0);
        
    }];

    
}
#pragma tableview的代理方法
-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
}

-(CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 5;
}
-(CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 1;
}
-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

#warning 数据需要通过api从服务器获取并展示
-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellidentifier = @"cellidentifier";
    
    UnResolveProCell *cell = [tableView dequeueReusableCellWithIdentifier:cellidentifier];
    
    if (cell==nil) {
        cell = [[UnResolveProCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellidentifier];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
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
