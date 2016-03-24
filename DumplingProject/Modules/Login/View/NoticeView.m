//
//  NoticeView.m
//  DumplingProject
//
//  Created by 叶刚 on 16/3/14.
//  Copyright © 2016年 dumplingproject. All rights reserved.
//

#import "NoticeView.h"

@implementation NoticeView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype) initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor colorWithRed:235/256.0 green:241/256.0 blue:240/256.0 alpha:1];
        [self setUpUI];
    }
    return self;
}


-(void) setUpUI{
    UILabel *title = [[UILabel alloc] init];
    title.text = @"提示";
    title.font = [UIFont boldSystemFontOfSize:16];
    title.backgroundColor = [UIColor clearColor];
    [self addSubview:title];
    
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@30);
        make.centerX.equalTo(@0);
        make.height.equalTo(@30);
        
    }];
    
    UIView *back = [[UIView alloc] init];
    back.backgroundColor = [UIColor whiteColor];
    back.layer.cornerRadius = 5;
    back.layer.shadowColor = [UIColor grayColor].CGColor;
    back.layer.shadowOffset = CGSizeMake(0,2);
    back.layer.shadowOpacity = 0.5;
    [self addSubview:back];
    [back mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@25);
        make.right.equalTo(@(-25));
        make.top.equalTo(title.mas_bottom).offset(15);
        make.bottom.equalTo(@(-80));
        
    }];

    
    UIScrollView * scrollView = [[UIScrollView alloc] init];
    scrollView.backgroundColor = [UIColor clearColor];
//    scrollView.center = back.center;
    scrollView.scrollEnabled = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
//    scrollView.clipsToBounds = YES;
    [back addSubview:scrollView];
    
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.equalTo(@0);
    }];
    
  
    UIImageView *backs = [[UIImageView alloc] init];
    backs.image = [UIImage imageNamed:@"提示"];
    [scrollView addSubview:backs];
    [backs mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(@0);
        make.top.equalTo(@20);
        make.width.equalTo(@260);
        make.height.equalTo(@530);
    }];

     scrollView.contentSize = CGSizeMake(0, backs.image.size.height-400);
    
    
    //创建拒绝、接受按钮
    UIButton *refuseBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    refuseBtn.backgroundColor = [UIColor clearColor];
    [refuseBtn setBackgroundImage:[UIImage imageNamed:@"_0001_拒绝按钮"] forState:UIControlStateNormal];
    [refuseBtn setTitle:@"拒绝" forState:UIControlStateNormal];
    refuseBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [self addSubview:refuseBtn];
    
    [[refuseBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        if (self.actionBLock) {
            self.actionBLock(ActionTypeRefuse);
        }
    }];
    
    [refuseBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@25);
        make.right.equalTo(back.mas_centerX).offset(-5);
//        make.width.equalTo(@100);
        make.height.equalTo(@33);
        make.bottom.equalTo(@(-20));
    }];
    
    
    UIButton *acceptBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    acceptBtn.backgroundColor = [UIColor clearColor];
    [acceptBtn setBackgroundImage:[UIImage imageNamed:@"_0000_接受按钮"] forState:UIControlStateNormal];
    [acceptBtn setTitle:@"接受" forState:UIControlStateNormal];
    acceptBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [self addSubview:acceptBtn];
    [[acceptBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        if (self.actionBLock) {
            self.actionBLock(ActionTypeAccept);
        }
    }];
    
    [acceptBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        //        make.left.equalTo(@65);
        make.right.equalTo(@(-25));
         make.left.equalTo(back.mas_centerX).offset(5);
        make.height.equalTo(@33);
        make.bottom.equalTo(@(-20));
    }];

    
}

@end
