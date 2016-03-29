//
//  AskQuestionVIew.h
//  DumplingProject
//
//  Created by 叶刚 on 16/3/29.
//  Copyright © 2016年 dumplingproject. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AskQuestionVIew : UIView <UITextFieldDelegate,UITextViewDelegate>

@property (nonatomic,strong) UITextField *questionTitleTextField;
@property (nonatomic,strong) UITextView *detailTextView;
@property (nonatomic,strong) UIButton *chooseTypeBtn;
@property (nonatomic,strong) UITextField *dumplingNum;
@property (nonatomic,strong) UIButton * rigitBtn;
@end
