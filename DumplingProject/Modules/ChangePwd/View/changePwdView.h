//
//  RegistView.h
//  DumplingProject
//
//  Created by 叶刚 on 16/3/14.
//  Copyright © 2016年 dumplingproject. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger,BtnType) {
    
    BtnTypeBack,
    BtnTypeChange,
    BtnTypeTest
   
};

@interface changePwdView : UIView <UITextFieldDelegate>

@property(nonatomic,copy) void(^backBlock)(BtnType);
@end
