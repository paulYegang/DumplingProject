//
//  ParliamentNewGroupCell.m
//  DumplingProject
//
//  Created by 顾新生 on 16/3/25.
//  Copyright © 2016年 dumplingproject. All rights reserved.
//

#import "ParliamentNewGroupCell.h"

@implementation ParliamentNewGroupCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupSubViews];
    }
    return self;
}

-(void)setupSubViews{
    
    //1、加号按钮
    UIButton *addBtn=[[UIButton alloc]init];
    [self.contentView addSubview:addBtn];
    [addBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.top.equalTo(@10);
        make.bottom.equalTo(@(-10));
        make.width.equalTo(addBtn.mas_height);
    }];
    [addBtn setImage:[UIImage imageNamed:@"_0001_新建群组"] forState:UIControlStateNormal];
    [addBtn setImage:[UIImage imageNamed:@"_0001_更换群头像"] forState:UIControlStateHighlighted];
    [addBtn addTarget:self action:@selector(addBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    //2、新建群组
    UILabel *titleLabel=[[UILabel alloc]init];
    [self.contentView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(addBtn.mas_right).offset(10);
        make.height.equalTo(@20);
        make.centerY.equalTo(@0);
    }];
    titleLabel.font=[UIFont boldSystemFontOfSize:17];
    titleLabel.text=@"新建群组";
}

-(void)addBtnClick:(UIButton *)sender{
    if (self.delegate!=nil&&[self.delegate respondsToSelector:@selector(newGroupBtnDidClick:)]) {
        [self.delegate newGroupBtnDidClick:self];
    }

}

@end
