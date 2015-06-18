//
//  CustomTableViewCell.h
//  WeatherReport
//
//  Created by Praveen on 6/18/15.
//  Copyright (c) 2015 Praveen. All rights reserved.


#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *imgViewWeather;

@property (strong, nonatomic) IBOutlet UILabel *lblTime;
@property (strong, nonatomic) IBOutlet UILabel *lblTemperature;
@property (strong, nonatomic) IBOutlet UILabel *lblSummary;

@end
