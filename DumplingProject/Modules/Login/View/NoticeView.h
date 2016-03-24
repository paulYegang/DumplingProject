//
//  NoticeView.h
//  DumplingProject
//
//  Created by 叶刚 on 16/3/14.
//  Copyright © 2016年 dumplingproject. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger,ActionType) {
    
    ActionTypeRefuse,
   ActionTypeAccept
};

@interface NoticeView : UIView
@property (nonatomic, copy) void(^actionBLock)(ActionType);
@end
