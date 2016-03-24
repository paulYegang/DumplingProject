//
//  TeaHouseViewController.m
//  DumplingProject
//
//  Created by 叶刚 on 16/3/17.
//  Copyright © 2016年 dumplingproject. All rights reserved.
//

#import "TeaHouseViewController.h"
#import "ExperienceViewController.h"
@interface TeaHouseViewController ()

@end

@implementation TeaHouseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"茶馆";
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
    
    
    //江湖经验
    UIButton *newruleBtn = [self createButtonOnView:@"_0002_江湖经验"];
    
    [[newruleBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        ExperienceViewController *experience = [ExperienceViewController shareInstanceType];
        [self.navigationController pushViewController:experience animated:YES];
    }];
    
    [newruleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@84);
        make.left.equalTo(@20);
        make.right.equalTo(@(-20));
        make.height.equalTo(@((SCREEN_HEIGHT-204)/3));
    }];
    
    //指点江山
    UIButton *recruitingBtn = [self createButtonOnView:@"_0001_指点江山"];
    
    [[recruitingBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        
    }];
    
    [recruitingBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(newruleBtn.mas_bottom).offset(20);
        make.left.equalTo(@20);
        make.right.equalTo(@(-20));
        make.height.equalTo(@((SCREEN_HEIGHT-204)/3));
    }];
    
    //赌馆
    UIButton *dumplingBtn = [self createButtonOnView:@"_0000_饺子通知"];
    
    [[dumplingBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
       
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
