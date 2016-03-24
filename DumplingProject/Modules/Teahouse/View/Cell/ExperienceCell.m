//
//  ExperienceCell.m
//  DumplingProject
//
//  Created by 叶刚 on 16/3/24.
//  Copyright © 2016年 dumplingproject. All rights reserved.
//

#import "ExperienceCell.h"

@implementation ExperienceCell

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
    _nameCompanydate.font = [UIFont boldSystemFontOfSize:19];
    _nameCompanydate.backgroundColor = [UIColor clearColor];
    [self addSubview:_nameCompanydate];
    
    [_nameCompanydate mas_makeConstraints:^(MASConstraintMaker *make) {

        make.centerY.equalTo(_iconImage.mas_centerY);
        make.height.equalTo(@20);
        make.left.equalTo(_iconImage.mas_right);
        make.width.equalTo(@200);
        
    }];
    
    _questionLabel = [[UILabel alloc] init];
    _questionLabel.text = @"基金管理公司需要设立董事会吗？如何确定设立细节？";
    _questionLabel.font = [UIFont boldSystemFontOfSize:19];
    _questionLabel.numberOfLines = 0;
    _questionLabel.backgroundColor = [UIColor clearColor];
    [self addSubview:_questionLabel];
    
    [_questionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_nameCompanydate.mas_bottom);
        make.bottom.equalTo(@0);
        make.left.equalTo(_iconImage.mas_right);
        make.width.equalTo(@200);
        
    }];
    
    

    
    

    
    
}

@end
