//
//  ViewController.m
//  WeatherReport
//
//  Created by Praveen on 6/18/15.
//  Copyright (c) 2015 Praveen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSString *selectedValue;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     [self ActivityIndicatorView];
    [activityView startAnimating];
    self.view.backgroundColor =[UIColor cyanColor];
    self.title = @"Home";
    locationManager = [[CLLocationManager alloc] init];
    
    [locationManager requestWhenInUseAuthorization];
    [locationManager requestAlwaysAuthorization];
    [self getCurrentLocation];
    weatherReportArray = [NSArray arrayWithObjects:@"currently",@"hourly",@"daily", nil];
    tblWeatherForeCast.hidden=YES;
    
   

    // Do any additional setup after loading the view, typically from a nib.
}

-(void)ActivityIndicatorView
{
    
    activityView = [[UIActivityIndicatorView alloc]
                                             initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    
    activityView.center=self.view.center;
    [self.view addSubview:activityView];

}

-(CLLocationCoordinate2D) getLocation{
    
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    locationManager.distanceFilter = kCLDistanceFilterNone;
    [locationManager startUpdatingLocation];
    CLLocation *location = [locationManager location];
    CLLocationCoordinate2D coordinate = [location coordinate];
    return coordinate;
}

- (void)getCurrentLocation{
    CLLocationCoordinate2D coordinate = [self getLocation];
    latitude = [NSString stringWithFormat:@"%f", coordinate.latitude];
    longitude = [NSString stringWithFormat:@"%f", coordinate.longitude];
    NSLog(@"Latitude  = %@", latitude);
    NSLog(@"Longitude = %@", longitude);
    if ([latitude floatValue]!=0.000000 && [longitude floatValue] != 0.000000) {
        URLConnection *  objURLConnecton = [[URLConnection alloc]init];
        objURLConnecton.passJSONDelegate = self;
        
        [ objURLConnecton loginServiceCall:latitude :longitude ];
        
        
        lblLatitude.text=latitude;
        lblLongitude.text=longitude;

    }
   
    
    
}
-(void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    
    if (status == kCLAuthorizationStatusDenied) {
        NSLog(@"Entered into location Function");
        // permission denied
    }
    else{
        
        [self performSelector:@selector(getCurrentLocation) withObject:self afterDelay:4.0 ];
        
    }
}



-(void)readJSON:(NSDictionary*)dictJSON
{

    if (dictJSON) {
        
        dictFinalReport = [NSDictionary dictionaryWithDictionary:dictJSON];
          tblWeatherForeCast.hidden=NO;
        [activityView stopAnimating];
        
    
}
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.0;
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    DetailedViewController  *objDetailview = (DetailedViewController*)segue.destinationViewController;
    objDetailview.dictCurrent = [dictFinalReport objectForKey:selectedValue];
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    selectedValue = [weatherReportArray objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"pushToDetailView" sender:self];
}




- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [weatherReportArray objectAtIndex:indexPath.row];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [weatherReportArray count];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
