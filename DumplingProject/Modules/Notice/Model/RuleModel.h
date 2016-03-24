//
//  RuleModel.h
//  DumplingProject
//
//  Created by 叶刚 on 16/3/18.
//  Copyright © 2016年 dumplingproject. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface RuleModel : JSONModel

@property (nonatomic, copy) NSString *titleString;
@property (nonatomic, copy) NSString *nuberString;
@property (nonatomic, copy) NSString *companyName;
@property (nonatomic, copy) NSString *publishTime;
@property (nonatomic, copy) NSString *effectiveTime;

@end
