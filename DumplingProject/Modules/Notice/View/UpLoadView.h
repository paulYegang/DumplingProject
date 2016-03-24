//
//  UpLoadView.h
//  DumplingProject
//
//  Created by 叶刚 on 16/3/21.
//  Copyright © 2016年 dumplingproject. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger,upbtnType) {
    
    upbtnTypeUp,
    upbtnTypeRegit
};


@interface UpLoadView : UIView

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UITextView *instruction;
@property (nonatomic, strong) UIButton *uploadFileBtn;
@property (nonatomic, strong) UIButton *regitBtn;
@property (nonatomic, copy) void(^uploadBlock) (upbtnType);
-(instancetype) initWithFrame:(CGRect)frame;
@end
