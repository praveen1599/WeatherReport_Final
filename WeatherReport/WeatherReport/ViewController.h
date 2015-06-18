//
//  ViewController.h
//  WeatherReport
//
//  Created by Praveen on 6/18/15.
//  Copyright (c) 2015 Praveen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "URLConnection.h"
#import "WeatherModalClass.h"
#import "DetailedViewController.h"
#import <CoreLocation/CoreLocation.h>
@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,passJson,CLLocationManagerDelegate,UIAlertViewDelegate>

{
    CLLocationManager *locationManager;
    IBOutlet UITableView *tblWeatherForeCast;
    NSArray * weatherReportArray;
    NSDictionary * dictFinalReport;
    NSString *latitude;
    NSString *longitude;
    IBOutlet UILabel *lblLongitude;
    IBOutlet UILabel *lblLatitude;
    UIActivityIndicatorView *activityView;
}
@end

