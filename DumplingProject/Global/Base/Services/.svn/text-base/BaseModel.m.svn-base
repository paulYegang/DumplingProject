//
//  BaseModel.m
//  
//
//  Created by liujukui on 15/6/8.
//  Copyright (c) 2015年 jukui. All rights reserved.
//

#import "BaseModel.h"
#import "AppManager.h"

@implementation BaseModel

#pragma mark - NSCoding

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if(self)
    {
        
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    return;
}

+(BOOL)propertyIsOptional:(NSString*)propertyName
{
    return YES;
}

-(instancetype)init{
    if (self=[super init]) {
        self.deviceType=kDeviceType;
        self.deviceToken=[[AppManager sharedManager]getDeviceToken];
    }
    return self;
}


@end
