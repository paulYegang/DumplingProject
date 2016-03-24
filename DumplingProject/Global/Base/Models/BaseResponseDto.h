//
//  BaseResponseDto.h
//  MMTravel
//
//  Created by 顾新生 on 15/11/13.
//  Copyright © 2015年 super. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface BaseResponseDto : JSONModel
@property(nonatomic,copy)NSString *rtCode;
@property(nonatomic,copy)NSString *rtMessage;
@end
