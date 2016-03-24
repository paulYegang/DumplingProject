//
//  AppManager.m
//  RailPass
//
//  Created by will on 15-8-8.
//  Copyright (c) 2015年 jukui. All rights reserved.
//

#import "AppManager.h"
#import "XINGZHENGQUModel.h"
#import "City.h"
#import "District.h"
#include <ifaddrs.h>
#include <arpa/inet.h>
#include <net/if.h>

#define IOS_CELLULAR    @"pdp_ip0"
#define IOS_WIFI        @"en0"
#define IOS_VPN         @"utun0"
#define IP_ADDR_IPv4    @"ipv4"
#define IP_ADDR_IPv6    @"ipv6"

@interface AppManager ()

- (void)loadLastUser;
@end

@implementation AppManager
+ (instancetype)sharedManager
{
    static AppManager * appManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        appManager = [[self alloc] init];
    });
    return appManager;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self loadLastUser];
    }
    return self;
}

-(void)setLocationCityStr:(NSString *)LocationCityStr
{
    _LocationCityStr=LocationCityStr;
}

-(void)setLocationStr:(NSString *)LocationStr
{
    _LocationStr=LocationStr;
}

- (void)loadLastUser
{
    NSData * lastUserData = [[NSUserDefaults standardUserDefaults] objectForKey:@"LastUser"];
    if (lastUserData) {
        _currentUser = [NSKeyedUnarchiver unarchiveObjectWithData:lastUserData];
    }
}

- (void)setCurrentUser:(UserModel *)currentUser
{
    _currentUser = currentUser;
    if (currentUser) {
        NSData * loginedUserData = [NSKeyedArchiver archivedDataWithRootObject:currentUser];
        [[NSUserDefaults standardUserDefaults] setValue:loginedUserData forKey:@"LastUser"];
    }else{
        [[NSUserDefaults standardUserDefaults] setValue:nil forKey:@"LastUser"];
    }
    [[NSUserDefaults standardUserDefaults]synchronize];

}

- (BOOL)isLogined
{
    if (self.currentUser.userToken&&self.currentUser) {
        return true;
    }
    return false;
}

- (void)logout
{
    _currentUser=nil;
    [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"LastUser"];
    [[NSUserDefaults standardUserDefaults]synchronize];
}

- (BOOL)checkIsEmpty:(NSString *)str
{
    if (str == nil || [str isEqualToString:@""] || [str isEqualToString:@"(null)"]||[str isEqualToString:@"null"]) {
        return YES;
    }
    return NO;
}


- (BOOL)isMobileNumber:(NSString *)mobileNum
{
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,189
     */
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    /**
     10         * 中国移动：China Mobile
     11         * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     12         */
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    /**
     15         * 中国联通：China Unicom
     16         * 130,131,132,152,155,156,185,186
     17         */
    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    /**
     20         * 中国电信：China Telecom
     21         * 133,1349,153,180,189
     22         */
    NSString * CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    /**
     25         * 大陆地区固话及小灵通
     26         * 区号：010,020,021,022,023,024,025,027,028,029
     27         * 号码：七位或八位
     28         */
    // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    if (([regextestmobile evaluateWithObject:mobileNum] == YES)
        || ([regextestcm evaluateWithObject:mobileNum] == YES)
        || ([regextestct evaluateWithObject:mobileNum] == YES)
        || ([regextestcu evaluateWithObject:mobileNum] == YES))
    {
        return YES;
    }
    else
    {
        return NO;
    }
}
-(BOOL)isEmailAddress:(NSString *)email{
//    NSString *emailRegex=@"/^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\\.[a-zA-Z0-9_-]+)+$/";
//    NSPredicate *regextestemail=[NSPredicate predicateWithFormat:@"SELF MATCHES %@",emailRegex];
//    if ([regextestemail evaluateWithObject:email]) {
//        return YES;
//    }else{
//        return NO;
//    }
    NSRange range=[email rangeOfString:@"@"];
    if (range.location!=NSNotFound) {
        return YES;
    }
    return NO;
}
-(BOOL)validateEmail:(NSString*)email
{
    if((0 != [email rangeOfString:@"@"].length) &&
       (0 != [email rangeOfString:@"."].length))
    {
        NSCharacterSet* tmpInvalidCharSet = [[NSCharacterSet alphanumericCharacterSet] invertedSet];
        NSMutableCharacterSet* tmpInvalidMutableCharSet = [tmpInvalidCharSet mutableCopy];
        [tmpInvalidMutableCharSet removeCharactersInString:@"_-"];
        
        /*
         *使用compare option 来设定比较规则，如
         *NSCaseInsensitiveSearch是不区分大小写
         *NSLiteralSearch 进行完全比较,区分大小写
         *NSNumericSearch 只比较定符串的个数，而不比较字符串的字面值
         */
        NSRange range1 = [email rangeOfString:@"@"
                                      options:NSCaseInsensitiveSearch];
        
        //取得用户名部分
        NSString* userNameString = [email substringToIndex:range1.location];
        NSArray* userNameArray   = [userNameString componentsSeparatedByString:@"."];
        
        for(NSString* string in userNameArray)
        {
            NSRange rangeOfInavlidChars = [string rangeOfCharacterFromSet: tmpInvalidMutableCharSet];
            if(rangeOfInavlidChars.length != 0 || [string isEqualToString:@""])
                return NO;
        }
        
        //取得域名部分
        NSString *domainString = [email substringFromIndex:range1.location+1];
        NSArray *domainArray   = [domainString componentsSeparatedByString:@"."];
        
        for(NSString *string in domainArray)
        {
            NSRange rangeOfInavlidChars=[string rangeOfCharacterFromSet:tmpInvalidMutableCharSet];
            if(rangeOfInavlidChars.length !=0 || [string isEqualToString:@""])
                return NO;
        }
        
        return YES;
    }
    else {
        return NO;
    }
}

-(NSString *)getDeviceToken{
    return [[[UIDevice currentDevice] identifierForVendor] UUIDString];
}

-(NSString *)deviceIPAdress {
    NSString *address = @"an error occurred when obtaining ip address";
    struct ifaddrs *interfaces = NULL;
    struct ifaddrs *temp_addr = NULL;
    int success = 0;
    
    success = getifaddrs(&interfaces);
    
    if (success == 0) { // 0 表示获取成功
        
        temp_addr = interfaces;
        while (temp_addr != NULL) {
            if( temp_addr->ifa_addr->sa_family == AF_INET) {
                // Check if interface is en0 which is the wifi connection on the iPhone
                if ([[NSString stringWithUTF8String:temp_addr->ifa_name] isEqualToString:@"en0"]) {
                    // Get NSString from C String
                    address = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr)];
                }
            }
            
            temp_addr = temp_addr->ifa_next;
        }
    }
    
    freeifaddrs(interfaces);
    
    //    DDLogVerbose(@"手机的IP是：%@", address);
    return address;
}


-(NSString *)searchDictName:(NSString *)districtId
{
    NSString * Districtname;
    FMDatabase *db=[AppDelegate appDelegate].db;
    if ([db open]) {
        FMResultSet *result=[db executeQuery:[NSString stringWithFormat:@"select * from st_district t where t.districtId = %@",districtId]];
        while (result.next) {
            NSMutableDictionary *dict=[NSMutableDictionary dictionary];
            for (int i=0; i<result.columnCount; i++) {
                dict[[result columnNameForIndex:i]]=[result stringForColumnIndex:i];
            }
            XINGZHENGQUModel *dis=[[XINGZHENGQUModel alloc]initWithDictionary:dict error:nil];
            Districtname=dis.XINGZHENGQUdistrictName;
            
        }
    }
    return Districtname;
}


-(NSString *)searchAreaName:(NSString *)AreaId
{
    NSString * areaName;
    FMDatabase *db=[AppDelegate appDelegate].db;
    if ([db open]) {
        FMResultSet *result=[db executeQuery:[NSString stringWithFormat:@"select * from st_area t where areaId = %@",AreaId]];
        while (result.next) {
            NSMutableDictionary *dict=[NSMutableDictionary dictionary];
            for (int i=0; i<result.columnCount; i++) {
                dict[[result columnNameForIndex:i]]=[result stringForColumnIndex:i];
            }
            District *dis=[[District alloc]initWithDictionary:dict error:nil];
            areaName=dis.districtName;
            
        }
    }
    return areaName;
}

-(NSString *)searchCityName:(NSString *)CiytId
{
    NSString * CityName;
    FMDatabase *db=[AppDelegate appDelegate].db;
    if ([db open]) {
        FMResultSet *result=[db executeQuery:[NSString stringWithFormat:@"select * from st_city t where t.cityid = %@",CiytId]];
        while (result.next) {
            NSMutableDictionary *dict=[NSMutableDictionary dictionary];
            for (int i=0; i<result.columnCount; i++) {
                dict[[result columnNameForIndex:i]]=[result stringForColumnIndex:i];
            }
            City *dis=[[City alloc]initWithDictionary:dict error:nil];
            CityName=dis.cityName;
        }
    }
    return CityName;
}


#pragma mark -- 提示框
-(void) alertTitle:(NSString *) messages{

     [RKDropdownAlert title:@"提示" message:messages backgroundColor:[UIColor colorWithWhite:1.0 alpha:0.9] textColor:[UIColor blackColor]];
}



- (NSString *)getIPAddress:(BOOL)preferIPv4
{
    NSArray *searchArray = preferIPv4 ?
    @[ IOS_VPN @"/" IP_ADDR_IPv4, IOS_VPN @"/" IP_ADDR_IPv6, IOS_WIFI @"/" IP_ADDR_IPv4, IOS_WIFI @"/" IP_ADDR_IPv6, IOS_CELLULAR @"/" IP_ADDR_IPv4, IOS_CELLULAR @"/" IP_ADDR_IPv6 ] :
    @[ IOS_VPN @"/" IP_ADDR_IPv6, IOS_VPN @"/" IP_ADDR_IPv4, IOS_WIFI @"/" IP_ADDR_IPv6, IOS_WIFI @"/" IP_ADDR_IPv4, IOS_CELLULAR @"/" IP_ADDR_IPv6, IOS_CELLULAR @"/" IP_ADDR_IPv4 ] ;
    
    NSDictionary *addresses = [self getIPAddresses];
    NSLog(@"addresses: %@", addresses);
    
    __block NSString *address;
    [searchArray enumerateObjectsUsingBlock:^(NSString *key, NSUInteger idx, BOOL *stop)
     {
         address = addresses[key];
         if(address) *stop = YES;
     } ];
    return address ? address : @"0.0.0.0";
}

- (NSDictionary *)getIPAddresses
{
    NSMutableDictionary *addresses = [NSMutableDictionary dictionaryWithCapacity:8];
    
    // retrieve the current interfaces - returns 0 on success
    struct ifaddrs *interfaces;
    if(!getifaddrs(&interfaces)) {
        // Loop through linked list of interfaces
        struct ifaddrs *interface;
        for(interface=interfaces; interface; interface=interface->ifa_next) {
            if(!(interface->ifa_flags & IFF_UP) /* || (interface->ifa_flags & IFF_LOOPBACK) */ ) {
                continue; // deeply nested code harder to read
            }
            const struct sockaddr_in *addr = (const struct sockaddr_in*)interface->ifa_addr;
            char addrBuf[ MAX(INET_ADDRSTRLEN, INET6_ADDRSTRLEN) ];
            if(addr && (addr->sin_family==AF_INET || addr->sin_family==AF_INET6)) {
                NSString *name = [NSString stringWithUTF8String:interface->ifa_name];
                NSString *type;
                if(addr->sin_family == AF_INET) {
                    if(inet_ntop(AF_INET, &addr->sin_addr, addrBuf, INET_ADDRSTRLEN)) {
                        type = IP_ADDR_IPv4;
                    }
                } else {
                    const struct sockaddr_in6 *addr6 = (const struct sockaddr_in6*)interface->ifa_addr;
                    if(inet_ntop(AF_INET6, &addr6->sin6_addr, addrBuf, INET6_ADDRSTRLEN)) {
                        type = IP_ADDR_IPv6;
                    }
                }
                if(type) {
                    NSString *key = [NSString stringWithFormat:@"%@/%@", name, type];
                    addresses[key] = [NSString stringWithUTF8String:addrBuf];
                }
            }
        }
        // Free memory
        freeifaddrs(interfaces);
    }
    return [addresses count] ? addresses : nil;
}
@end
