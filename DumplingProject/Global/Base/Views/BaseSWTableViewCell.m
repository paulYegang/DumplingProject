//
//  BaseSWTableViewCell.m
//  RailPass
//
//  Created by will on 15-8-14.
//  Copyright (c) 2015年 jukui. All rights reserved.
//

#import "BaseSWTableViewCell.h"

@interface BaseSWTableViewCell ()<SWTableViewCellDelegate>

@property (nonatomic, strong) RACDelegateProxy * rac_delegateProxy;
@end

@implementation BaseSWTableViewCell

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initComponents];
        [self setupComponents];
        self.delegate = self;
        _rac_rightButtonTriggerSignal = [self rac_signalForSelector:@selector(swipeableTableViewCell:didTriggerRightUtilityButtonWithIndex:) fromProtocol:@protocol(SWTableViewCellDelegate)];
    }
    return self;
}

- (void)setCellModel:(id)cellModel
{
    _cellModel = cellModel;
    [self updateComponents];
}
#pragma mark custom
- (void)initComponents
{
    
}
- (void)setupComponents
{
    
}
- (void)updateComponents
{
    
}

#pragma mark SWTableViewCell delegate

- (void)swipeableTableViewCell:(SWTableViewCell *)cell didTriggerRightUtilityButtonWithIndex:(NSInteger)index
{
    
}

- (BOOL)swipeableTableViewCellShouldHideUtilityButtonsOnSwipe:(SWTableViewCell *)cell
{
    return true;
}
- (BOOL)swipeableTableViewCell:(SWTableViewCell *)cell canSwipeToState:(SWCellState)state
{
    return true;
}
@end
