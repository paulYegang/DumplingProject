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
    iconView.image=[UIImage imageWithColor:[UIColor grayColor]];
    
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
    UILabel *title=[[UILabel alloc]init];
    [self.contentView addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(iconView.mas_right).offset(10);
        make.top.equalTo(@15);
        make.height.equalTo(@13);
    }];
    title.text=@"杭州讨论群";
    title.font=[UIFont systemFontOfSize:15];
    [title sizeToFit];
    
    //4、lastMessage
    UILabel *lastMsgLabel=[[UILabel alloc]init];
    [self.contentView addSubview:lastMsgLabel];
    [lastMsgLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(@(-15));
        make.height.equalTo(@13);
        make.left.equalTo(title.mas_left);
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
        make.top.equalTo(title.mas_top);
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
