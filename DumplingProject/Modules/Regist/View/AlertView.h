//
//  AlertView.h
//  DumplingProject
//
//  Created by 叶刚 on 16/3/15.
//  Copyright © 2016年 dumplingproject. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol tapDelegate <NSObject>

-(void) tapRemoveViewDelegate;

@end
@interface AlertView : UIView
{
    
}
@property (nonatomic, strong) UIView  *contentView;
@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) id<tapDelegate> delegate;
@property (nonatomic, strong) UIButton *backBtn;
@property (nonatomic, strong) UILabel *title;
@end
