//
//  TransitionDelegate.h
//  DumplingProject
//
//  Created by 叶刚 on 16/3/28.
//  Copyright © 2016年 dumplingproject. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TransitionDelegate : NSObject  <UIViewControllerTransitioningDelegate,UIViewControllerAnimatedTransitioning>
@property (nonatomic, assign) BOOL isPresent;
@end
