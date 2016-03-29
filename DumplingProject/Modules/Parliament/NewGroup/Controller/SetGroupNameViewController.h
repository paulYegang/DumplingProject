//
//  SetGroupNameViewController.h
//  DumplingProject
//
//  Created by 顾新生 on 16/3/29.
//  Copyright © 2016年 dumplingproject. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SetGroupNameViewController : BaseViewController
@property(nonatomic,strong)void(^completeBlock)(NSString *);
@property(nonatomic,copy)NSString *groupName;
@end
