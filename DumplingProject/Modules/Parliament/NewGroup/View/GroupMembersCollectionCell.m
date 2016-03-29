//
//  GroupMembersCollectionCell.m
//  DumplingProject
//
//  Created by 顾新生 on 16/3/29.
//  Copyright © 2016年 dumplingproject. All rights reserved.
//



#import "GroupMembersCollectionCell.h"

@interface GroupMembersCollectionCell ()
@property(nonatomic,weak)UIButton *iconBtn;
@property(nonatomic,weak)UILabel  *titleLabel;

@end

@implementation GroupMembersCollectionCell

-(instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        [self setupSubviews];
        self.cellType=CollectionCellTypeMember;
    }
    return self;
}

-(void)setupSubviews{
    //1、icon
    UIButton *iconBtn=[[UIButton alloc]init];
    [self.contentView addSubview:iconBtn];
    [iconBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.and.width.equalTo(self.mas_width);
        make.left.and.top.equalTo(@0);
    }];
    [iconBtn setImage:[UIImage imageNamed:@"_0002_群组"] forState:UIControlStateNormal];
    _iconBtn=iconBtn;
    [iconBtn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    //2、title
    UILabel *titleLabel=[[UILabel alloc]init];
    [self.contentView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.mas_width);
        make.bottom.equalTo(@0);
        make.centerX.equalTo(@0);
    }];
    titleLabel.text=@"吃肉的猫";
    titleLabel.font=[UIFont systemFontOfSize:9];
    titleLabel.textColor=[UIColor grayColor];
    titleLabel.numberOfLines=0;
    titleLabel.textAlignment=NSTextAlignmentCenter;
    titleLabel.preferredMaxLayoutWidth=self.contentView.bounds.size.width;
    [titleLabel sizeToFit];
    _titleLabel=titleLabel;
}

-(void)btnClick{
    BOOL flag=nil;
    switch (self.cellType) {
        case CollectionCellTypeActionAdd:
            flag=YES;
            break;
        case CollectionCellTypeActionDel:
            flag=NO;
            break;
        default:
            break;
    }
    [[NSNotificationCenter defaultCenter]postNotificationName:GroupMembersCollectionCellClickAction object:@(flag)];
}

-(void)setCellType:(CollectionCellType)cellType{
    _cellType=cellType;
    switch (cellType) {
        case CollectionCellTypeActionAdd:{
            _titleLabel.hidden=YES;
            [_iconBtn setImage:[UIImage imageNamed:@"_0003_添加成员"] forState:UIControlStateNormal];
        }
            break;
        case CollectionCellTypeActionDel:{
            _titleLabel.hidden=YES;
            [_iconBtn setImage:[UIImage imageNamed:@"_0004_删除成员"] forState:UIControlStateNormal];
        }
            break;
        default:{
            _titleLabel.hidden=NO;
        }
            break;
    }
}


@end
