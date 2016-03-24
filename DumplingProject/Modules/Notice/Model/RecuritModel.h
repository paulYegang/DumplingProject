//
//  RecuritModel.h
//  DumplingProject
//
//  Created by 叶刚 on 16/3/22.
//  Copyright © 2016年 dumplingproject. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface RecuritModel : JSONModel

@property (nonatomic, copy) NSString *positionString;
@property (nonatomic, copy) NSString *publishManString;
@property (nonatomic, copy) NSString *publishDateString;

@end
