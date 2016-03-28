//
//  SelectBtn.h
//  MMTravel
//
//  Created by 顾新生 on 15/9/29.
//  Copyright © 2015年 super. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SelectBtnDelegate <NSObject>

@required
-(void)selectBtnDidClick:(UIButton *)btn;

@end

@interface SelectBtn : UIView
@property (strong, nonatomic)  UIButton *leftBtn;
@property (strong, nonatomic)  UIButton *rightBtn;

@property(weak,nonatomic)id<SelectBtnDelegate>delegate;

-(instancetype)initWithLeftTitle:(NSString *)left rightTitle:(NSString *)right;
@end
