//
//  UserModel.m
//  MMTravel
//
//  Created by 顾新生 on 15/11/5.
//  Copyright © 2015年 super. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel


+(JSONKeyMapper *)keyMapper{
    return [[JSONKeyMapper alloc]initWithDictionary:@{
                                                     @"id":@"userId",
                                                     @"userName":@"userName"
                                                     }];
}


-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.userId forKey:@"userId"];
    [aCoder encodeObject:self.username forKey:@"username"];
    [aCoder encodeObject:self.password forKey:@"password"];
    [aCoder encodeObject:self.email forKey:@"email"];
    [aCoder encodeObject:self.lastLoginTime forKey:@"lastLoginTime"];
    [aCoder encodeObject:self.cellphone forKey:@"cellphone"];
    [aCoder encodeObject:self.deviceType forKey:@"deviceType"];
    [aCoder encodeObject:self.deviceToken forKey:@"deviceToken"];
    [aCoder encodeObject:self.alias forKey:@"alias"];
    [aCoder encodeObject:self.userToken forKey:@"userToken"];
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self=[super initWithCoder:aDecoder]) {
        self.userId=[aDecoder decodeObjectForKey:@"userId"];
        self.username=[aDecoder decodeObjectForKey:@"username"];
        self.password=[aDecoder decodeObjectForKey:@"password"];
        self.email=[aDecoder decodeObjectForKey:@"email"];
        self.lastLoginTime=[aDecoder decodeObjectForKey:@"lastLoginTime"];
        self.cellphone=[aDecoder decodeObjectForKey:@"cellphone"];
        self.deviceToken=[aDecoder decodeObjectForKey:@"deviceToken"];
        self.deviceType=[aDecoder decodeObjectForKey:@"deviceType"];
        self.userToken=[aDecoder decodeObjectForKey:@"userToken"];
        self.alias=[aDecoder decodeObjectForKey:@"alias"];
    }
    return self;
}
@end

