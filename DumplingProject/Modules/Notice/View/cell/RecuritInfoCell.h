//
//  RecuritInfoCell.h
//  DumplingProject
//
//  Created by 叶刚 on 16/3/22.
//  Copyright © 2016年 dumplingproject. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RecuritModel.h"

@interface RecuritInfoCell : UITableViewCell

@property (nonatomic, strong) UILabel *positionLable;
@property (nonatomic, strong) UILabel *publishManLable;
@property (nonatomic, strong) UILabel *dateLabel;
@property (nonatomic, strong) RecuritModel *models;

@end
