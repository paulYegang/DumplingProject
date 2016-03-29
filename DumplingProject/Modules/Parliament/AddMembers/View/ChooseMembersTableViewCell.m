//
//  ChooseMembersTableViewCell.m
//  DumplingProject
//
//  Created by 顾新生 on 16/3/29.
//  Copyright © 2016年 dumplingproject. All rights reserved.
//

#import "ChooseMembersTableViewCell.h"
@interface ChooseMembersTableViewCell()
@property(nonatomic,weak)UIButton *checkBox;
@end
@implementation ChooseMembersTableViewCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupSubviews];
        self.chosen=NO;
        self.selectionStyle=UITableViewCellSelectionStyleNone;
    }
    return self;
}
-(void)setupSubviews{
    //1、图片
    UIImageView *iconView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"_0000_千人群"]];
    [self.contentView addSubview:iconView];
    [iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.top.equalTo(@10);
        make.bottom.equalTo(@(-10));
        make.width.equalTo(iconView.mas_height);
    }];
    //2、名称
    UILabel *nameLabel=[[UILabel alloc]initWithFrame:CGRectZero];
    [self.contentView addSubview:nameLabel];
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(iconView.mas_right).offset(10);
        make.top.and.bottom.equalTo(@0);
    }];
    [nameLabel sizeToFit];
    nameLabel.text=@"吃肉的猫";
    nameLabel.textColor=[UIColor darkGrayColor];

    //3、checkBox
    UIButton *checkBox=[[UIButton alloc]init];
    [self.contentView addSubview:checkBox];
    [checkBox mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(@(-20));
        make.width.and.height.equalTo(@(self.bounds.size.height*0.5));
        make.centerY.equalTo(@0);
    }];
    [checkBox setImage:[UIImage imageNamed:@"_0000_选择联系人-框"] forState:UIControlStateNormal];
    [checkBox addTarget:self action:@selector(cellClick) forControlEvents:UIControlEventTouchUpInside];
    _checkBox=checkBox;
}

-(void)cellClick{
    if (!self.isChosen) {
        [_checkBox setImage:[UIImage imageNamed:@"_0001_选择联系人-选中"] forState:UIControlStateNormal];
    }else{
        [_checkBox setImage:[UIImage imageNamed:@"_0000_选择联系人-框"] forState:UIControlStateNormal];
    }
    self.chosen=!self.isChosen;
}

@end
