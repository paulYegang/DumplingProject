//
//  GroupMembersCollectionCell.h
//  DumplingProject
//
//  Created by 顾新生 on 16/3/29.
//  Copyright © 2016年 dumplingproject. All rights reserved.
//
typedef NS_ENUM(NSInteger,CollectionCellType) {
    CollectionCellTypeMember,
    CollectionCellTypeActionAdd,
    CollectionCellTypeActionDel
};

#import <UIKit/UIKit.h>

@interface GroupMembersCollectionCell : UICollectionViewCell
@property(nonatomic,assign)CollectionCellType cellType;
@property(nonatomic,strong)UIImage *iconImage;

@end
