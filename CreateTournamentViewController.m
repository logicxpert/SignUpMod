//
//  CreateTournamentViewController.m
//  TournamentModule
//
//  Created by Manoj Jonna on 21/12/14.
//  Copyright (c) 2014 Manoj Jonna. All rights reserved.
//

#import "CreateTournamentViewController.h"
#import "SelectTimeViewController.h"
#import "EventlistViewController.h"
#import "EventlistViewController.h"
#import "AppDelegate.h"
#import "CalenderViewController.h"

@interface CreateTournamentViewController ()

@end

@implementation CreateTournamentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    scrollviewData.frame=CGRectMake(0, 74, 320, 568);
    scrollviewData.contentSize=CGSizeMake(320, 1000);
    txtChooseName.delegate=self;
    txtWebUrl.delegate=self;
    txtExclusiveTwitterId.delegate=self;
    txtTounamentName.delegate=self;
    
    txtTwitterMessage.text = @"TWITTER MESSAGE";
    txtTwitterMessage.textColor = [UIColor darkGrayColor];
    txtTwitterMessage.delegate = self;
    
    
    
    txtNotificationMessage.text = @"NOTIFICATION MESSAGE";
    txtNotificationMessage.textColor = [UIColor darkGrayColor];
    txtNotificationMessage.delegate = self;
    
    self.navigationController.navigationBarHidden=YES;
    UIColor *color = [UIColor darkGrayColor];
    lbldoubles.textColor=[UIColor darkGrayColor];
    lblTeam11.textColor=[UIColor darkGrayColor];
    lblRoundlbl.textColor=[UIColor darkGrayColor];
    
    imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.allowsEditing = YES;
    imagePickerController.delegate = self;
    
    txtTounamentName.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Tournament Name" attributes:@{NSForegroundColorAttributeName: color}];
    
    txtChooseName.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"-Choose game-" attributes:@{NSForegroundColorAttributeName: color}];
    
    
    
    txtWebUrl.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Web URL" attributes:@{NSForegroundColorAttributeName: color}];
    
    txtExclusiveTwitterId.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Exclusive Twitter ID for tournament" attributes:@{NSForegroundColorAttributeName: color}];

    lblto1.textColor= [UIColor colorWithRed:124/255.0 green:198/255.0 blue:228/255.0 alpha:1];
    lblto2.textColor= [UIColor colorWithRed:124/255.0 green:198/255.0 blue:228/255.0 alpha:1];
    
    lbldoubles.font=[UIFont fontWithName:@"Nunito-Regular" size:15.0];
    lblRoundlbl.font=[UIFont fontWithName:@"Nunito-Regular" size:15.0];
    lblSingles.font=[UIFont fontWithName:@"Nunito-Regular" size:15.0];
    lblTeam11.font=[UIFont fontWithName:@"Nunito-Regular" size:15.0];
    lblGametype.textColor=  [UIColor colorWithRed:124/255.0 green:198/255.0 blue:228/255.0 alpha:1];

    lblTitle.font=  [UIFont fontWithName:@"Nunito-Regular" size:15.0];
    
    [self.view addSubview:scrollviewData];
    
    // Do any additional setup after loading the view from its nib.
}

-(void)viewWillAppear:(BOOL)animated
{
    AppDelegate *app=(AppDelegate *)[UIApplication sharedApplication].delegate;
    
    
    
    
    
    
    
    if([app.isselected isEqualToString:@"start"])
    {
        
        [btnstart setTitle:[[NSUserDefaults standardUserDefaults]valueForKey:@"startdate"] forState:UIControlStateNormal];
        app.isselected=@"no";
        
        //  btnstart se [[NSUserDefaults standardUserDefaults]valueForKey:@"startdate"];
    }
    else  if([app.isselected isEqualToString:@"End"])
    {
        [btnEnd setTitle:[[NSUserDefaults standardUserDefaults]valueForKey:@"enddate"] forState:UIControlStateNormal];
        
        app.isselected=@"no";
        
        // [[NSUserDefaults standardUserDefaults] valueForKey:@"enddate"];
        
    }
}



-(IBAction)actiononProfilepic:(id)sender{
    UIActionSheet *actionsheetPhoto =[[UIActionSheet alloc] initWithTitle:@"Photo" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Take a Photo",@"From Photo Library", nil];
    [actionsheetPhoto showInView:self.view];
}




- (BOOL) textViewShouldBeginEditing:(UITextView *)textView
{
    
    if(textView==txtNotificationMessage)
    {
    txtNotificationMessage.text = @"";
    txtNotificationMessage.textColor = [UIColor whiteColor];
    }
    else{
        txtTwitterMessage.text = @"";
        txtTwitterMessage.textColor = [UIColor whiteColor];
    }
    return YES;
}

-(void) textViewDidChange:(UITextView *)textView
{
    
    if(txtTwitterMessage.text.length == 0){
        txtTwitterMessage.text = @"TWITTER MESSAGE";
        txtTwitterMessage.textColor = [UIColor darkGrayColor];
        
        
        
       
        [txtTwitterMessage resignFirstResponder];
    }
    else if(txtNotificationMessage.text==0){
        txtNotificationMessage.text = @"NOTIFICATION MESSAGE";
        txtNotificationMessage.textColor = [UIColor darkGrayColor];
         [txtNotificationMessage resignFirstResponder];
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

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if([text isEqualToString:@"\n"])
    {
        [scrollviewData setContentOffset:CGPointMake(0,400) animated:YES];
        [textView resignFirstResponder];
    }
    return YES;
}
-(void)textViewDidBeginEditing:(UITextView *)textView
{
    
    [scrollviewData setContentOffset:CGPointMake(0,600) animated:YES];
}
-(void)textViewDidEndEditing:(UITextView *)textView
{
    [textView resignFirstResponder];
    
}
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    if(textField==txtChooseName)
    {
        [scrollviewData setContentOffset:CGPointMake(0,100) animated:YES];

    }
    
  else  if(textField==txtWebUrl)
    {
        [scrollviewData setContentOffset:CGPointMake(0,300) animated:YES];
        
    }
    if(textField==txtExclusiveTwitterId)
    {
        [scrollviewData setContentOffset:CGPointMake(0,400) animated:YES];
        
    }
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
   
    if(textField==txtTounamentName)
       {
           [txtChooseName becomeFirstResponder];
       }
    
    else if (textField==txtChooseName)
    {
        [scrollviewData setContentOffset:CGPointMake(0,0) animated:YES];

    }
    else if(textField==txtWebUrl){
        [textField resignFirstResponder];
        
         [scrollviewData setContentOffset:CGPointMake(0,200) animated:YES];
    }
    else
    {
        [textField resignFirstResponder];
        
        [scrollviewData setContentOffset:CGPointMake(0,200) animated:YES];

    }
    
    return YES;
    
    
}
-(IBAction)actiononRight:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
    
    }
-(IBAction)actiononback:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
    
}
-(IBAction)actionOnStartTime:(id)sender

{
   SelectTimeViewController *objSelect=[[SelectTimeViewController alloc]init];
    
    [self presentViewController:objSelect animated:YES completion:nil];
    
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0:
        {
            if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera] ) {
                imagePickerController.sourceType=UIImagePickerControllerSourceTypeCamera;
            }
            else
            {
                imagePickerController.sourceType=UIImagePickerControllerSourceTypePhotoLibrary;
            }
            
            
            [self presentViewController:imagePickerController animated:YES completion:NULL];
            
            
            break;
            
        }
        case 1:
        {
            imagePickerController.sourceType=UIImagePickerControllerSourceTypePhotoLibrary;
            
            
            
            [self presentViewController:imagePickerController animated:YES completion:NULL];
            
            break;
        }
    }
}


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)img editingInfo:(NSDictionary *)editInfo
{
    [btnProfilepic setImage:img forState:UIControlStateNormal];
    
    [self dismissViewControllerAnimated:YES completion:NULL];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
