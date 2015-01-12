//
//  UserLoginViewController.h
//  SignUpMod
//
//  Created by Manoj Jonna on 14/12/14.
//  Copyright (c) 2014 Manoj Jonna. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserLoginViewController : UIViewController<UITextFieldDelegate>
{
    CGRect currentframe;
    IBOutlet UIView *viewForArrow;
    IBOutlet UIView *viewForLogin;
    
    
}
@property(strong,nonatomic)IBOutlet UITextField *txtusername;
@property(strong,nonatomic)IBOutlet UITextField *txtPassword;

@property(strong,nonatomic)IBOutlet UILabel *lblTitle;
@property(strong,nonatomic)IBOutlet UILabel *labnew;
@property(strong,nonatomic)IBOutlet UIButton *signup;
@property(strong,nonatomic)IBOutlet UIButton *btnGurest;
@property(strong,nonatomic)IBOutlet UIButton *btnForgot;




-(IBAction)actiononSignup:(id)sender;

-(IBAction)actiononUpperArrow:(id)sender;
-(IBAction)actiononClose:(id)sender;
-(IBAction)actiononLogin:(id)sender;




@end
