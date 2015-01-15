//
//  EditseasonViewController.m
//  SignUpMod
//
//  Created by Admin on 11/01/15.
//  Copyright (c) 2015 Manoj Jonna. All rights reserved.
//

#import "EditseasonViewController.h"
#import "AppDelegate.h"
#import "CalenderViewController.h"

@interface EditseasonViewController ()

@end

@implementation EditseasonViewController
@synthesize lblname,lblto,txtUrl,lbltitle;

- (void)viewDidLoad {
    [super viewDidLoad];
    currrentFrame =self.view.frame;
    
    lblto.textColor= [UIColor colorWithRed:124/255.0 green:198/255.0 blue:228/255.0 alpha:1];
    lblto.font=[UIFont fontWithName:@"Nunito-Regular" size:18.0];
    lblname.font=[UIFont fontWithName:@"Nunito-Regular" size:16.0];
    lbltitle.font=
    [UIFont fontWithName:@"Nunito-Regular" size:18.0];
    
    txtUrl.delegate=self;
    txtUrl.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"-Choose game-" attributes:@{NSForegroundColorAttributeName: [UIColor darkGrayColor]}];
    txtUrl.font=[UIFont fontWithName:@"Nunito-Regular" size:10.0];
    
    
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
            [self.view setFrame:CGRectMake(currrentFrame.origin.x, currrentFrame.origin.y-70, currrentFrame.size.width, currrentFrame.size.height)];
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
