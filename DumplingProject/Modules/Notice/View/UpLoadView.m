//
//  UpLoadView.m
//  DumplingProject
//
//  Created by 叶刚 on 16/3/21.
//  Copyright © 2016年 dumplingproject. All rights reserved.
//

#import "UpLoadView.h"

@implementation UpLoadView

-(instancetype) initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setUPUI];
    }
    return  self;
}

-(void) setUPUI{
    
    
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.backgroundColor = [UIColor clearColor];
    _titleLabel.font = [UIFont systemFontOfSize:15];
    _titleLabel.text = @"上传文件说明";
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_titleLabel];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(@80);
        make.centerX.equalTo(@0);
        make.width.equalTo(@200);
        make.height.equalTo(@30);
    }];
    
    _instruction = [[UITextView alloc] init];
    _instruction.backgroundColor = [UIColor whiteColor];
    _instruction.layer.borderColor = [UIColor grayColor].CGColor;
    _instruction.layer.borderWidth = 0.5;
    _instruction.layer.cornerRadius = 5;
    _instruction.layer.shadowColor = [UIColor grayColor].CGColor;
    _instruction.layer.shadowOffset = CGSizeMake(2,2);
    _instruction.layer.shadowOpacity = 0.8;
    [self addSubview:_instruction];
    
    [_instruction mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_titleLabel.mas_bottom).offset(10);
        make.left.equalTo(@8);
        make.right.equalTo(@(-8));
        make.height.equalTo(@300);
    }];
    
    
    _uploadFileBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _uploadFileBtn.backgroundColor = [UIColor whiteColor];
    _uploadFileBtn.layer.shadowColor = [UIColor grayColor].CGColor;
    _uploadFileBtn.layer.shadowOffset = CGSizeMake(1,2);
    _uploadFileBtn.layer.shadowOpacity = 0.8;
//    [_uploadFileBtn setBackgroundImage:[UIImage imageNamed:@"蓝色按钮"] forState:UIControlStateNormal];
    [_uploadFileBtn setTitle:@"上传文件" forState:UIControlStateNormal];
    _uploadFileBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [_uploadFileBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [[_uploadFileBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        if (self.uploadBlock) {
            self.uploadBlock(upbtnTypeUp);
        }
    }];
    _uploadFileBtn.layer.cornerRadius = 5;
    
    [self addSubview:_uploadFileBtn];
    
    [_uploadFileBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(_instruction.mas_bottom).offset(30);
        make.centerX.equalTo(_instruction.mas_centerX);
        make.width.equalTo(@150);
        make.height.equalTo(@40);
    }];

    _regitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _regitBtn.backgroundColor = [UIColor clearColor];
    _regitBtn.layer.shadowColor = [UIColor grayColor].CGColor;
    _regitBtn.layer.shadowOffset = CGSizeMake(1,2);
    _regitBtn.layer.shadowOpacity = 0.8;
    [_regitBtn setBackgroundImage:[UIImage imageNamed:@"蓝色按钮"] forState:UIControlStateNormal];
    [_regitBtn setTitle:@"提交" forState:UIControlStateNormal];
    _regitBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [[_regitBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        if (self.uploadBlock) {
            self.uploadBlock(upbtnTypeRegit);
        }
    }];
    _regitBtn.layer.cornerRadius = 5;
    
    [self addSubview:_regitBtn];
    
    [_regitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(_uploadFileBtn.mas_bottom).offset(30);
        make.centerX.equalTo(_uploadFileBtn.mas_centerX);
        make.width.equalTo(@150);
        make.height.equalTo(@40);
    }];

}
@end
