//
//  SignupviewController.h
//  SignUpMod
//
//  Created by Manoj Jonna on 14/12/14.
//  Copyright (c) 2014 Manoj Jonna. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignupviewController : UIViewController<UITextFieldDelegate>
{
    CGRect currentframe;
    
   IBOutlet UIImageView *imgSignUp;
    
    IBOutlet UIView *viewForLlogin;
    IBOutlet UIButton *btnsignup;
    IBOutlet UILabel *lblTit;
    IBOutlet UIButton *btnLogin;
    UIView *inputAccView;
    
    
    
}

@property(strong,nonatomic)IBOutlet UITextField *txtUsername;
@property(strong,nonatomic)IBOutlet UITextField *txtPassword;

@property(strong,nonatomic)IBOutlet UITextField *txtUserrEmial;
@property(strong,nonatomic)IBOutlet UITextField *txtEmailid;
@property(strong,nonatomic)IBOutlet UITextField *txtTwitterAccount;
@property(strong,nonatomic)IBOutlet UITextField *txtCountryCode;
@property(strong,nonatomic)IBOutlet UITextField *txtContactNumber;
@property(strong,nonatomic)IBOutlet UILabel *lblTitle;

-(IBAction)actiononArrow:(id)sender;
-(IBAction)actionOnaLogin:(id)sender;
-(IBAction)actiononClose:(id)sender;

-(IBAction)actiononSignme:(id)sender;



@end
