//
//  WeatherModalClass.h
//  WeatherReport
//
//  Created by Praveen on 6/18/15.
//  Copyright (c) 2015 Praveen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeatherModalClass : NSObject
{
    
}
@property(nonatomic,retain)NSString * time;
@property(nonatomic,retain)NSString * summary;
@property(nonatomic,retain)NSString * icon;
@property(nonatomic,assign)float temperature;
@property(nonatomic,retain)NSString * windSpeed;

@end
