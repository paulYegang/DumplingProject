//
//  ExperienceSearchViewController.h
//  DumplingProject
//
//  Created by 叶刚 on 16/3/24.
//  Copyright © 2016年 dumplingproject. All rights reserved.
//

#import "BaseViewController.h"

@interface ExperienceSearchViewController : UIViewController
@property (strong, nonatomic) UITableView *tableView;
// 搜索结果数据
@property (nonatomic, strong) NSMutableArray *resultsArray;
+(instancetype) shareInstanceType;
@end
