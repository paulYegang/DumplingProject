//
//  ExperienceCell.m
//  DumplingProject
//
//  Created by 叶刚 on 16/3/24.
//  Copyright © 2016年 dumplingproject. All rights reserved.
//

#import "UnsolvedExperienceCell.h"

@implementation UnsolvedExperienceCell

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
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    _iconImage = [[UIImageView alloc] init];
    _iconImage.backgroundColor = [UIColor clearColor];
    _iconImage.layer.cornerRadius = 10;
    _iconImage.image = [UIImage imageNamed:@"_0000_叹号"];
    [self addSubview:_iconImage];
    
    [_iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@15);
        make.top.equalTo(@10);
        make.width.height.equalTo(@30);
        
    }];
    
    _nameCompanydate = [[UILabel alloc] init];
    _nameCompanydate.text = @"饺子3号-公司治理-2015.11.20";
    _nameCompanydate.font = [UIFont systemFontOfSize:13];
    _nameCompanydate.backgroundColor = [UIColor clearColor];
    _nameCompanydate.textColor = [UIColor grayColor];
    [self addSubview:_nameCompanydate];
    
    [_nameCompanydate mas_makeConstraints:^(MASConstraintMaker *make) {

        make.centerY.equalTo(_iconImage.mas_centerY);
        make.height.equalTo(@20);
        make.left.equalTo(_iconImage.mas_right).offset(10);
        make.width.equalTo(@230);
        
    }];
    
    _questionLabel = [[UILabel alloc] init];
    _questionLabel.text = @"基金管理公司需要设立董事会吗？如何确定设立细节？";
    _questionLabel.font = [UIFont systemFontOfSize:14];
    _questionLabel.numberOfLines = 0;
    _questionLabel.backgroundColor = [UIColor clearColor];
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:_questionLabel.text];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    
    [paragraphStyle setLineSpacing:5];//调整行间距
    
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [_questionLabel.text length])];
    _questionLabel.attributedText = attributedString;
//    [contentView addSubview:label];
    [_questionLabel sizeToFit];
    [self addSubview:_questionLabel];
    
    [_questionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_nameCompanydate.mas_bottom);
        make.bottom.equalTo(@0);
        make.left.equalTo(_iconImage.mas_right).offset(10);
        make.width.equalTo(@230);
        
    }];
    
    _rewardImage = [[UIImageView alloc] init];
    _rewardImage.backgroundColor = [UIColor clearColor];
    _rewardImage.image = [UIImage imageNamed:@"_0001_悬赏"];
    [self addSubview:_rewardImage];
    
    [_rewardImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(@0);
        make.right.equalTo(@(-20));
        make.width.height.equalTo(@70);
    }];
    
    

    _rewardNumber = [[UILabel alloc] init];
    _rewardNumber.textColor = [UIColor orangeColor];
    _rewardNumber.text = @"+5000";
    _rewardNumber.font = [UIFont systemFontOfSize:15];
    _rewardNumber.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_rewardNumber];
    
    [_rewardNumber mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_rewardImage.mas_centerX);
        make.centerY.equalTo(_rewardImage.mas_centerY).offset(15);
    }];
    
    
    UIImageView *line = [[UIImageView alloc] init];
    line.backgroundColor = [UIColor grayColor];
    line.alpha = 0.3;
    [self addSubview:line];
    
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(@0);
        make.left.right.equalTo(@0);
        make.height.equalTo(@1);
        
    }];

    
    
    
}

@end
