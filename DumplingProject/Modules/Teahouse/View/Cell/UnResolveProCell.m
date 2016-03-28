//
//  UnResolveProCell.m
//  DumplingProject
//
//  Created by 叶刚 on 16/3/25.
//  Copyright © 2016年 dumplingproject. All rights reserved.
//

#import "UnResolveProCell.h"

@implementation UnResolveProCell

//- (void)awakeFromNib {
//    [super awakeFromNib];
//    // Initialization code
//}
//
//- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];
//
//    // Configure the view for the selected state
//}

-(instancetype ) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setUPUI];
    }
    return  self;
}


-(void) setUPUI{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
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
    
    _custumNameLabel = [[UILabel alloc] init];
    _custumNameLabel.text = @"饺子3号";
    _custumNameLabel.font = [UIFont systemFontOfSize:13];
    _custumNameLabel.backgroundColor = [UIColor clearColor];
    _custumNameLabel.textColor = [UIColor grayColor];
    [self addSubview:_custumNameLabel];
    
    [_custumNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(_iconimage.mas_centerY);
        make.height.equalTo(@20);
        make.left.equalTo(_iconimage.mas_right).offset(10);
        make.width.equalTo(@230);
        
    }];
    
    _answerLabel = [[UILabel alloc] init];
    _answerLabel.text = @"偶尔需要";
    _answerLabel.font = [UIFont systemFontOfSize:14];
    _answerLabel.numberOfLines = 0;
    _answerLabel.backgroundColor = [UIColor clearColor];
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:_answerLabel.text];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    
    [paragraphStyle setLineSpacing:5];//调整行间距
    
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [_answerLabel.text length])];
    _answerLabel.attributedText = attributedString;
    //    [contentView addSubview:label];
    [_answerLabel sizeToFit];
    [self addSubview:_answerLabel];
    
    [_answerLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_custumNameLabel.mas_bottom);
        make.bottom.equalTo(@0);
        make.left.equalTo(_iconimage.mas_right).offset(10);
        make.width.equalTo(@230);
        
    }];
    
    
    
    _answerDateLabel = [[UILabel alloc] init];
//    _answerDateLabel.textColor = [UIColor orangeColor];
    _answerDateLabel.text = @"2015.11.20";
    _answerDateLabel.font = [UIFont systemFontOfSize:13];
    _answerDateLabel.backgroundColor = [UIColor clearColor];
    _answerDateLabel.textColor = [UIColor grayColor];

    _answerDateLabel.textAlignment = NSTextAlignmentRight;
    [self addSubview:_answerDateLabel];
    
    [_answerDateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_custumNameLabel.mas_centerY);
        make.right.equalTo(@(-10));
        make.width.equalTo(@120);
        make.height.equalTo(@20);
    }];
    
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//    button.backgroundColor = [UIColor clearColor];
//    [button setBackgroundImage:[UIImage imageNamed:@"蓝色按钮"] forState:UIControlStateNormal];
//    [button setTitle:@"选为最佳答案" forState:UIControlStateNormal];
//    button.titleLabel.font = [UIFont systemFontOfSize:13];
//    [[button rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
//        if (self.chooseActionBlock) {
//            self.chooseActionBlock();
//        }
//    }];
//    [self addSubview:button];
//    
//    [button mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.height.equalTo(@30);
//        make.bottom.right.equalTo(@(-10));
//        make.width.equalTo(@140);
//        
//    }];
    
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
