//
//  UIImage+Thumb.m
//  DumplingProject
//
//  Created by 顾新生 on 16/3/29.
//  Copyright © 2016年 dumplingproject. All rights reserved.
//

#import "UIImage+Thumb.h"

@implementation UIImage (Thumb)
+(UIImage *)createThumbFromImage:(UIImage *)largeImg size:(CGSize)size{
    UIGraphicsBeginImageContext(size);
    [largeImg drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *thumb=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return thumb;
}
@end
