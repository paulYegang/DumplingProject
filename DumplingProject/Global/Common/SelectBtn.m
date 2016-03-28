//
//  SelectBtn.m
//  MMTravel
//
//  Created by 顾新生 on 15/9/29.
//  Copyright © 2015年 super. All rights reserved.
//

#import "SelectBtn.h"
#define RP_COLOR_BLUE_NAVBAR               ([UIColor colorWithRed:38/255.0f green:206/255.0f blue:234/255.0f alpha:1.0f])
//0x26ceea
#define RP_COLOR_GRAY_TABBAR               ([UIColor colorWithRed:237/255.0f green:237/255.0f blue:237/255.0f alpha:1.0f])
//0xededed
#define SELECTBTN_COLOR_GRAY               ([UIColor colorWithRed:247/255.0f green:247/255.0f blue:247/255.0f alpha:1.0f])

@interface SelectBtn()
@property (strong, nonatomic) UIView *leftBar;
@property (strong, nonatomic) UIView *rightBar;

@end

@implementation SelectBtn

-(instancetype)initWithLeftTitle:(NSString *)left rightTitle:(NSString *)right{
    if (self=[super init]) {
        [self setUpSubviews];
        [self.leftBtn setTitle:left forState:UIControlStateNormal];
        [self.rightBtn setTitle:right forState:UIControlStateNormal];
        [self setEffect];
    }
    return self;
}

-(void)setUpSubviews{
    CGFloat height=44;
    CGFloat width=SCREEN_WIDTH*0.5;
    CGFloat barHeight=1;
    
    self.leftBtn=[[UIButton alloc]init];
    self.leftBtn.titleLabel.font=[UIFont systemFontOfSize:16];
    [self.leftBtn setBackgroundColor:[UIColor whiteColor]];
    [_leftBtn setTitleColor:RP_COLOR_BLUE_NAVBAR forState:UIControlStateNormal];
    self.leftBtn.tag=0;
    [self addSubview:_leftBtn];
    [_leftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.top.equalTo(@0);
        make.height.equalTo(@(height));
        make.width.equalTo(@(width));
    }];
    self.leftBtn.titleLabel.font=[UIFont systemFontOfSize:13];
    
    self.leftBar=[[UIView alloc]init];
    self.leftBar.frame=CGRectMake(0, height-barHeight, width, barHeight);
    [self.leftBar setBackgroundColor:RP_COLOR_BLUE_NAVBAR];
    [self addSubview:_leftBar];
    
    
    self.rightBtn=[[UIButton alloc]init];
    self.rightBtn.frame=CGRectMake(width,height-barHeight, width, barHeight);
    self.rightBtn.titleLabel.font=[UIFont systemFontOfSize:16];
    [self.rightBtn setBackgroundColor:[UIColor whiteColor]];
    [_rightBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    self.rightBtn.tag=1;
    [self addSubview:_rightBtn];
    [_rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0);
        make.left.equalTo(_leftBtn.mas_right);
        make.height.equalTo(@(height));
        make.width.equalTo(@(width));
    }];
    self.rightBtn.titleLabel.font=[UIFont systemFontOfSize:13];

    self.rightBar=[[UIView alloc]init];
    self.rightBar.frame=CGRectMake(width, height-barHeight, width, barHeight);
    [self.rightBar setBackgroundColor:SELECTBTN_COLOR_GRAY];
    [self addSubview:_rightBar];
}

-(void)setEffect{
    
    [self.leftBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.rightBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)btnClick:(UIButton *)btn{
    [btn setTitleColor:RP_COLOR_BLUE_NAVBAR forState:UIControlStateNormal];
    
    if (btn.tag==0) {
        [self.leftBar setBackgroundColor:RP_COLOR_BLUE_NAVBAR];
        [self.rightBar setBackgroundColor:RP_COLOR_GRAY_TABBAR];
        [self.rightBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    }else if(btn.tag==1){
        [self.rightBar setBackgroundColor:RP_COLOR_BLUE_NAVBAR];
        [self.leftBar setBackgroundColor:RP_COLOR_GRAY_TABBAR];
        [self.leftBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    }
    
    if ([self.delegate respondsToSelector:@selector(selectBtnDidClick:)]) {
        [self.delegate selectBtnDidClick:btn];
    }
    
}

@end
