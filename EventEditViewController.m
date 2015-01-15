//
//  EventEditViewController.m
//  TournamentApp
//
//  Created by Manoj Jonna on 13/12/14.
//  Copyright (c) 2014 Manoj Jonna. All rights reserved.
//

#import "EventEditViewController.h"
#import "AddStaffViewController.h"
#import "CalenderViewController.h"
#import "AppDelegate.h"

@interface EventEditViewController ()

@end

@implementation EventEditViewController
@synthesize lblto,lblname,txtUrl;

- (void)viewDidLoad {
    [super viewDidLoad];
    currrentFrame =self.view.frame;
    
    lblto.textColor= [UIColor colorWithRed:124/255.0 green:198/255.0 blue:228/255.0 alpha:1];
    lblto.font=[UIFont fontWithName:@"Nunito-Regular" size:18.0];
    lblname.font=[UIFont fontWithName:@"Nunito-Regular" size:14.0];
    txtUrl.delegate=self;

    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    AppDelegate *app=(AppDelegate *)[UIApplication sharedApplication].delegate;
    
    if([app.isselected isEqualToString:@"start"])
    {
        
        [btnstart setTitle:[[NSUserDefaults standardUserDefaults]valueForKey:@"startdate"] forState:UIControlStateNormal];
        //  btnstart se [[NSUserDefaults standardUserDefaults]valueForKey:@"startdate"];
    }
    else  if([app.isselected isEqualToString:@"End"])
    {
        [btnEnd setTitle:[[NSUserDefaults standardUserDefaults]valueForKey:@"enddate"] forState:UIControlStateNormal];
        // [[NSUserDefaults standardUserDefaults] valueForKey:@"enddate"];
        
    }
}

-(IBAction)actionAddstaff:(id)sender
{
    AddStaffViewController *objAddstaff=[[AddStaffViewController alloc]init];
    [self.navigationController pushViewController:objAddstaff animated:YES];;
    
    
}
-(IBAction)actiononBack:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    [UIView animateWithDuration:0.3 animations:^{
        [self.view setFrame:CGRectMake(currrentFrame.origin.x, currrentFrame.origin.y, currrentFrame.size.width, currrentFrame.size.height)];
        //txtForEmail.frame=CGRectMake(76, 307, 171, 30);
    }];

    
    return YES;
    
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [UIView animateWithDuration:0.3 animations:^{
        [self.view setFrame:CGRectMake(currrentFrame.origin.x, currrentFrame.origin.y, currrentFrame.size.width, currrentFrame.size.height)];
        //txtForEmail.frame=CGRectMake(76, 307, 171, 30);
    }];
    [self.view endEditing:YES];
    
}
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    if(textField==txtUrl)
    {
        
        [UIView animateWithDuration:0.3 animations:^{
            [self.view setFrame:CGRectMake(currrentFrame.origin.x, currrentFrame.origin.y-50, currrentFrame.size.width, currrentFrame.size.height)];
            //txtForEmail.frame=CGRectMake(76, 307, 171, 30);
        }];
    }
}

-(IBAction)actiononStartEvent:(id)sender
{

    CalenderViewController *objcal=[[CalenderViewController alloc]init];

    AppDelegate *app=(AppDelegate *)[UIApplication sharedApplication].delegate;
 
    app.isstart=YES;
    

    [self presentViewController:objcal animated:YES completion:nil];
    
}

-(IBAction)actiononEnddate:(id)sender
{
  CalenderViewController *objcal=[[CalenderViewController alloc]init];
   AppDelegate *app=(AppDelegate *)[UIApplication sharedApplication].delegate;
  app.isEnd=YES;
  [self presentViewController:objcal animated:YES completion:nil];
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
