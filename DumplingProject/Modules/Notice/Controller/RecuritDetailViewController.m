//
//  RecuritDetailViewController.m
//  DumplingProject
//
//  Created by 叶刚 on 16/3/22.
//  Copyright © 2016年 dumplingproject. All rights reserved.
//

#import "RecuritDetailViewController.h"

@interface RecuritDetailViewController () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableview;
@property (nonatomic, strong) NSMutableArray *biaoTiArray;

@end

@implementation RecuritDetailViewController

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
    self.title = @"招募信息";
    _biaoTiArray = [NSMutableArray arrayWithObjects:@"招聘单位:",@"单位基本情况:",@"招聘岗位名称:",@"岗位职责:",@"岗位要求:",@"联系人:",@"联系电话:",@"联系人电子邮箱:",@"联系人微信号:",@"发布时间:", nil];
    
    [self setUPUI];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
    self.iconImage.hidden = YES;
}


-(void) setUPUI{
    
    _tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
    _tableview.dataSource = self;
    _tableview.delegate = self;
    _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableview.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_tableview];
}


#pragma tableview代理方法

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}


-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}


#warning 此处需要对cell进行进一步设计
-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellidentifier = @"cellidentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellidentifier];
    
    if (cell==nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellidentifier];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
//    cell.textLabel.text= [NSString stringWithFormat:@"%@",[_biaoTiArray objectAtIndex:indexPath.row]];
    
    UILabel *title = [[UILabel alloc] init];
    title.text = [NSString stringWithFormat:@"%@",[_biaoTiArray objectAtIndex:indexPath.row]];
    title.font = [UIFont systemFontOfSize:15];
    title.backgroundColor = [UIColor clearColor];
    [cell addSubview:title];
    
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@10);
        make.left.equalTo(@10);
        make.width.equalTo(@130);
        make.height.equalTo(@30);
        
    }];
    
    UILabel *description = [[UILabel alloc] init];
    description.text = [NSString stringWithFormat:@"【%@】",[_biaoTiArray objectAtIndex:indexPath.row]];
    description.font = [UIFont systemFontOfSize:15];
    description.numberOfLines = 0;  //0917676
    description.backgroundColor = [UIColor clearColor];
    NSMutableAttributedString *attributed = [[NSMutableAttributedString alloc] initWithString:description.text];
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    [style setLineSpacing:2];
    [attributed addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, description.text.length)];
    description.attributedText = attributed;
    CGSize size = CGSizeMake(SCREEN_WIDTH, 50000);
    CGSize labelsize = [description sizeThatFits:size];
    [cell addSubview:description];
    
    [description mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@10);
        make.left.equalTo(title.mas_right);
        make.right.equalTo(@0);
        make.height.equalTo(@30);
        
    }];


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
