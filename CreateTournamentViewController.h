//
//  CreateTournamentViewController.h
//  TournamentModule
//
//  Created by Manoj Jonna on 21/12/14.
//  Copyright (c) 2014 Manoj Jonna. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CreateTournamentViewController : UIViewController<UIImagePickerControllerDelegate,UINavigationControllerDelegate,UITextFieldDelegate,UIActionSheetDelegate,UITextViewDelegate>
{
    IBOutlet UIScrollView *scrollviewData;
    
    IBOutlet UIButton *btnProfilepic;
    IBOutlet UITextField *txtTounamentName;
    IBOutlet UITextField *txtChooseName;;
    IBOutlet UITextField *txtWebUrl;
    IBOutlet UITextField *txtExclusiveTwitterId;
    IBOutlet UILabel *lblto1;
    IBOutlet UILabel *lblto2;
    
    IBOutlet UILabel *lblSingles;
    IBOutlet UILabel *lbldoubles;
    IBOutlet UILabel *lblTeam11;
    IBOutlet UILabel *lblRoundlbl;
    IBOutlet UITextView *txtTwitterMessage;
    IBOutlet UITextView *txtNotificationMessage;
    
    IBOutlet UILabel *lblTitle;
    
    
    
    IBOutlet UILabel *lblGametype;
    UIImagePickerController *imagePickerController;
    

    
    
    
    
    
}
-(IBAction)actionOnStartTime:(id)sender;
-(IBAction)actiononRight:(id)sender;
-(IBAction)actiononback:(id)sender;


@end
