//
//  UnResolveViewController.h
//  DumplingProject
//
//  Created by 叶刚 on 16/3/25.
//  Copyright © 2016年 dumplingproject. All rights reserved.
//

#import "BaseViewController.h"

@interface UnResolveViewController : BaseViewController <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *answerTable;
@end
