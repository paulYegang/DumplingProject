//
//  NewRuleCell.m
//  DumplingProject
//
//  Created by 叶刚 on 16/3/18.
//  Copyright © 2016年 dumplingproject. All rights reserved.
//

#import "NewRuleCell.h"

@implementation NewRuleCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setUPUI];
        
    }
    return self;
}

-(void)setUPUI{
    
    self.layer.cornerRadius = 5;
    self.backgroundColor = [UIColor clearColor];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
//    self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"新规范圆角矩形框"]];
    
    UIImageView *back = [[UIImageView alloc] init];
    back.backgroundColor = [UIColor clearColor];
    back.image = [UIImage imageNamed:@"新规范圆角矩形框"];
    [self addSubview:back];
    [back mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(@0);
    }];
    
    
    _titleLabel = [self createLabel:[NSString stringWithFormat:@"标题：【%@】",_rulemodel.titleString] fonts:[UIFont boldSystemFontOfSize:20]];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@10);
        make.left.equalTo(@10);
        make.width.equalTo(@300);
        make.height.equalTo(@40);
    }];
    
    _nuberLabel = [self createLabel:[NSString stringWithFormat:@"文号：【%@】",_rulemodel.nuberString] fonts:[UIFont systemFontOfSize:17]];
    [_nuberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_titleLabel.mas_bottom).offset(0);
        make.left.equalTo(@10);
        make.width.equalTo(@300);
        make.height.equalTo(@30);
    }];
    
    _companyLabel = [self createLabel:[NSString stringWithFormat:@"发文机构：%@",_rulemodel.companyName] fonts:[UIFont systemFontOfSize:17]];
    [_companyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_nuberLabel.mas_bottom).offset(0);
        make.left.equalTo(@10);
        make.width.equalTo(@300);
        make.height.equalTo(@30);
    }];

    _publishTimeLabel = [self createLabel:[NSString stringWithFormat:@"发布时间：%@",_rulemodel.publishTime] fonts:[UIFont systemFontOfSize:17]];
    [_publishTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_companyLabel.mas_bottom).offset(0);
        make.left.equalTo(@10);
        make.width.equalTo(@300);
        make.height.equalTo(@30);
    }];

    _effectiveTimeLabel = [self createLabel:[NSString stringWithFormat:@"生效时间：%@",_rulemodel.effectiveTime] fonts:[UIFont systemFontOfSize:17]];
    [_effectiveTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_publishTimeLabel.mas_bottom).offset(0);
        make.left.equalTo(@10);
        make.width.equalTo(@300);
        make.height.equalTo(@30);
    }];

    
}

-(UILabel*) createLabel:(NSString*) text fonts:(UIFont *) font {
    
    UILabel *title = [[UILabel alloc] init];
    title.text = text;
    title.font = font;
    title.backgroundColor = [UIColor clearColor];
    [self addSubview:title];
    return title;
}
@end
