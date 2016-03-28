//
//  MessageCell.h
//  DumplingProject
//
//  Created by 顾新生 on 16/3/28.
//  Copyright © 2016年 dumplingproject. All rights reserved.
//

/**
 *  defined buttons in cell should show or hide
 */
typedef NS_ENUM(NSInteger,MessageCellType) {
    MessageCellTypeButtonHide,//button hide
    MessageCellTypeButtonShow //button show
};
#import <UIKit/UIKit.h>

@class MessageCell;
@protocol MessageCellDelegate <NSObject>
/**
 *  cell中按钮点击事件
 *
 *  @param flag YES:同意 NO:拒绝
 */
-(void)cellBtnDidClick:(BOOL)flag;

@end

@interface MessageCell : UITableViewCell

@property(nonatomic,assign)MessageCellType cellType;
@property(nonatomic,weak)id<MessageCellDelegate> delegate;

@end
