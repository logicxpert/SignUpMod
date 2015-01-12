//
//  SignupviewController.m
//  SignUpMod
//
//  Created by Manoj Jonna on 14/12/14.
//  Copyright (c) 2014 Manoj Jonna. All rights reserved.
//

#import "SignupviewController.h"
#import "UserLoginViewController.h"

#import "MenuViewController.h"
#import "EventlistViewController.h"
#import "AppDelegate.h"
#import "HudView.h"


@interface SignupviewController ()
{
    HudView *aHUD;
    
}

@end

@implementation SignupviewController
@synthesize lblTitle,txtPassword,txtContactNumber,txtCountryCode,txtEmailid,txtTwitterAccount,txtUsername,txtUserrEmial;

- (void)viewDidLoad {
    [super viewDidLoad];
    lblTitle.font=[UIFont fontWithName:@"Futura-Medium" size:10.0];
    txtUserrEmial.delegate=self;
    txtUsername.delegate=self;
    txtTwitterAccount.delegate=self;
    txtEmailid.delegate=self;
    txtPassword.delegate=self;
    txtContactNumber.delegate=self;
    txtCountryCode.delegate=self;
    txtPassword.secureTextEntry=YES;
    txtUserrEmial.secureTextEntry=YES;
    
    currentframe=self.view.frame;
    lblTit.font=[UIFont fontWithName:@"Futura-Medium" size:15.0];
    lblTit.textColor=[UIColor colorWithRed:124/255.0 green:198/255.0 blue:228/255.0 alpha:1] ;
    btnLogin.titleLabel.font=[UIFont fontWithName:@"Futura-Medium" size:15.0];

    
    
    UIColor *color = [UIColor colorWithRed:170/255.0 green:170/255.0 blue:170/255.0 alpha:1];
    txtUserrEmial.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Confirm Password" attributes:@{NSForegroundColorAttributeName: color}];
    
    txtUsername.font=  [UIFont fontWithName:@"Futura-Medium" size:11.0];
    txtUserrEmial.font=  [UIFont fontWithName:@"Futura-Medium" size:11.0];

    
     txtContactNumber.font= [UIFont fontWithName:@"Futura-Medium" size:11.0];
    txtEmailid.font=  [UIFont fontWithName:@"Futura-Medium" size:11.0];
    
    txtPassword.font= [UIFont fontWithName:@"Futura-Medium" size:11.0];

    txtTwitterAccount.font=  [UIFont fontWithName:@"Futura-Medium" size:11.0];
    
    txtCountryCode.font= [UIFont fontWithName:@"Futura-Medium" size:11.0];

    
    
    
    
    txtUsername.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Username" attributes:@{NSForegroundColorAttributeName: color}];
    txtEmailid.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"E-mail ID" attributes:@{NSForegroundColorAttributeName: color}];
    txtPassword.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Password" attributes:@{NSForegroundColorAttributeName: color}];
    txtTwitterAccount.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Twitter account associated" attributes:@{NSForegroundColorAttributeName: color}];
    txtCountryCode.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Country Code" attributes:@{NSForegroundColorAttributeName: color}];
    txtContactNumber.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Contact Number" attributes:@{NSForegroundColorAttributeName: color}];

    // Do any additional setup after loading the view from its nib.
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
-(IBAction)actiononlogin:(id)sender
{
    UserLoginViewController *objLogin=[[UserLoginViewController alloc]init];
    [self.navigationController pushViewController:objLogin animated:YES];
    
}
-(IBAction)actiononSignme:(id)sender
{
    NSString *trimmedStringFirstName = [txtUsername.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *trimmedStringPassword= [txtPassword.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *trimmedconfirm = [txtUserrEmial.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *trimmedEmail = [txtEmailid.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *trimmedPhoneNumber= [txtContactNumber.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
     NSString *trimmedCountryCode= [txtCountryCode.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if ([trimmedStringFirstName length]==0) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Message" message:@"Please enter Username." delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil];
        [alert show];
    }
    
    
    else if ([trimmedStringPassword length]==0){
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Message" message:@"Please enter Password." delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil];
        [alert show];
    }
    else if ([trimmedconfirm length]==0){
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Message" message:@"Please enter Confirm Password." delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil];
        [alert show];
    }
    
    else if (![trimmedconfirm isEqualToString:trimmedStringPassword]){
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Message" message:@"Please enter password and confirm password same." delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil];
        [alert show];
    }
    else if ([trimmedEmail length]==0 || ![self NSStringIsValidEmail:txtEmailid.text]){
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Message" message:@"Please enter valid email." delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil];
        [alert show];
        
    }else if ([trimmedCountryCode length]==0){
        
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Message" message:@"Please enter country code." delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil];
        [alert show];
    }
    else if ([trimmedPhoneNumber length]==0){
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Message" message:@"Please enter phonenumber." delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil];
        [alert show];
    }
    
    else{
        [self showHUD];
        
        
        [self performSelector:@selector(callservice) withObject:nil afterDelay:0.5];
        
        
       
    }
    
    
    
    
    
    
    
    
    




    
    
    

}


-(void)callservice

{
    
    NSString *trimmedStringFirstName = [txtUsername.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *trimmedStringPassword= [txtPassword.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *trimmedconfirm = [txtUserrEmial.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *trimmedEmail = [txtEmailid.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *trimmedPhoneNumber= [txtContactNumber.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *trimmedCountryCode= [txtCountryCode.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSMutableArray *ParamName=[[NSMutableArray alloc]initWithObjects:@"username",@"imageKey",@"phoneNumber",@"email",@"twitterHandle",@"name",@"state",@"password",@"city",@"country", nil];
    NSMutableArray *ParamValue=[[NSMutableArray alloc]initWithObjects:trimmedStringFirstName,@"034e9990-17f6-49f2-b6b9-5b3748a4f668",trimmedPhoneNumber,trimmedEmail,@"",@"test4",@"New Jersey",trimmedStringPassword,@"New York City",@"US", nil];
    
    
    
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
                                                                       stringWithFormat:@"%@/%@",@"http://54.68.218.212:8080/tournamentapis/web/srf/services/network/user",@"register"]]];
    
    
    NSData* data = [bodyStr dataUsingEncoding:NSUTF8StringEncoding];
    [mRequest setHTTPBody:data];
    [mRequest setValue:@"application/json" forHTTPHeaderField:@"content-type"];
    
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
    NSLog(@"~~~~~ Status code: %@", response );
    
    NSDictionary *json=  [NSJSONSerialization JSONObjectWithData:responseData1 options:0 error:&error];
    [self killHUD];
    
    
    
    
    if ([[json valueForKey:@"loggedIn"]boolValue]==TRUE)
        
        
    {
        NSString* content_type = [[[[[[(NSHTTPURLResponse*)response
                                       allHeaderFields] valueForKey:@"Set-Cookie"]componentsSeparatedByString:@";"]firstObject]componentsSeparatedByString:@"="]lastObject];
        NSLog(@"headers=%@",content_type);
        
        
        
        [[NSUserDefaults standardUserDefaults]setObject:content_type forKey:@"authkey"];
        AppDelegate *app=(AppDelegate *)[UIApplication sharedApplication].delegate;
        
        MenuViewController *objmenu=[[MenuViewController alloc]init];
        EventlistViewController *objEvent=[[EventlistViewController alloc]init];
        //
        
        app.objMenuControllrer = [[DDMenuController alloc] initWithRootViewController:objEvent];
        
        app.objMenuControllrer.leftViewController = objmenu;
        [app.objMenuControllrer showLeft:objmenu];
        //
        [self.navigationController pushViewController:app.objMenuControllrer animated:YES];
    }
    
    
    else  if([[[json valueForKey:@"errorMessages"] objectAtIndex:0]isEqualToString:@"password Invalid password. password has to be 6 to 20 characters string with at least one digit, one upper case letter, one lower case letter and one special symbol"])
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Warning" message:[[json valueForKey:@"errorMessages"]objectAtIndex:0] delegate:nil cancelButtonTitle:@"ok" otherButtonTitles: nil];
        [alert show];
    }
    
    
    //        if ([[json valueForKey:@"loggedIn"]boolValue ]==TRUE) {
    //
    //            AppDelegate *app=(AppDelegate *)[UIApplication sharedApplication].delegate;
    //
    //            MenuViewController *objmenu=[[MenuViewController alloc]init];
    //            EventlistViewController *objEvent=[[EventlistViewController alloc]init];
    //
    //
    //            app.objMenuControllrer = [[DDMenuController alloc] initWithRootViewController:objEvent];
    //
    //            app.objMenuControllrer.leftViewController = objmenu;
    //            [app.objMenuControllrer showLeft:objmenu];
    //
    //            [self.navigationController pushViewController:app.objMenuControllrer animated:YES];
    //
    //
    //        }
    //        else if([[[json valueForKey:@"errorMessages"]objectAtIndex:0] isEqualToString:@"Username or Password is incorrect"])
    //        {
    //            UIAlertView *alertview  =[[UIAlertView alloc]initWithTitle:@"Message" message:@"Username or Password is incorrect" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    //            [alertview show];
    //
    //        }
    
    
    
    
    //NSLog(@"json=%@",respo);
    
    

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


-(BOOL) NSStringIsValidEmail:(NSString *)checkString
{
    BOOL stricterFilter = YES;
    NSString *stricterFilterString = @"[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}";
    NSString *laxString = @".+@([A-Za-z0-9]+\\.)+[A-Za-z]{2}[A-Za-z]*";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:checkString];
}

-(void)createInputAccessoryView{
    // Create the view that will play the part of the input accessory view.
    // Note that the frame width (third value in the CGRectMake method)
    // should change accordingly in landscape orientation. But we don’t care
    // about that now.
    inputAccView = [[UIView alloc] initWithFrame:CGRectMake(10.0, 0.0, 310.0, 40.0)];
    
    // Set the view’s background color. We’ ll set it here to gray. Use any color you want.
    [inputAccView setBackgroundColor:[UIColor whiteColor]];
    
    // We can play a little with transparency as well using the Alpha property. Normally
    // you can leave it unchanged.
    
    
  
    
   
    
    UIButton *btnDone = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnDone setFrame:CGRectMake(240.0, 0.0f, 80.0f, 40.0f)];
    [btnDone setTitle:@"Done" forState:UIControlStateNormal];
    [btnDone setBackgroundColor:[UIColor clearColor]];
    [btnDone setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btnDone addTarget:self action:@selector(doneTyping) forControlEvents:UIControlEventTouchUpInside];
    
    // Now that our buttons are ready we just have to add them to our view.
    
    [inputAccView addSubview:btnDone];
}

-(void)doneTyping
{
    [self.view endEditing:YES];
    [UIView animateWithDuration:0.3 animations:^{
        [self.view setFrame:CGRectMake(currentframe.origin.x, currentframe.origin.y, currentframe.size.width, currentframe.size.height)];
        //txtForEmail.frame=CGRectMake(76, 307, 171, 30);
    }];

    
}
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    

    if (textField ==txtEmailid) {
        
        [UIView animateWithDuration:0.3 animations:^{
            [self.view setFrame:CGRectMake(currentframe.origin.x, currentframe.origin.y-50, currentframe.size.width, currentframe.size.height)];
            //txtForEmail.frame=CGRectMake(76, 307, 171, 30);
        }];
        
    }
    
   else if (textField ==txtTwitterAccount) {
        
        [UIView animateWithDuration:0.3 animations:^{
            [self.view setFrame:CGRectMake(currentframe.origin.x, currentframe.origin.y-150, currentframe.size.width, currentframe.size.height)];
            //txtForEmail.frame=CGRectMake(76, 307, 171, 30);
        }];
        
    }
   else if (textField ==txtCountryCode) {
       
       
       
       [self createInputAccessoryView];
       
       // Now add the view as an input accessory view to the selected textfield.
       [textField setInputAccessoryView:inputAccView];

        
        [UIView animateWithDuration:0.3 animations:^{
            [self.view setFrame:CGRectMake(currentframe.origin.x, currentframe.origin.y-150, currentframe.size.width, currentframe.size.height)];
            //txtForEmail.frame=CGRectMake(76, 307, 171, 30);
        }];
        
    }
    
   else if (textField ==txtContactNumber) {
       
       
       [self createInputAccessoryView];
       
       // Now add the view as an input accessory view to the selected textfield.
       [textField setInputAccessoryView:inputAccView];

       
       [UIView animateWithDuration:0.3 animations:^{
           [self.view setFrame:CGRectMake(currentframe.origin.x, currentframe.origin.y-150, currentframe.size.width, currentframe.size.height)];
           //txtForEmail.frame=CGRectMake(76, 307, 171, 30);
       }];
       
   }

    

    
}

-(IBAction)actiononArrow:(id)sender
{
    viewForLlogin.frame=CGRectMake(0, self.view.frame.size.height-100, 320, 100);
    btnsignup.hidden=YES;
    imgSignUp.hidden=YES;
    viewForLlogin.backgroundColor=[UIColor clearColor];
    
    
    
    [UIView animateWithDuration:0.8
                          delay:0.1
                        options: UIViewAnimationCurveEaseIn
                     animations:^{
                         viewForLlogin.frame=CGRectMake(0, self.view.frame.size.height-100
                                                       , 320, 100);
                     }
                     completion:^(BOOL finished){
                     }];
    [self.view addSubview:viewForLlogin];
}

-(IBAction)actiononClose:(id)sender
{
    viewForLlogin.frame=CGRectMake(0, self.view.frame.size.height-94, 320, 110);
    btnsignup.hidden=NO;
    imgSignUp.hidden=NO;
    
    
    
    [UIView animateWithDuration:0.8
                          delay:0.1
                        options: UIViewAnimationCurveEaseIn
                     animations:^{
                         viewForLlogin.frame=CGRectMake(0, self.view.frame.size.height-94
                                                        , 320, 110);
                     }
                     completion:^(BOOL finished){
                     }];
    [viewForLlogin removeFromSuperview];
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    [UIView animateWithDuration:0.3 animations:^{
        [self.view setFrame:CGRectMake(currentframe.origin.x, currentframe.origin.y, currentframe.size.width, currentframe.size.height)];
        //txtForEmail.frame=CGRectMake(76, 307, 171, 30);
    }];
    
    [self.view endEditing:YES];
    
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    if(textField==txtUsername)
    {
        [txtPassword becomeFirstResponder];
        
    }
    else if(textField==txtPassword)
    {
        [txtUserrEmial becomeFirstResponder];
        
    }
  else  if(textField==txtUserrEmial)
    {
        [txtEmailid becomeFirstResponder];
        
    }

   else if(textField==txtEmailid)
    {
        [txtTwitterAccount becomeFirstResponder];
        
    }

  else  if(textField==txtTwitterAccount)
    {
        [txtCountryCode becomeFirstResponder];
        
    }

  else  if(textField==txtCountryCode)
    {
        [txtContactNumber becomeFirstResponder];
        
    }
  else{

    
      
      [UIView animateWithDuration:0.3 animations:^{
          [self.view setFrame:CGRectMake(currentframe.origin.x, currentframe.origin.y, currentframe.size.width, currentframe.size.height)];
          //txtForEmail.frame=CGRectMake(76, 307, 171, 30);
      }];
    
    [textField resignFirstResponder];
  }
    
    
    return YES;
    
}

@end
