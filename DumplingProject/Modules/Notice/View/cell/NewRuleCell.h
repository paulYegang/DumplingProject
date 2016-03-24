//
//  NewRuleCell.h
//  DumplingProject
//
//  Created by 叶刚 on 16/3/18.
//  Copyright © 2016年 dumplingproject. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RuleModel.h"

@interface NewRuleCell : UITableViewCell

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *nuberLabel;
@property (nonatomic, strong) UILabel *companyLabel;
@property (nonatomic, strong) UILabel *publishTimeLabel;
@property (nonatomic, strong) UILabel *effectiveTimeLabel;
@property (nonatomic, strong) RuleModel *rulemodel;
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
@end
