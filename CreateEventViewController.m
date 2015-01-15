//
//  CreateEventViewController.m
//  TournamentApp
//
//  Created by Manoj Jonna on 11/12/14.
//  Copyright (c) 2014 Manoj Jonna. All rights reserved.
//

#import "CreateEventViewController.h"
#import "CalenderViewController.h"
#import "AppDelegate.h"
#import "EventlistViewController.h"
#import "HudView.h"

@interface CreateEventViewController ()
{
    HudView *aHUD;
    
}

@end

@implementation CreateEventViewController
@synthesize btnProfilePic,btnEnd,btnstart,lblFont,txtEvtname,lblTo,txtURl,lblupload,lblupload1,lblupload2;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationController.navigationBarHidden=YES;
    
    imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.allowsEditing = YES;
    imagePickerController.delegate = self;
    txtEvtname.delegate=self;
    currentFrame=self.view.frame;
    
    txtURl.delegate=self;
    lblupload.font=[UIFont fontWithName:@"Nunito-Regular" size:13.0];
    lblupload1.font=[UIFont fontWithName:@"Nunito-Regular" size:13.0];

    lblupload2.font=[UIFont fontWithName:@"Nunito-Regular" size:13.0];

    UIColor *color = [UIColor colorWithRed:170/255.0 green:170/255.0 blue:170/255.0 alpha:1];
    txtEvtname.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Event name" attributes:@{NSForegroundColorAttributeName: color}];
    
    txtURl.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@" Event Url" attributes:@{NSForegroundColorAttributeName: color}];
    
    txtEvtname.font=[UIFont fontWithName:@"Nunito-Regular" size:10.0];
    txtURl.font=[UIFont fontWithName:@"Nunito-Regular" size:10.0];

    
   
    lblTo.textColor= [UIColor colorWithRed:124/255.0 green:198/255.0 blue:228/255.0 alpha:1];
    lblFont.font=[UIFont fontWithName:@"Nunito-Light" size:18.0];
    lblFont.textColor=[UIColor whiteColor];
    
     lblTo.font=[UIFont fontWithName:@"Nunito-Regular" size:18.0];
    
    


    // Do any additional setup after loading the view from its nib.
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [UIView animateWithDuration:0.3 animations:^{
        [self.view setFrame:CGRectMake(currentFrame.origin.x, currentFrame.origin.y, currentFrame.size.width, currentFrame.size.height)];
        //txtForEmail.frame=CGRectMake(76, 307, 171, 30);
    }];
    [self.view endEditing:YES];
    
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [txtEvtname resignFirstResponder];
    
    if(textField==txtEvtname)
    {
        [txtURl becomeFirstResponder];
        
    }
    else{
        
        [UIView animateWithDuration:0.3 animations:^{
            [self.view setFrame:CGRectMake(currentFrame.origin.x, currentFrame.origin.y, currentFrame.size.width, currentFrame.size.height)];
            //txtForEmail.frame=CGRectMake(76, 307, 171, 30);
        }];
        [textField resignFirstResponder];
        
    }
    return YES;
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
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)actiononProfilepic:(id)sender{
    UIActionSheet *actionsheetPhoto =[[UIActionSheet alloc] initWithTitle:@"Photo" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Take a Photo",@"From Photo Library", nil];
    [actionsheetPhoto showInView:self.view];
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
	[btnProfilePic setImage:img forState:UIControlStateNormal];
    
    [self dismissViewControllerAnimated:YES completion:NULL];
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

- (void) killHUD{
    if(aHUD != nil ){
        [aHUD.loadingView removeFromSuperview];
        [self.view setUserInteractionEnabled:YES];
        
        aHUD = nil;
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    }
}
- (void) showHUD{
    if(aHUD == nil){
        aHUD = [[HudView alloc]init];
        aHUD.tag=5555;
        [aHUD loadingViewInView:self.view text:@"Please Wait..."];
        [aHUD setUserInteractionEnabledForSuperview:self.view.superview];
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    }
}



-(IBAction)createEvent:(id)sender
{
    if([txtEvtname.text length]==0)
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Message" message:@"Please enter Event name." delegate:nil cancelButtonTitle:@"ok" otherButtonTitles: nil];
        [alert show];
    }
    
  else if ([[NSUserDefaults standardUserDefaults]valueForKey:@"StartTimeStamp"]==nil) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Message" message:@"Please select start date." delegate:nil cancelButtonTitle:@"ok" otherButtonTitles: nil];
        [alert show];
        
        
    }
  else  if ([[NSUserDefaults standardUserDefaults]valueForKey:@"StartTimeStamp"]==nil) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Message" message:@"Please select start date." delegate:nil cancelButtonTitle:@"ok" otherButtonTitles: nil];
        [alert show];
        
        
    }
  else{
      
      [self showHUD];
      
      [self performSelector:@selector(callservice) withObject:nil afterDelay:0.5];
      
  }
    
    
    
    
   
    
    
}

-(void)callservice
{
    NSMutableArray *ParamName=[[NSMutableArray alloc]initWithObjects:@"tournaments",@"seasons",@"endDate",@"staff",@"completed",@"name",@"startDate", nil];
    
    NSArray *array=[[NSArray alloc]init];
    
    NSMutableArray *ParamValue=[[NSMutableArray alloc]initWithObjects:array,array,[[NSUserDefaults standardUserDefaults]valueForKey:@"StartTimeStamp"],array,@"false",txtEvtname.text,[[NSUserDefaults standardUserDefaults]valueForKey:@"EndTimeStamp"], nil];
    
    
    
    
    NSMutableString *paramString=[NSMutableString stringWithFormat:@"{\"%@\":\"%@\"",[ParamName objectAtIndex:0],[ParamValue  objectAtIndex:0]];
    int i = 1;
    while (i<[ParamName count]) {
        NSString *temStr=[NSString stringWithFormat:@",\"%@\":\"%@\"",[ParamName objectAtIndex:i],[ParamValue  objectAtIndex:i]];
        [paramString appendString:temStr];
        i++;
    }
    
    
    NSString *bodyStr = [NSString stringWithFormat:@"%@}",paramString];
    
    
    bodyStr = [bodyStr stringByReplacingOccurrencesOfString:@"\"(" withString:@"["];
    
    bodyStr = [bodyStr stringByReplacingOccurrencesOfString:@")\"" withString:@"]"];
    
    bodyStr = [bodyStr stringByReplacingOccurrencesOfString:@"\"[" withString:@"["];
    bodyStr = [bodyStr stringByReplacingOccurrencesOfString:@"]\"" withString:@"]"];
    bodyStr = [bodyStr stringByReplacingOccurrencesOfString:@"\\" withString:@""];
    bodyStr = [bodyStr stringByReplacingOccurrencesOfString:@"\"{" withString:@"{"];
    bodyStr = [bodyStr stringByReplacingOccurrencesOfString:@"}\"" withString:@"}"];
    
    
    
    NSMutableURLRequest *mRequest = [[NSMutableURLRequest alloc]
                                     initWithURL:[NSURL URLWithString:[NSString
                                                                       stringWithFormat:@"%@/%@",@"http://54.68.218.212:8080/tournamentapis/web/srf/services/main",@"event"]]];
    
    
    NSData* data = [bodyStr dataUsingEncoding:NSUTF8StringEncoding];
    [mRequest setHTTPBody:data];
    // [mRequest setValue:@"application/json" forHTTPHeaderField:@"content-type"];
    
    
    [mRequest setValue:@"application/json" forHTTPHeaderField:@"content-type"];
    [mRequest setValue:[[NSUserDefaults standardUserDefaults]valueForKey:@"authkey"] forHTTPHeaderField:@"AUTH-KEY"];
    
    [mRequest setHTTPMethod:@"POST"];
    
    NSHTTPURLResponse *response = nil;
    NSError *error = nil;
    NSData *responseData1  = [NSURLConnection sendSynchronousRequest:mRequest returningResponse:&response error:&error];
    
    
    
    if (error!=nil) {
        //[delegate getResponse:error]; // commented on 20august
        // NSLog(@" %@",error);
        //return;zzzllljmdjnfusdnfosdful
    }
    NSString *responseString = [[NSString alloc]initWithData:responseData1 encoding:NSUTF8StringEncoding];
    
    responseString = [responseString stringByReplacingOccurrencesOfString:@"\\" withString:@""];
    if ([responseString hasPrefix:@"\""])
    {
        responseString = [responseString substringFromIndex:1];
    } if ([responseString hasSuffix:@"\""])
    {
        responseString = [responseString substringToIndex:[responseString length]-1];
        
    }
    
    
    
    
    [self killHUD];
    
    
    
    if([response statusCode]==200)
    {
        AppDelegate *app=(AppDelegate *)[UIApplication sharedApplication].delegate;
        [app.navmain popViewControllerAnimated:YES];
    }
    else{
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Message" message:@"Event is not created" delegate:nil cancelButtonTitle:nil otherButtonTitles: nil];
        [alert show];
        
    }
    
    
    
    
    
    
    
    NSDictionary *json=  [NSJSONSerialization JSONObjectWithData:responseData1 options:0 error:&error];
    
    
    if (json) {
        
        
        
        
    }
}

-(IBAction)actiononBack:(id)sender
{
    AppDelegate *app=(AppDelegate *)[UIApplication sharedApplication].delegate;
    [app.navmain popViewControllerAnimated:YES];
}


-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    if(textField==txtURl)
    {
        
        [UIView animateWithDuration:0.3 animations:^{
            [self.view setFrame:CGRectMake(currentFrame.origin.x, currentFrame.origin.y-50, currentFrame.size.width, currentFrame.size.height)];
            //txtForEmail.frame=CGRectMake(76, 307, 171, 30);
        }];
    }
}



@end
