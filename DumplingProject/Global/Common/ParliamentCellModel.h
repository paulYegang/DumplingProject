//
//  ParliamentCellModel.h
//  DumplingProject
//
//  Created by 顾新生 on 16/3/25.
//  Copyright © 2016年 dumplingproject. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface ParliamentCellModel : JSONModel
@property(nonatomic,copy)NSString *iconURL;
@property(nonatomic,copy)NSString *badgeNum;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *lastMessage;
@property(nonatomic,copy)NSString *time;
@end
