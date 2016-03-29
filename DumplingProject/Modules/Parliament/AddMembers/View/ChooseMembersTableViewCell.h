//
//  ChooseMembersTableViewCell.h
//  DumplingProject
//
//  Created by 顾新生 on 16/3/29.
//  Copyright © 2016年 dumplingproject. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChooseMembersTableViewCell : UITableViewCell
@property(nonatomic,assign,getter=isChosen)BOOL chosen;
-(void)cellClick;
@end
