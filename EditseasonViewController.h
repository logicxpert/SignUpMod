//
//  EditseasonViewController.h
//  SignUpMod
//
//  Created by Admin on 11/01/15.
//  Copyright (c) 2015 Manoj Jonna. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditseasonViewController : UIViewController<UITextFieldDelegate>
{
    CGRect currrentFrame;
    IBOutlet UIButton *btnstart;
    
    IBOutlet UIButton *btnEnd;
    
}


@property(strong,nonatomic)IBOutlet UILabel *lblto;
@property(strong,nonatomic)IBOutlet UILabel *lbltitle;;
-(IBAction)actiononBack:(id)sender;
@property(strong,nonatomic)IBOutlet UILabel *lblname;
@property(strong,nonatomic)IBOutlet UITextField *txtUrl;

-(IBAction)actionAddstaff:(id)sender;


-(IBAction)actiononStartEvent:(id)sender;
-(IBAction)actiononEnddate:(id)sender;

@end
