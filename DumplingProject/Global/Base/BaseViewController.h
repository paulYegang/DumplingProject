//
//  BaseViewController.h
//  DumplingProject
//
//  Created by 叶刚 on 16/3/16.
//  Copyright © 2016年 dumplingproject. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController
+(instancetype)shareInstanceType;
@property (nonatomic, strong)  UIImageView *iconImage;

-(void)addSeperator:(UITableViewCell *)cell;
@end
