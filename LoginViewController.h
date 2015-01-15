//
//  LoginViewController.h
//  SignUpMod
//
//  Created by Manoj Jonna on 14/12/14.
//  Copyright (c) 2014 Manoj Jonna. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController<UIScrollViewDelegate>

{
    CGRect lbl1frame;
    CGRect lbl2frame;
    CGRect lbl3frame;
    NSMutableArray *arrayforImages;
    NSTimer *timer;
    int i;
    
    __weak IBOutlet UIPageControl *pageVIewCont;
    IBOutlet UIScrollView *scrollView;
    
}

@property(strong,nonatomic)IBOutlet UILabel *lblTitle;
@property(strong,nonatomic)IBOutlet UILabel *lblText1;

@property(strong,nonatomic)IBOutlet UILabel *lblText2;
@property(strong,nonatomic)IBOutlet UILabel *lblText3;

@property(strong,nonatomic)IBOutlet UIButton *btnLogin;
@property(strong,nonatomic)IBOutlet UIButton *btnSIngUp;
@property(strong,nonatomic)IBOutlet UIButton *btnUseaasGuest;

@property(strong,nonatomic)IBOutlet UIImageView *imgWelcome;

@property(strong,nonatomic)IBOutlet UIButton *btn1;
@property(strong,nonatomic)IBOutlet UIButton *btn2;
@property(strong,nonatomic)IBOutlet UIButton *btn3;
@property(strong,nonatomic)IBOutlet UIButton *btn4;
@property(strong,nonatomic)IBOutlet UIButton *btn5;




-(IBAction)actiononButton1:(id)sender;
-(IBAction)actiononButton2:(id)sender;
-(IBAction)actiononButton3:(id)sender;
-(IBAction)actiononButton4:(id)sender;

-(IBAction)actiononButton5:(id)sender;

-(IBAction)actiononSignup:(id)sender;


-(IBAction)actiononLogin:(id)sender;




@end
