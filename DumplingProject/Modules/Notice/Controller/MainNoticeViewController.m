//
//  MainNoticeViewController.m
//  DumplingProject
//
//  Created by 叶刚 on 16/3/17.
//  Copyright © 2016年 dumplingproject. All rights reserved.
//

#import "MainNoticeViewController.h"
#import "NewRuleViewController.h"
#import "RecuritInNoticeViewController.h"
#import "DumplingNoticeViewController.h"
@interface MainNoticeViewController ()
@property (nonatomic, strong) UITableView *noticeTable;
@end

@implementation MainNoticeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"布告";
    [self setUPUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) setUPUI{
   //设置导航栏按钮
    self.view.backgroundColor = [UIColor whiteColor];
    UIBarButtonItem * leftBtn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"个人中心按钮"] style:UIBarButtonItemStyleDone target:self action:@selector(leftBtnAction)];
    leftBtn.tintColor = [UIColor whiteColor];
    [leftBtn setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} forState:UIControlStateNormal];
    self.navigationItem.leftBarButtonItem=leftBtn;
   
    UIBarButtonItem * rightBtn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"消息按钮"] style:UIBarButtonItemStyleDone target:self action:@selector(leftBtnAction)];
    rightBtn.tintColor = [UIColor whiteColor];
    [rightBtn setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem=rightBtn;
    
    
    //新规范
    UIButton *newruleBtn = [self createButtonOnView:@"_0004_新规范"];
 
    [[newruleBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        NewRuleViewController *rule = [NewRuleViewController shareInstanceType];
        [self.navigationController pushViewController:rule animated:YES];
    }];
    
    [newruleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@84);
        make.left.equalTo(@20);
        make.right.equalTo(@(-20));
        make.height.equalTo(@((SCREEN_HEIGHT-204)/3));
    }];
    
    //招募信息
    UIButton *recruitingBtn = [self createButtonOnView:@"_0003_招募信息"];
    
    [[recruitingBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        RecuritInNoticeViewController *rule = [RecuritInNoticeViewController shareInstanceType];
        [self.navigationController pushViewController:rule animated:YES];
    }];
    
    [recruitingBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(newruleBtn.mas_bottom).offset(20);
        make.left.equalTo(@20);
        make.right.equalTo(@(-20));
        make.height.equalTo(@((SCREEN_HEIGHT-204)/3));
    }];
    
    //饺子通知
    UIButton *dumplingBtn = [self createButtonOnView:@"_0002_饺子通知"];
    
    [[dumplingBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        DumplingNoticeViewController *dump = [DumplingNoticeViewController shareInstanceType];
        [self.navigationController pushViewController:dump animated:YES];
    }];
    
    [dumplingBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(recruitingBtn.mas_bottom).offset(20);
        make.left.equalTo(@20);
        make.right.equalTo(@(-20));
//        make.bottom.equalTo(@(-80));
        make.height.equalTo(@((SCREEN_HEIGHT-204)/3));
    }];

}


//进入个人中心
-(void)leftBtnAction{
    
}

//打开消息中心
-(void)rightBtnAction{
    
}
//创建button
-(UIButton*) createButtonOnView:(NSString*) imageName{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor clearColor];
    [button setAdjustsImageWhenHighlighted:NO];
    [button setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    //    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    button.layer.shadowColor = [UIColor grayColor].CGColor;
    button.layer.shadowOffset = CGSizeMake(1,2);
    button.layer.shadowOpacity = 0.5;
    
    [self.view addSubview:button];
    return button;
}

@end
