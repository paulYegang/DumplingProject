//
//  JSONAPIClient.h
//  KaKaWork
//
//  Created by Cloudin's Adin on 15/1/24.
//  Copyright (c) 2015年 Shanghai Cloudin Network Technology Co.,Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPSessionManager.h"

@interface JSONAPIClient : AFHTTPSessionManager

+ (instancetype)sharedClient;
- (RACSignal *)rac_requestWithURL:(NSString *)url parameters:(NSDictionary *)parameters;
@end
