//
//  ParliamentNewGroupCell.h
//  DumplingProject
//
//  Created by 顾新生 on 16/3/25.
//  Copyright © 2016年 dumplingproject. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ParliamentNewGroupCell;
@protocol ParliamentNewGroupCellDelegate <NSObject>

-(void)newGroupBtnDidClick:(ParliamentNewGroupCell *)cell;

@end
@interface ParliamentNewGroupCell : UITableViewCell
@property(nonatomic,weak)id<ParliamentNewGroupCellDelegate> delegate;
@end
