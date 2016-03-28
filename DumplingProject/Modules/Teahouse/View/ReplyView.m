//
//  ReplyView.m
//  DumplingProject
//
//  Created by 叶刚 on 16/3/28.
//  Copyright © 2016年 dumplingproject. All rights reserved.
//

#import "ReplyView.h"

@implementation ReplyView 

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype) initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setUPUI];
    }
    return self;
}


-(void) setUPUI{
    _questionLabel = [[UILabel alloc] init];
    _questionLabel.backgroundColor = [UIColor clearColor];
    _questionLabel.text = @"基金管理公司需要设立董事会吗？";
    _questionLabel.textAlignment = NSTextAlignmentCenter;
    _questionLabel.font = [UIFont systemFontOfSize:15];
    [self addSubview:_questionLabel];
    
    [_questionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(@0);
        make.top.equalTo(@0);
        make.height.equalTo(@60);
        
    }];
    
    _answerTextView = [[UITextView alloc] init];
    _answerTextView.backgroundColor = [UIColor whiteColor];
    _answerTextView.layer.borderColor = [UIColor grayColor].CGColor;
    _answerTextView.layer.borderWidth = 0.5;
    _answerTextView.layer.cornerRadius = 2;
    _answerTextView.layer.shadowColor = [UIColor grayColor].CGColor;
    _answerTextView.layer.shadowOffset = CGSizeMake(2,2);
    _answerTextView.layer.shadowOpacity = 0.8;
    [self addSubview:_answerTextView];
    
    [_answerTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_questionLabel.mas_bottom);
        make.left.equalTo(@10);
        make.right.equalTo(@(-10));
        make.height.equalTo(@300);
    }];
    
    
    _regitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _regitBtn.backgroundColor = [UIColor clearColor];
    [_regitBtn setBackgroundImage:[UIImage imageNamed:@"蓝色按钮"] forState:UIControlStateNormal];
    [_regitBtn setTitle:@"提交" forState:UIControlStateNormal];
    _regitBtn.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    [self addSubview:_regitBtn];
    
    [_regitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@70);
        make.bottom.equalTo(@(-60));
        make.width.equalTo(@(SCREEN_WIDTH-140));
        make.height.equalTo(@35);
        
    }];


    
}
@end
