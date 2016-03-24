//
//  BaseView.h
//  RailPass
//
//  Created by will on 15-8-9.
//  Copyright (c) 2015年 jukui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseView : UIView
+ (instancetype)createInstance;
- (void)initComponents;
- (void)setupComponents;
- (void)updateComponents;
@end
