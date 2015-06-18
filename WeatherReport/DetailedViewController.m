//
//  DetailedViewController.m
//  WeatherReport
//
//  Created by Praveen on 6/18/15.
//  Copyright (c) 2015 Praveen. All rights reserved.
//

#import "DetailedViewController.h"
#import "WeatherModalClass.h"

@interface DetailedViewController ()
{
    
}
@property (nonatomic, retain) NSMutableArray *modelArray;;
@end

@implementation DetailedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@",self.dictCurrent);
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    if ([_dictCurrent count] == 3) {
        
        for (NSDictionary *objDict  in [_dictCurrent objectForKey:@"data"]) {
            
            
            WeatherModalClass *objWeather = [[WeatherModalClass alloc] init];
            objWeather.time = [objDict objectForKey:@"time"];
            objWeather.summary = [objDict objectForKey:@"summary"];
            objWeather.icon = [objDict objectForKey:@"icon"];
            objWeather.temperature = [[objDict objectForKey:@"temperature"] floatValue];
            [self.modelArray addObject:objWeather];
            
        }
    }
    else
    {
        WeatherModalClass *objWeather = [[WeatherModalClass alloc] init];
        objWeather.time = [_dictCurrent objectForKey:@"time"];
        objWeather.summary = [_dictCurrent objectForKey:@"summary"];
        objWeather.icon = [_dictCurrent objectForKey:@"icon"];
        objWeather.temperature = [[_dictCurrent objectForKey:@"temperature"] floatValue];
        [self.modelArray addObject:objWeather];
        
    }
   
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 163;
}
-(NSMutableArray *)modelArray
{
    if (!_modelArray) {
        _modelArray = [[NSMutableArray alloc] init];
    }
    
    return _modelArray;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [self.modelArray count];
}
/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    

    return cell;
}
*/
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //    static NSString *CellIdentifier = @"Cell";
    //
    //    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    //    if (cell == nil) {
    //        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    //    }
    //
    // Configure the cell...
    
    static NSString *identifier=@"customcell";
    
    CustomTableViewCell *objCustomTableViewCell=(CustomTableViewCell *)[tableView dequeueReusableCellWithIdentifier:identifier];
    
    if(objCustomTableViewCell==nil){
        
        NSArray *nib=[[NSBundle mainBundle]loadNibNamed:@"customcell_empty" owner:self options:nil];
        objCustomTableViewCell=[nib objectAtIndex:0];
        
        for(id currentObject in nib){
            
            if([currentObject isKindOfClass:[CustomTableViewCell class]]){
                objCustomTableViewCell=(CustomTableViewCell *) currentObject;
                break;
                
            }
        }
        
    }
    WeatherModalClass *obj = (WeatherModalClass*)[self.modelArray objectAtIndex:indexPath.row];
    
    
    objCustomTableViewCell.lblSummary.text=obj.summary;
    objCustomTableViewCell.lblTemperature.text = [NSString stringWithFormat:@"%f",obj.temperature];
    
    if ([obj.icon isEqualToString:@"cloudy"]||[obj.icon isEqualToString:@"wind"]||[obj.icon isEqualToString:@"rain"]) {
        objCustomTableViewCell.imgViewWeather.image=[UIImage imageNamed:[NSString stringWithFormat:@"%@.png",obj.icon]];
    }
    else{
        objCustomTableViewCell.imgViewWeather.image=[UIImage imageNamed:[NSString stringWithFormat:@"other.png"]];
    }
   NSDate *date = [NSDate dateWithTimeIntervalSince1970:[obj.time doubleValue]];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
   [formatter setDateFormat: @"yyyy-MM-dd HH:mm"];
    
    //Optionally for time zone conversions
    [formatter setTimeZone:[NSTimeZone timeZoneWithName:@"..."]];
    
    NSString *stringFromDate = [formatter stringFromDate:date];

    objCustomTableViewCell.lblTime.text=stringFromDate;
        
    return objCustomTableViewCell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
