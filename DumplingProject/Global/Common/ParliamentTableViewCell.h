//
//  ParliamentTableViewCell.h
//  DumplingProject
//
//  Created by 顾新生 on 16/3/25.
//  Copyright © 2016年 dumplingproject. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ParliamentCellModel.h"

@interface ParliamentTableViewCell : UITableViewCell
@property(nonatomic,strong)ParliamentCellModel *model;
@property(nonatomic,assign)NSInteger badgeNum;

@end
