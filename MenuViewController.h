//
//  MenuViewController.h
//  SignUpMod
//
//  Created by Manoj on 28/12/14.
//  Copyright (c) 2014 Manoj Jonna. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuViewController : UIViewController



{
    IBOutlet UIButton *btntournamnets;
    IBOutlet UIButton *btnSeasons;
    IBOutlet UIButton *btnEvents;
    IBOutlet UIButton *btnMyteams;
    IBOutlet UIButton *btnFollowing;
    IBOutlet UIButton *btnSettings;
    IBOutlet UIButton *btnLogout;
    
    IBOutlet UILabel *lblName;
    IBOutlet UILabel *lblteamName;
    
    IBOutlet UIButton *btnSynctoServver;
    
    
    
}

-(IBAction)actiononEvent:(id)sender;

-(IBAction)actionOntourna:(id)sender;
-(IBAction)actiononSeasons:(id)sender;
-(IBAction)actiononMyteams:(id)sender;
-(IBAction)actioonlogout:(id)sender;
-(IBAction)actiononsetting:(id)sender;
-(IBAction)actioonFollowing:(id)sender;


@end
