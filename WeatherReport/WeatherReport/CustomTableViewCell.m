//
//  CustomTableViewCell.m
//  WeatherReport
//
//  Created by Praveen on 6/18/15.
//  Copyright (c) 2015 Praveen. All rights reserved.

#import "CustomTableViewCell.h"

@implementation CustomTableViewCell


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


@end
