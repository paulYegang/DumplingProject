//
//  AskQuestionVIew.m
//  DumplingProject
//
//  Created by 叶刚 on 16/3/29.
//  Copyright © 2016年 dumplingproject. All rights reserved.
//

#import "AskQuestionVIew.h"

@implementation AskQuestionVIew

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype) initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupui];
    }
     return self;
}


-(void) setupui{
    _questionTitleTextField = [[UITextField alloc] init];
    _questionTitleTextField.backgroundColor = [UIColor whiteColor];
    //    [textfield setBackgroundColor: [UIColor colorWithPatternImage:[UIImage imageNamed:@"_0003_账号密码框"]]];
    _questionTitleTextField.placeholder = @"请输入提问标题";
    _questionTitleTextField.delegate = self;
    _questionTitleTextField.textAlignment = NSTextAlignmentCenter;
    //    textfield1.borderStyle = UITextBorderStyleRoundedRect;
    _questionTitleTextField.layer.borderColor = [UIColor grayColor].CGColor;
    _questionTitleTextField.layer.borderWidth = 0.5;
    _questionTitleTextField.layer.cornerRadius = 8;
    _questionTitleTextField.font = [UIFont systemFontOfSize:14];
    //    textfield1.secureTextEntry = YES;
    [self addSubview:_questionTitleTextField];
//    _questionTitleTextField.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 8, 0)];
//    _questionTitleTextField.leftViewMode = UITextFieldViewModeAlways;
    [_questionTitleTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo (@20);
        make.right.equalTo(@(-20));
        make.height.equalTo(@30);
        make.top.equalTo(@20);
    }];
    
    
    _detailTextView = [[UITextView alloc] init];
    _detailTextView.backgroundColor = [UIColor whiteColor];
    _detailTextView.textColor = [UIColor colorWithWhite:0.7 alpha:1];
    _detailTextView.text = @"请输入详细内容";
    _detailTextView.delegate = self;
    _detailTextView.font = [UIFont systemFontOfSize:14];
    _detailTextView.layer.borderColor = [UIColor grayColor].CGColor;
    _detailTextView.layer.borderWidth = 0.5;
    _detailTextView.layer.cornerRadius = 2;
    _detailTextView.layer.shadowColor = [UIColor grayColor].CGColor;
    _detailTextView.layer.shadowOffset = CGSizeMake(2,2);
    _detailTextView.layer.shadowOpacity = 1;
    [self addSubview:_detailTextView];
    
    [_detailTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_questionTitleTextField.mas_bottom).offset(20);
        make.left.equalTo(@20);
        make.right.equalTo(@(-20));
        make.height.equalTo(@280);
    }];

    _chooseTypeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _chooseTypeBtn.backgroundColor = [UIColor whiteColor];
    [_chooseTypeBtn setBackgroundImage:[UIImage imageNamed:@"_0001_理由框"] forState:UIControlStateNormal];
    [_chooseTypeBtn setShowsTouchWhenHighlighted:YES];
    [_chooseTypeBtn setTitle:@"选择问题类型" forState:UIControlStateNormal];
    _chooseTypeBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    _chooseTypeBtn.layer.shadowColor = [UIColor grayColor].CGColor;
    _chooseTypeBtn.layer.shadowOffset = CGSizeMake(2, 2);
    _chooseTypeBtn.layer.shadowOpacity =1;
    _chooseTypeBtn.layer.cornerRadius = 5;
    [_chooseTypeBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self addSubview:_chooseTypeBtn];
    
    [_chooseTypeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@20);
        make.top.equalTo(_detailTextView.mas_bottom).offset(20);
        make.width.equalTo(@110);
        make.height.equalTo(@35);
        
    }];

    
    
}

- (void)textViewDidBeginEditing:(UITextView *)textView{
    textView.text = nil;
    textView.textColor = [UIColor blackColor];
}



@end
