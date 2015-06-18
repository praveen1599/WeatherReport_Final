//
//  URLConnection.h
//  WeatherReport
//
//  Created by Praveen on 6/18/15.
//  Copyright (c) 2015 Praveen. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol passJson

-(void)readJSON:(NSDictionary*)dictJSON;
@end

#define LoginURL "https://assessment-bangalore.smartandgeek.com/login?"
#define NEWSURL "https://assessment-bangalore.smartandgeek.com/news?"
@interface URLConnection : NSObject
//-(void)loginServiceCall:(NSString *)userName :(NSString *)password;
-(void)loginServiceCall:(NSString *)latitude :(NSString *)longitude;
//-(void)loginServiceCall;
-(void)newsServiceCall:(NSString *)token;

@property (nonatomic, strong) id<passJson> passJSONDelegate;
@end
