//
//  UILabel+TextAlign.m
//  MMTravel
//
//  Created by 顾新生 on 15/11/21.
//  Copyright © 2015年 super. All rights reserved.
//

#import "UILabel+TextAlign.h"

@implementation UILabel (TextAlign)
- (void) textLeftTopAlign{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    
    NSDictionary *attributes = @{
                                 NSFontAttributeName:[UIFont systemFontOfSize:13],
                                 NSParagraphStyleAttributeName:paragraphStyle.copy
                                 };
    
    CGSize labelSize = [self.text boundingRectWithSize:CGSizeMake(kScreenWidth-20, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
    
    CGRect dateFrame =CGRectMake(2, 140, CGRectGetWidth(self.frame)-5, labelSize.height);
    self.frame = dateFrame;
}
@end
