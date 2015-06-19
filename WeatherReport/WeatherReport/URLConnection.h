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

@interface URLConnection : NSObject
//-(void)loginServiceCall:(NSString *)userName :(NSString *)password;
-(void)loginServiceCall:(NSString *)latitude :(NSString *)longitude;


@property (nonatomic, strong) id<passJson> passJSONDelegate;
@end
