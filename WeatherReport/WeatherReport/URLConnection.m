//
//  URLConnection.m
//  WeatherReport
//
//  Created by Praveen on 6/18/15.
//  Copyright (c) 2015 Praveen. All rights reserved.
//

#import "URLConnection.h"

@implementation URLConnection

-(void)loginServiceCall:(NSString *)latitude :(NSString *)longitude
{
    NSString * LoginURLString = [NSString stringWithFormat:@"https://api.forecast.io/forecast/6c0448d84fdd896495de72c55e226edb/%@,%@",latitude,longitude];
    [self aSynchronousCall:LoginURLString];
}



-(void)aSynchronousCall:(NSString *)URLString
{
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:URLString]];
    __block NSDictionary *newJSON;
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
                               if (data) {
                                   newJSON = [NSJSONSerialization JSONObjectWithData:data
                                                                             options:0
                                                                               error:nil];
                                   [_passJSONDelegate readJSON:newJSON];
                                   NSLog(@"Async JSON: %@", newJSON);
                               }
                               else
                               {
                                   [_passJSONDelegate readJSON:nil];
                               }
                               
                           }];

  
    
    
}


 


@end
