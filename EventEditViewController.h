//
//  EventEditViewController.h
//  TournamentApp
//
//  Created by Manoj Jonna on 13/12/14.
//  Copyright (c) 2014 Manoj Jonna. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EventEditViewController : UIViewController<UITextFieldDelegate>
{
    CGRect currrentFrame;
    IBOutlet UIButton *btnstart;
    
    IBOutlet UIButton *btnEnd;
    
}


@property(strong,nonatomic)IBOutlet UILabel *lblto;
-(IBAction)actiononBack:(id)sender;
@property(strong,nonatomic)IBOutlet UILabel *lblname;
@property(strong,nonatomic)IBOutlet UITextField *txtUrl;

-(IBAction)actionAddstaff:(id)sender;


-(IBAction)actiononStartEvent:(id)sender;
-(IBAction)actiononEnddate:(id)sender;


@end
