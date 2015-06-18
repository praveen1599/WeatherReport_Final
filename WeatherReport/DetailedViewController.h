//
//  DetailedViewController.h
//  WeatherReport
//
//  Created by Praveen on 6/18/15.
//  Copyright (c) 2015 Praveen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomTableViewCell.h"
@interface DetailedViewController : UITableViewController{
    
}
@property(nonatomic,retain) NSDictionary * dictCurrent;
@property(nonatomic,retain) NSDictionary * dictHourly;
@end
