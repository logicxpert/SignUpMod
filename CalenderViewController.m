//
//  CalenderViewController.m
//  TournamentApp
//
//  Created by Manoj Jonna on 11/12/14.
//  Copyright (c) 2014 Manoj Jonna. All rights reserved.
//

#import "CalenderViewController.h"
#import "AppDelegate.h"


@interface CalenderViewController ()<CKCalendarDelegate>
@property(nonatomic, weak) CKCalendarView *calendar;
@property(nonatomic, strong) UILabel *dateLabel;
@property(nonatomic, strong) NSDateFormatter *dateFormatter;
@property(nonatomic, strong) NSDate *minimumDate;
@property(nonatomic, strong) NSArray *disabledDates;

@end

@implementation CalenderViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        CKCalendarView *calendar = [[CKCalendarView alloc] initWithStartDay:startSunday];
        self.calendar = calendar;
        calendar.delegate = self;
        
        self.dateFormatter = [[NSDateFormatter alloc] init];
        [self.dateFormatter setDateFormat:@"dd/MM/yyyy"];
        self.minimumDate = [self.dateFormatter dateFromString:@"20/09/2012"];
        
        self.disabledDates = @[
                               [self.dateFormatter dateFromString:@"05/01/2013"],
                               [self.dateFormatter dateFromString:@"06/01/2013"],
                               [self.dateFormatter dateFromString:@"07/01/2013"]
                               ];
        
        
        calendar.onlyShowCurrentMonth = NO;
        calendar.adaptHeightToNumberOfWeeksInMonth = YES;
        
        calendar.frame = CGRectMake(10, 120, 300, 320);
        calendar.backgroundColor=[UIColor clearColor];
        
        [self.view addSubview:calendar];
        
     
        
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(localeDidChange) name:NSCurrentLocaleDidChangeNotification object:nil];    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

- (void)localeDidChange {
    [self.calendar setLocale:[NSLocale currentLocale]];
}

- (BOOL)dateIsDisabled:(NSDate *)date {
    for (NSDate *disabledDate in self.disabledDates) {
        if ([disabledDate isEqualToDate:date]) {
            return YES;
        }
    }
    return NO;
}

#pragma mark -
#pragma mark - CKCalendarDelegate

- (void)calendar:(CKCalendarView *)calendar configureDateItem:(CKDateItem *)dateItem forDate:(NSDate *)date {
    // TODO: play with the coloring if we want to...
    if ([self dateIsDisabled:date]) {
        dateItem.backgroundColor = [UIColor clearColor];
        dateItem.textColor = [UIColor whiteColor];
    }
}

- (BOOL)calendar:(CKCalendarView *)calendar willSelectDate:(NSDate *)date {
    return ![self dateIsDisabled:date];
}

- (void)calendar:(CKCalendarView *)calendar didSelectDate:(NSDate *)date {
    
    self.dateLabel.text = [self.dateFormatter stringFromDate:date];
    
    AppDelegate *app=(AppDelegate *)[UIApplication sharedApplication].delegate;
    
     if(app.isstart==YES)
     {app.isselected=@"start";
         [[NSUserDefaults standardUserDefaults]setObject:[self.dateFormatter stringFromDate:date] forKey:@"startdate"];
         
         NSTimeInterval startinterval  = [date timeIntervalSince1970] ;
         NSLog(@"interval=%f",startinterval) ;
         NSInteger time = round(startinterval);
         
         [[NSUserDefaults standardUserDefaults]setObject:[NSString  stringWithFormat:@"%d",time] forKey:@"StartTimeStamp"];
         

         
         
         
     }
     else{
         app.isselected=@"End";
         NSTimeInterval startinterval  = [date timeIntervalSince1970] ;
         NSLog(@"interval=%f",startinterval) ;
          NSInteger time = round(startinterval);
         [[NSUserDefaults standardUserDefaults]setObject:[NSString  stringWithFormat:@"%d",time] forKey:@"EndTimeStamp"];
         [[NSUserDefaults standardUserDefaults]setObject:[self.dateFormatter stringFromDate:date] forKey:@"enddate"];
         
     }
    
    
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)viewWillDisappear:(BOOL)animated
{
    AppDelegate *app=(AppDelegate *)[UIApplication sharedApplication].delegate;
    app.isstart=NO;

}


- (BOOL)calendar:(CKCalendarView *)calendar willChangeToMonth:(NSDate *)date {
    if ([date laterDate:self.minimumDate] == date) {
        //self.calendar.backgroundColor = [UIColor blueColor];
        return YES;
    } else {
        //self.calendar.backgroundColor = [UIColor redColor];
        return NO;
    }
}

- (void)calendar:(CKCalendarView *)calendar didLayoutInRect:(CGRect)frame {
    NSLog(@"calendar layout: %@", NSStringFromCGRect(frame));
}

@end
