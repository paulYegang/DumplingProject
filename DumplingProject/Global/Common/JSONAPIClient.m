//
//  JSONAPIClient.m
//  KaKaWork
//
//  配置读取服务端JSON格式数据网址
//  如果需要更改，请更改常量APIBaseURLString
//
//  Created by Cloudin's Adin on 15/1/24.
//  Copyright (c) 2015年 Shanghai Cloudin Network Technology Co.,Ltd. All rights reserved.
//


/* 接口调用 直接 参照此例
NSDictionary *parm = [NSDictionary dictionaryWithObjectsAndKeys:
                      [AppManager sharedManager].currentUser.telPhone, @"telPhone",
                      [AppManager sharedManager].currentUser.token,@"token",
                      _companyid.text,@"partnerId",
                      _textField.text,@"userAccount",nil];
[[JSONAPIClient sharedClient] POST:[NSString stringWithFormat:@"%@rpUserPartner/addUserPartner.do",RequestForSeverUrlString]
                        parameters:parm
                           success:^(NSURLSessionDataTask * __unused task, id JSON) {
                               if (!(JSON && [JSON isKindOfClass:[NSDictionary class]])) {
                                   return ;
                               }
                               
                               [self showToast:[JSON objectForKey:@"rtMessage"]];
                           } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
                               
                           }];
*/


#import "JSONAPIClient.h"
static NSString * RailPassBaseURLString = RequestForSeverUrlString;
@implementation JSONAPIClient

+ (instancetype)sharedClient {
    static JSONAPIClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[JSONAPIClient alloc] initWithBaseURL:[NSURL URLWithString:RailPassBaseURLString]];
        _sharedClient.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
        [_sharedClient.securityPolicy setAllowInvalidCertificates:YES];
//        _sharedClient.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json",
//                                                                   @"text/javascript",@"text/html",@"application/javascript",@"text/plain", @"application/xhtml+xml",@"application/xml",nil];
//        _sharedClient.responseSerializer.stringEncoding = NSUTF8StringEncoding;
    });
    return _sharedClient;
}
- (RACSignal *)rac_requestWithURL:(NSString *)url parameters:(NSDictionary *)parameters
{
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [self POST:url
        parameters:parameters
           success:^(NSURLSessionDataTask *task, id responseObject) {
               NSInteger responseCode = [[responseObject objectForKey:@"rtCode"] integerValue];
               if (responseCode==111111) {
                   [subscriber sendNext:responseObject];
                   [subscriber sendCompleted];
               }else{
                   [subscriber sendError:[NSError
                                          errorWithDomain:@"RailPassAPI"
                                          code:401
                                          userInfo:@{
                                                     @"messge":
                                                         [responseObject objectForKey:@"rtMessage"]
                                                     }]];
               }

        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            [subscriber sendError:error];
        }];
        return nil;
    }];
}
@end
