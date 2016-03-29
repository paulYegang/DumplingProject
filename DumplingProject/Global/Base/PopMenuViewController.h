//
//  PopMenuViewController.h
//  DumplingProject
//
//  Created by 叶刚 on 16/3/28.
//  Copyright © 2016年 dumplingproject. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PopMenuViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tablview;
@property (nonatomic, copy) void(^indexpath) (NSInteger);
@property (nonatomic, strong) NSArray *titleArr;
@property (nonatomic, strong) NSArray *imageArr;
@end
