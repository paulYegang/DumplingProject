//
//  MessageCell.m
//  DumplingProject
//
//  Created by 顾新生 on 16/3/28.
//  Copyright © 2016年 dumplingproject. All rights reserved.
//

#import "MessageCell.h"
@interface MessageCell()
@property(nonatomic,weak)UIButton *leftBtn;
@property(nonatomic,weak)UIButton *rightBtn;

@end

@implementation MessageCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupSubviews];
        self.cellType=MessageCellTypeButtonHide;
    }
    return self;
}
-(void)setupSubviews{
    
    //1、imageView
    UIImageView *imgView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"_0002_消息"]];
    [self.contentView addSubview:imgView];
    [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.top.equalTo(@12);
        make.bottom.equalTo(@(-12));
        make.width.equalTo(imgView.mas_height);
    }];
    
    
    //2、messageLabel
    UILabel *messageLabel=[[UILabel alloc]init];
    [self.contentView addSubview:messageLabel];
    [messageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(imgView.mas_right).offset(15);
        make.top.and.bottom.equalTo(@0);
    }];
    [messageLabel sizeToFit];
    messageLabel.textAlignment=NSTextAlignmentCenter;
    messageLabel.text=@"王阳请求添加好友";
    messageLabel.font=[UIFont systemFontOfSize:15];
    messageLabel.textColor=[UIColor darkGrayColor];
    //3、buttons
    UIButton *rightBtn=[[UIButton alloc]init];
    [self.contentView addSubview:rightBtn];
    [rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(SCREEN_WIDTH*0.16));
        make.height.equalTo(@30);
        make.right.equalTo(@(-10));
        make.centerY.equalTo(@0);
    }];
    rightBtn.tag=1;
    [rightBtn setTitle:@"拒绝" forState:UIControlStateNormal];
    [rightBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    rightBtn.titleLabel.font=[UIFont systemFontOfSize:13];
    [rightBtn setBackgroundImage:[UIImage imageNamed:@"_0001_赌馆下注按钮"] forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(btnsDidClick:) forControlEvents:UIControlEventTouchUpInside];
    self.rightBtn=rightBtn;
    
    UIButton *leftBtn=[[UIButton alloc]init];
    [self.contentView addSubview:leftBtn];
    [leftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(SCREEN_WIDTH*0.16));
        make.height.equalTo(@30);
        make.right.equalTo(rightBtn.mas_left).offset(-5);
        make.centerY.equalTo(@0);
    }];
    leftBtn.tag=0;
    [leftBtn setTitle:@"同意" forState:UIControlStateNormal];
    [leftBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    leftBtn.titleLabel.font=[UIFont systemFontOfSize:13];
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"_0001_赌馆下注按钮"] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(btnsDidClick:) forControlEvents:UIControlEventTouchUpInside];
    
    self.leftBtn=leftBtn;
    
    
    
    
}
/**
 *  按钮添加点击事件
 */
-(void)btnsDidClick:(UIButton *)sender{

    if (self.delegate!=nil && [self.delegate respondsToSelector:@selector(cellBtnDidClick:)]) {
        if (sender.tag==0) {
            [self.delegate cellBtnDidClick:YES];
        }else{
            [self.delegate cellBtnDidClick:NO];
        }
    }
}



-(void)setCellType:(MessageCellType)cellType{
    _cellType=cellType;
    switch (cellType) {
        case MessageCellTypeButtonHide:{
            self.leftBtn.hidden=YES;
            self.rightBtn.hidden=YES;
        }
            break;
        case MessageCellTypeButtonShow:{
            self.leftBtn.hidden=NO;
            self.rightBtn.hidden=NO;
        }
            break;
        default:
            break;
    }
}

@end
