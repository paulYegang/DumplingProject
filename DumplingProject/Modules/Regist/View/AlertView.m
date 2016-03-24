//
//  AlertView.m
//  DumplingProject
//
//  Created by 叶刚 on 16/3/15.
//  Copyright © 2016年 dumplingproject. All rights reserved.
//

#import "AlertView.h"

@implementation AlertView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype) initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        [self layoutAllSubviews];
    }
    return self;
}

- (void)layoutAllSubviews{
    
    /*创建灰色背景*/
    _bgView = [[UIView alloc] initWithFrame:self.frame];
    _bgView.alpha = 0.5;
    _bgView.backgroundColor = [UIColor blackColor];
    [self addSubview:_bgView];
    
    
//    /*添加手势事件,移除View*/
//    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissContactView:)];
//    [_bgView addGestureRecognizer:tapGesture];
//    
    /*创建显示View*/
    _contentView = [[UIView alloc] init];
    //    _contentView.frame = CGRectMake(0, 0, self.view.frame.size.width - 40, 180);
    _contentView.backgroundColor=[UIColor whiteColor];
    _contentView.layer.cornerRadius = 5;
    _contentView.layer.masksToBounds = YES;
    [self addSubview:_contentView];
    /*可以继续在其中添加一些View 虾米的*/
    [_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.equalTo(@0);
        make.left.equalTo(@20);
        make.right.equalTo(@(-20));
        make.height.equalTo(@240);
    }];
    
    UIImageView *titleImage = [[UIImageView alloc] init];
    titleImage.backgroundColor = [UIColor clearColor];
    titleImage.image = [UIImage imageNamed:@"弹窗"];
    [_contentView addSubview:titleImage];
    
    [titleImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(@0);
    }];
    
    _title = [[UILabel alloc] init];
//    _title.text = @"注册成功";
    _title.font = [UIFont systemFontOfSize:16];
    _title.backgroundColor = [UIColor clearColor];
    [_contentView addSubview:_title];
    
    [_title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.equalTo(@0);
        make.height.equalTo(@30);
        
    }];

    //确认按钮
    _backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _backBtn.backgroundColor = [UIColor clearColor];
    [_backBtn setBackgroundImage:[UIImage imageNamed:@"蓝色按钮"] forState:UIControlStateNormal];
    [_backBtn setTitle:@"确认" forState:UIControlStateNormal];
    _backBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [_contentView addSubview:_backBtn];
 
    
    [_backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(_title.mas_centerX);
        make.top.equalTo(_title.mas_bottom).offset(30);
        make.height.equalTo(@40);
        make.width.equalTo(@200);
        
    }];

    
}
//#pragma mark - 手势点击事件,移除View
//- (void)dismissContactView:(UITapGestureRecognizer *)tapGesture{
//    
//    
//    [self.delegate tapRemoveViewDelegate];
//}




@end
