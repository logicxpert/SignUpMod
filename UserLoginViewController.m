//
//  UserLoginViewController.m
//  SignUpMod
//
//  Created by Manoj Jonna on 14/12/14.
//  Copyright (c) 2014 Manoj Jonna. All rights reserved.
//

#import "UserLoginViewController.h"
#import "SignupviewController.h"
#import "MenuViewController.h"
#import "AppDelegate.h"
#import "EventlistViewController.h"
#import "HudView.h"


@interface UserLoginViewController ()
{
    HudView *aHUD;
    
}

@end

@implementation UserLoginViewController
@synthesize lblTitle,labnew,btnForgot,btnGurest,signup,txtPassword,txtusername;



- (void)viewDidLoad {
    [super viewDidLoad];
    
   labnew.font=[UIFont fontWithName:@"Futura-Medium" size:13.0];
    lblTitle.font=[UIFont fontWithName:@"Futura-Medium" size:13.0];
    labnew.textColor=[UIColor colorWithRed:124/255.0 green:198/255.0 blue:228/255.0 alpha:1] ;
    txtusername.delegate=self;
    txtPassword.delegate=self;
    currentframe=self.view.frame;
    txtPassword.secureTextEntry=YES;
    
    
    UIColor *color = [UIColor colorWithRed:170/255.0 green:170/255.0 blue:170/255.0 alpha:1];
    txtusername.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Username or Email" attributes:@{NSForegroundColorAttributeName: color}];
    txtusername.font=[UIFont fontWithName:@"Futura-Medium" size:10.0];
    txtPassword.font=[UIFont fontWithName:@"Futura-Medium" size:10.0];
    
    
    
    
    txtPassword.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Password" attributes:@{NSForegroundColorAttributeName: color}];
    
    btnForgot.titleLabel.font=[UIFont fontWithName:@"Futura-Medium" size:13.0];
    btnGurest.titleLabel.font=[UIFont fontWithName:@"Futura-Medium" size:15.0];
    signup.titleLabel.font=[UIFont fontWithName:@"Futura-Medium" size:15.0];

   
    
}

-(IBAction)actiononUpperArrow:(id)sender
{
    
    
    viewForArrow.frame=CGRectMake(0, self.view.frame.size.height-204, 320, 230);
    viewForLogin.hidden=YES;
    viewForArrow.backgroundColor=[UIColor clearColor];
    
  
    
    [UIView animateWithDuration:0.8
                          delay:0.1
                        options: UIViewAnimationCurveEaseIn
                     animations:^{
                         viewForArrow.frame=CGRectMake(0, self.view.frame.size.height-204
                                                       , 320, 230);
                     }
                     completion:^(BOOL finished){
                     }];
    [self.view addSubview:viewForArrow];
    
    
    
}

-(IBAction)actiononClose:(id)sender
{
    
    
    viewForLogin.hidden=NO;
    
    
    
    
    
    
    
    
    [UIView animateWithDuration:1.5
                          delay:0.5
                        options: UIViewAnimationCurveEaseIn
                     animations:^{
                         viewForArrow.frame=CGRectMake(0, self.view.frame.size.height-204
                                                       , 320, 230);
                     }
                     completion:^(BOOL finished){
                         if (finished)
                             [viewForArrow removeFromSuperview];
                     }];
    
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)actiononSignup:(id)sender
{
    SignupviewController *objSignup=[[SignupviewController alloc]init];
    [self.navigationController pushViewController:objSignup animated:YES];
    
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    
  
    
    if(textField==txtPassword)
        
    {
        
        [UIView animateWithDuration:0.3 animations:^{
            [self.view setFrame:CGRectMake(currentframe.origin.x, currentframe.origin.y-50, currentframe.size.width, currentframe.size.height)];
            //txtForEmail.frame=CGRectMake(76, 307, 171, 30);
        }];
    }
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    if(textField==txtusername)
    {
        [txtPassword becomeFirstResponder];
        
    }
    else{
        
        
        [UIView animateWithDuration:0.3 animations:^{
            [self.view setFrame:CGRectMake(currentframe.origin.x, currentframe.origin.y, currentframe.size.width, currentframe.size.height)];
            //txtForEmail.frame=CGRectMake(76, 307, 171, 30);
        }];

       [textField resignFirstResponder];
        
        
        NSString *trimmedStringUsername = [txtusername.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        NSString *trimmedStringPassword = [txtPassword.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];

        
        if ([trimmedStringUsername length]==0) {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Message" message:@"Please enter Username." delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil];
            [alert show];
        }
        
        
        else if ([trimmedStringPassword length]==0){
            
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Message" message:@"Please enter password." delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil];
            [alert show];
        }
        else{

        [self showHUD];
        
        
        [self performSelector:@selector(actiononLogin:) withObject:nil afterDelay:1.0];
        }
        
        
    }
    
    return YES;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    [self.view endEditing:YES];
    [UIView animateWithDuration:0.3 animations:^{
        [self.view setFrame:CGRectMake(currentframe.origin.x, currentframe.origin.y, currentframe.size.width, currentframe.size.height)];
        //txtForEmail.frame=CGRectMake(76, 307, 171, 30);
    }];
}
-(IBAction)actiononLogin:(id)sender
{
    
    
    NSString *trimmedStringUsername = [txtusername.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *trimmedStringPassword = [txtPassword.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
 
    if ([trimmedStringUsername length]==0) {
        [self killHUD];
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Message" message:@"Please enter Username." delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil];
        [alert show];
    }
    
    
    else if ([trimmedStringPassword length]==0){
        [self killHUD];
        
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Message" message:@"Please enter password." delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil];
        [alert show];
    }
   
    
    else{
        [self showHUD];
        
        NSMutableArray *ParamName=[[NSMutableArray alloc]initWithObjects:@"username",@"password", nil];
        NSMutableArray *ParamValue=[[NSMutableArray alloc]initWithObjects:trimmedStringUsername,trimmedStringPassword, nil];
       
        
        
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
                                                                           stringWithFormat:@"%@/%@",@"http://54.68.218.212:8080/tournamentapis/web/srf/services/network",@"login"]]];
        
        
        NSData* data = [bodyStr dataUsingEncoding:NSUTF8StringEncoding];
        [mRequest setHTTPBody:data];
        [mRequest setValue:@"application/json" forHTTPHeaderField:@"content-type"];
       
        [mRequest setHTTPMethod:@"POST"];
        
        NSHTTPURLResponse *response = nil;
        NSError *error = nil;
        NSData *responseData1  = [NSURLConnection sendSynchronousRequest:mRequest returningResponse:&response error:&error];
        NSURLResponse *response2;
        NSData *responseData2  = [NSURLConnection sendSynchronousRequest:mRequest returningResponse:&response2 error:&error];

        
        if (error!=nil) {
            //[delegate getResponse:error]; // commented on 20august
            // NSLog(@" %@",error);
            //return;zzzllljmdjnfusdnfosdful
        }
        NSString *responseString = [[NSString alloc]initWithData:responseData2 encoding:NSUTF8StringEncoding];
        
        responseString = [responseString stringByReplacingOccurrencesOfString:@"\\" withString:@""];
        if ([responseString hasPrefix:@"\""])
        {
            responseString = [responseString substringFromIndex:1];
        } if ([responseString hasSuffix:@"\""])
        {
            responseString = [responseString substringToIndex:[responseString length]-1];
            
        }
        
      
        
        
        
        NSDictionary *json=  [NSJSONSerialization JSONObjectWithData:responseData2 options:0 error:&error];
        [self killHUD];
        
        if ([[json valueForKey:@"loggedIn"]boolValue ]==TRUE) {
            
            
            NSLog(@"~~~~~ Status code: %@", response);
            
            NSString* content_type = [[[[[[(NSHTTPURLResponse*)response
                                           allHeaderFields] valueForKey:@"Set-Cookie"]componentsSeparatedByString:@";"]firstObject]componentsSeparatedByString:@"="]lastObject];
            NSLog(@"headers=%@",content_type);
            
            
            
            [[NSUserDefaults standardUserDefaults]setObject:content_type forKey:@"authkey"];
           
            
            
          AppDelegate *app=(AppDelegate *)[UIApplication sharedApplication].delegate;
            
            MenuViewController *objmenu=[[MenuViewController alloc]init];
            EventlistViewController *objEvent=[[EventlistViewController alloc]init];
           
            
            app.objMenuControllrer = [[DDMenuController alloc] initWithRootViewController:objEvent];
            
            app.objMenuControllrer.leftViewController = objmenu;
            [app.objMenuControllrer showLeft:objmenu];
            
            [self.navigationController pushViewController:app.objMenuControllrer animated:YES];

          
        }
        else if([[[json valueForKey:@"errorMessages"]objectAtIndex:0] isEqualToString:@"Username or Password is incorrect"])
        {
            UIAlertView *alertview  =[[UIAlertView alloc]initWithTitle:@"Message" message:@"Username or Password is incorrect" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alertview show];
            
        }

        
      
        
        //NSLog(@"json=%@",respo);

        
    }
    

    
   
    
    
    
   
    
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
