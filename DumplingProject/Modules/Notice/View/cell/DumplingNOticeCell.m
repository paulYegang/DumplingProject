//
//  DumplingNOticeCell.m
//  DumplingProject
//
//  Created by 叶刚 on 16/3/23.
//  Copyright © 2016年 dumplingproject. All rights reserved.
//

#import "DumplingNOticeCell.h"

@implementation DumplingNOticeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUPUI];
    }
    return self;
}

-(void) setUPUI{
    //todo: 招聘职位
    _noticeLabel = [self createLabel:@"通知：" fonts:[UIFont boldSystemFontOfSize:18] align:NSTextAlignmentLeft textcolor:[UIColor blackColor]];
    [_noticeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@17);
        make.left.equalTo(@20);
        make.height.equalTo(@20);
        make.width.equalTo(@300);
    }];
    
    
    UILabel *man = [self createLabel:@"发布人：" fonts:[UIFont systemFontOfSize:15] align:NSTextAlignmentLeft textcolor:[UIColor grayColor]];
    [man mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_noticeLabel.mas_bottom).offset(15);
        make.left.equalTo(@20);
        make.bottom.equalTo(@(-17));
        make.width.equalTo(@70);
    }];
    
    
    
    //todo: 招募信息发布人
    _publishManLable = [self createLabel:@"饺子大王" fonts:[UIFont systemFontOfSize:15] align:NSTextAlignmentLeft textcolor:[UIColor grayColor]];
    [_publishManLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(man.mas_top);
        make.left.equalTo(man.mas_right);
        make.bottom.equalTo(@(-17));
        make.width.equalTo(@200);
    }];
    
    
    //todo: 招募信息发布日期
    _dateLabel = [self createLabel:@"2015.11.20" fonts:[UIFont systemFontOfSize:15] align:NSTextAlignmentRight textcolor:[UIColor grayColor]];
    [_dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(man.mas_top);
        make.right.equalTo(@(-20));
        make.bottom.equalTo(@(-17));
        make.width.equalTo(@300);
    }];
    
    UIImageView *line = [[UIImageView alloc] init];
    line.backgroundColor = [UIColor grayColor];
    line.alpha = 0.5;
    [self addSubview:line];
    
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(@0);
        make.left.right.equalTo(@0);
        make.height.equalTo(@1);
        
    }];
    
}

//创建Label
-(UILabel*) createLabel:(NSString*) title fonts:(UIFont*) fonts  align:(NSTextAlignment) align textcolor:(UIColor*)textcolor{
    
    UILabel *label = [[UILabel alloc] init];
    label.text = title;
    label.font = fonts;
    label.textAlignment = align;
    label.textColor = textcolor;
    label.backgroundColor = [UIColor clearColor];
    [self addSubview:label];
    
    return label;
}

@end
