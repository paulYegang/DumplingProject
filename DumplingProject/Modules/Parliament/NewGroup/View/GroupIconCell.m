//
//  GroupIconCell.m
//  DumplingProject
//
//  Created by 顾新生 on 16/3/28.
//  Copyright © 2016年 dumplingproject. All rights reserved.
//

#import "GroupIconCell.h"

@implementation GroupIconCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupSubviews];
    }
    return self;
}
-(void)setupSubviews{
    //1、icon
    UIButton *iconView=[[UIButton alloc]init];
    [self.contentView addSubview:iconView];
    [iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_centerX).offset(-10);
        make.centerY.equalTo(@0);
        make.height.and.width.equalTo(@(SCREEN_WIDTH*0.15));
    }];
    [iconView setImage:[UIImage imageNamed:@"_0000_千人群"] forState:UIControlStateNormal];
    
    //2、addBtn
    UIButton *addBtn=[[UIButton alloc]init];
    [self.contentView addSubview:addBtn];
    [addBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_centerX).offset(10);
        make.centerY.equalTo(@0);
        make.height.and.width.equalTo(@(SCREEN_WIDTH*0.15));
    }];
    [addBtn setImage:[UIImage imageNamed:@"_0001_更换群头像"] forState:UIControlStateNormal];
    [addBtn addTarget:self action:@selector(addBtnClick) forControlEvents:UIControlEventTouchUpInside];
}

-(void)addBtnClick{
    [[NSNotificationCenter defaultCenter]postNotificationName:GroupIconCellAddBtnClick object:self];
}

@end
