//
//  TimeTableViewController.m
//  SignUpMod
//
//  Created by Admin on 19/01/15.
//  Copyright (c) 2015 Manoj Jonna. All rights reserved.
//

#import "TimeTableViewController.h"

@interface TimeTableViewController ()

@end

@implementation TimeTableViewController

@synthesize pickerView;
@synthesize hoursArray;
@synthesize minsArray;
@synthesize secsArray;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    //initialize arrays
    hoursArray = [[NSMutableArray alloc] init];
    minsArray = [[NSMutableArray alloc] init];
    secsArray = [[NSMutableArray alloc] init];
    NSString *strVal = [[NSString alloc] init];
    
    for(int i=0; i<61; i++)
    {
        strVal = [NSString stringWithFormat:@"%d", i];
        
        //NSLog(@"strVal: %@", strVal);
        
        //Create array with 0-12 hours
        if (i < 13)
        {
            [hoursArray addObject:strVal];
        }
        
        //create arrays with 0-60 secs/mins
        [minsArray addObject:strVal];
        [secsArray addObject:strVal];
    }
    
    
    NSLog(@"[hoursArray count]: %lu", (unsigned long)[hoursArray count]);
    NSLog(@"[minsArray count]: %lu", (unsigned long)[minsArray count]);
    NSLog(@"[secsArray count]: %lu", (unsigned long)[secsArray count]);
    
}


//Method to define how many columns/dials to show
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 3;
}


// Method to define the numberOfRows in a component using the array.
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent :(NSInteger)component
{
    if (component==0)
    {
        return [hoursArray count];
    }
    else if (component==1)
    {
        return [minsArray count];
    }
    else
    {
        return [secsArray count];
    }
    
}


// Method to show the title of row for a component.
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    
    switch (component)
    {
        case 0:
            return [hoursArray objectAtIndex:row];
            break;
        case 1:
            return [minsArray objectAtIndex:row];
            break;
        case 2:
            return [secsArray objectAtIndex:row];
            break;
    }
    return nil;
}


-(IBAction)calculateTimeFromPicker
{
    
    NSString *hoursStr = [NSString stringWithFormat:@"%@",[hoursArray objectAtIndex:[pickerView selectedRowInComponent:0]]];
    
    NSString *minsStr = [NSString stringWithFormat:@"%@",[minsArray objectAtIndex:[pickerView selectedRowInComponent:1]]];
    
    NSString *secsStr = [NSString stringWithFormat:@"%@",[secsArray objectAtIndex:[pickerView selectedRowInComponent:2]]];
    
    int hoursInt = [hoursStr intValue];
    int minsInt = [minsStr intValue];
    int secsInt = [secsStr intValue];
    
    
    interval = secsInt + (minsInt*60) + (hoursInt*3600);
    
    NSLog(@"hours: %d ... mins: %d .... sec: %d .... interval: %f", hoursInt, minsInt, secsInt, interval);
    
    NSString *totalTimeStr = [NSString stringWithFormat:@"%f",interval];
    
}

@end
