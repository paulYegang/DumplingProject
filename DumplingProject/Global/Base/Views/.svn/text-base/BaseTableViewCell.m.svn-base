//
//  BaseTableViewCell.m
//  RailPass
//
//  Created by liujukui on 15/6/13.
//  Copyright (c) 2015年 jukui. All rights reserved.
//

#import "BaseTableViewCell.h"

@implementation BaseTableViewCell

+ (instancetype)createInstance
{
    return [[self alloc] init];
}

+ (CGFloat)heightForCell
{
    return 44.0;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
//        [self initComponents];
//        [self setupComponents];
    }
    return self;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initComponents];
        [self setupComponents];
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
    [super awakeFromNib];
    [self initComponents];
    [self setupComponents];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (UITableView *)parentTableView
{
    UIView * superView = self.superview;
    UITableView * parentView = nil;
    while (superView) {
        if ([superView isKindOfClass:[UITableView class]]) {
            parentView = (UITableView *)superView;
            break;
        }
        superView = superView.superview;
    }
    return parentView;
}
#pragma mark setter/getter
- (void)setCellModel:(id)cellModel
{
    _cellModel = cellModel;
    [self updateComponents];
}
#pragma mark custom view
- (void)initComponents
{
    
}

- (void)setupComponents
{
    self.backgroundColor = [UIColor clearColor];
}
- (void)updateComponents
{
    
}
@end
