//
//  ParliamentTableViewCell.m
//  DumplingProject
//
//  Created by 顾新生 on 16/3/25.
//  Copyright © 2016年 dumplingproject. All rights reserved.
//

#import "ParliamentTableViewCell.h"
#import "UIImage+Color.h"
@interface ParliamentTableViewCell ()

@property(nonatomic,strong)UILabel *badgeLabel;
@property(nonatomic,weak)UILabel *titleLabel;

@end

@implementation ParliamentTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupContentViews];
    }
    return self;
}



-(void)setupContentViews{
    //1、头像
    UIImageView *iconView=[[UIImageView alloc]initWithFrame:CGRectZero];
    [self.contentView addSubview:iconView];
    [iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.top.equalTo(@10);
        make.bottom.equalTo(@(-10));
        make.width.equalTo(iconView.mas_height);
    }];
    iconView.image=[UIImage imageNamed:@"_0002_群组"];
    
    //2、badge
    _badgeLabel=[[UILabel alloc]init];
    [self.contentView addSubview:_badgeLabel];
    [_badgeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.and.width.equalTo(@15);
        make.centerX.equalTo(iconView.mas_right);
        make.centerY.equalTo(iconView.mas_top);
    }];
    _badgeLabel.layer.cornerRadius=7.5;
    _badgeLabel.clipsToBounds=YES;
    _badgeLabel.backgroundColor=[UIColor redColor];
    _badgeLabel.textColor=[UIColor whiteColor];
    _badgeLabel.font=[UIFont boldSystemFontOfSize:10];
    _badgeLabel.textAlignment=NSTextAlignmentCenter;
    _badgeLabel.text=@"0";
    
    //3、名称
    UILabel *titleLabel=[[UILabel alloc]init];
    [self.contentView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(iconView.mas_right).offset(10);
        make.top.equalTo(@15);
        make.height.equalTo(@13);
    }];
    titleLabel.text=@"杭州讨论群";
    titleLabel.font=[UIFont systemFontOfSize:15];
    [titleLabel sizeToFit];
    _titleLabel=titleLabel;
    //4、lastMessage
    UILabel *lastMsgLabel=[[UILabel alloc]init];
    [self.contentView addSubview:lastMsgLabel];
    [lastMsgLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(@(-15));
        make.height.equalTo(@13);
        make.left.equalTo(titleLabel.mas_left);
        make.right.equalTo(self.contentView.mas_right).offset(-10);
    }];
    lastMsgLabel.font=[UIFont systemFontOfSize:11];
    lastMsgLabel.textColor=[UIColor grayColor];
    lastMsgLabel.text=@"金融方面的法规还需要多学习啊索朗多吉法律纠纷辣椒发";
    lastMsgLabel.numberOfLines=1;
    
    //5、时间
    UILabel *timeLabel=[[UILabel alloc]init];
    [self.contentView addSubview:timeLabel];
    [timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titleLabel.mas_top);
        make.height.equalTo(@13);
        make.right.equalTo(self.contentView.mas_right).offset(-10);
    }];
    timeLabel.font=[UIFont systemFontOfSize:11];
    timeLabel.textColor=[UIColor grayColor];
    timeLabel.text=@"2015年12月06日";
    timeLabel.numberOfLines=1;
    
}

-(void)setModel:(ParliamentCellModel *)model{
    _model=model;
    _titleLabel.text=model.title;
}
-(void)setBadgeNum:(NSInteger)badgeNum{
    _badgeNum=badgeNum;
    if (badgeNum==0) {
        _badgeLabel.hidden=YES;
    }else{
        _badgeLabel.hidden=NO;
        _badgeLabel.text=[NSString stringWithFormat:@"%ld",badgeNum];
    }
}
@end
