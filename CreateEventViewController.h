//
//  CreateEventViewController.h
//  TournamentApp
//
//  Created by Manoj Jonna on 11/12/14.
//  Copyright (c) 2014 Manoj Jonna. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UITextField+Validation.h"

@interface CreateEventViewController : UIViewController<UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIActionSheetDelegate,UITextFieldDelegate>
{
    UIImagePickerController *imagePickerController;
    CGRect currentFrame;
    

}
@property(strong,nonatomic)IBOutlet  UIButton *btnProfilePic;
@property(strong,nonatomic)IBOutlet UIButton *btnstart;
@property(strong,nonatomic)IBOutlet UIButton *btnEnd;
@property(strong,nonatomic)IBOutlet UILabel *lblFont;
@property(strong,nonatomic)IBOutlet UILabel *lblTo;
@property(strong,nonatomic)IBOutlet UILabel *lblupload;
@property(strong,nonatomic)IBOutlet UILabel *lblupload1;
@property(strong,nonatomic)IBOutlet UILabel *lblupload2;




@property(strong,nonatomic)IBOutlet UITextField *txtEvtname;
@property(strong,nonatomic)IBOutlet UITextField *txtURl;


-(IBAction)actiononProfilepic:(id)sender;

-(IBAction)actiononStartEvent:(id)sender;
-(IBAction)actiononEnddate:(id)sender;

-(IBAction)createEvent:(id)sender;
-(IBAction)actiononBack:(id)sender;



@end
