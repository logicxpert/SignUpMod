//
//  TimeTableViewController.h
//  SignUpMod
//
//  Created by Admin on 19/01/15.
//  Copyright (c) 2015 Manoj Jonna. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimeTableViewController : UITableViewController
{
    IBOutlet UIPickerView *pickerView;
    NSMutableArray *hoursArray;
    NSMutableArray *minsArray;
    NSMutableArray *secsArray;
    
    NSTimeInterval interval;

}
@property(strong, nonatomic) UIPickerView *pickerView;
@property(strong, nonatomic) NSMutableArray *hoursArray;
@property(strong, nonatomic) NSMutableArray *minsArray;
@property(strong, nonatomic) NSMutableArray *secsArray;
@end
