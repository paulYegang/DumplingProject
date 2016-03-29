//
//  QuestionTitleView.m
//  DumplingProject
//
//  Created by 叶刚 on 16/3/28.
//  Copyright © 2016年 dumplingproject. All rights reserved.
//

#import "QuestionTitleView.h"

@implementation QuestionTitleView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype) initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setUPUUI];
    }
    return self;
}

-(void) setUPUUI{
    
    //提问人头像
    _iconimage = [[UIImageView alloc] init];
    _iconimage.backgroundColor = [UIColor clearColor];
    _iconimage.layer.cornerRadius = 10;
    _iconimage.image = [UIImage imageNamed:@"_0000_叹号"];
    [self addSubview:_iconimage];
    
    [_iconimage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@15);
        make.top.equalTo(@10);
        make.width.height.equalTo(@30);
        
    }];
    
    //提问者姓名，部门，时间
    _custumNameLabel = [[UILabel alloc] init];
    _custumNameLabel.text = @"饺子3号-公司治理-2015.11.20";
    _custumNameLabel.font = [UIFont systemFontOfSize:13];
    _custumNameLabel.backgroundColor = [UIColor clearColor];
    _custumNameLabel.textColor = [UIColor grayColor];
    [self addSubview:_custumNameLabel];
    
    [_custumNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(_iconimage.mas_centerY);
        make.height.equalTo(@20);
        make.left.equalTo(_iconimage.mas_right).offset(10);
        make.width.equalTo(@190);
        
    }];
    
    //悬赏饺子数量
    _gitLabel = [[UILabel alloc] init];
    _gitLabel.text = @"悬赏5饺子";
    _gitLabel.textColor = [UIColor orangeColor];
    _gitLabel.font = [UIFont systemFontOfSize:13];
    _gitLabel.backgroundColor = [UIColor clearColor];
    [self addSubview:_gitLabel];
    
    [_gitLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_custumNameLabel.mas_right);
        make.centerY.equalTo(_custumNameLabel.mas_centerY);
        make.width.equalTo(@100);
        make.height.equalTo(@20);
    }];
    
    //提问者提出的问题
    _qeustionLabel = [[UILabel alloc] init];
    _qeustionLabel.text = @"基金管理公司需要设立董事会吗？如何确定设立细节？";
    _qeustionLabel.font = [UIFont systemFontOfSize:14];
    _qeustionLabel.numberOfLines = 0;
    _qeustionLabel.backgroundColor = [UIColor clearColor];
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:_qeustionLabel.text];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    
    [paragraphStyle setLineSpacing:5];//调整行间距
    
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [_qeustionLabel.text length])];
    _qeustionLabel.attributedText = attributedString;
    //    [contentView addSubview:label];
    [_qeustionLabel sizeToFit];
    [self addSubview:_qeustionLabel];
    
    [_qeustionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_custumNameLabel.mas_bottom);
        make.height.equalTo(@40);
        make.left.equalTo(_custumNameLabel.mas_left);
        make.right.equalTo(@(-20));
        
    }];
    
    //最佳答案
    UILabel *bestAnser = [[UILabel alloc] init];
    bestAnser.text= @"最佳答案:";
    bestAnser.font = [UIFont systemFontOfSize:13.5];
    bestAnser.backgroundColor = [UIColor clearColor];
    [self addSubview:bestAnser];
    
    [bestAnser mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_custumNameLabel.mas_left);
        make.top.equalTo(_qeustionLabel.mas_bottom);
        make.bottom.equalTo(@(-10));
        make.width.equalTo(@70);
        
    }];
    
    _answerLabel = [[UILabel alloc] init];
    _answerLabel.textColor =[UIColor grayColor];
    _answerLabel.text = @"待选择";
    _answerLabel.font = [UIFont systemFontOfSize:13];
    [self addSubview:_answerLabel];
    
    [_answerLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bestAnser.mas_right);
        make.centerY.equalTo(bestAnser.mas_centerY);
        make.width.equalTo(@300);
        make.height.equalTo(@20);
    }];
    
    

}
@end
