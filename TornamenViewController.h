//
//  TornamenViewController.h
//  TournamentModule
//
//  Created by Manoj Jonna on 21/12/14.
//  Copyright (c) 2014 Manoj Jonna. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TornamenViewController : UIViewController<UIScrollViewDelegate,UITextViewDelegate>
{
    
  IBOutlet  UIScrollView *scrollView;
   
    IBOutlet  UILabel *lblTile;
    IBOutlet  UILabel *lblSubTile;

    IBOutlet  UILabel *lblTile1;

    IBOutlet  UILabel *lblTile2;

    IBOutlet  UILabel *lblTile3;
    
    IBOutlet UIScrollView *scrData;
    IBOutlet UIImageView *imgbg;
    
    IBOutlet  UIView *viewForSwipe1;
    IBOutlet UIView *viewForSwipe2;
    IBOutlet UIImageView *headBg;
    
    IBOutlet UITextView *txtNotificationMessage;
    IBOutlet UITextView *txtTwitterMessage;
    
    
    IBOutlet UILabel *lblWinner1;
    IBOutlet UILabel *lblWinner2;
    IBOutlet UILabel *lblWinner3;
    IBOutlet UILabel *lblWinner4;
    IBOutlet UILabel *lblWinner5;
    IBOutlet UILabel *lblWinner6;
    IBOutlet UILabel *lblWinner7;
    IBOutlet UILabel *lblWinner8;
    

    
    IBOutlet UILabel *lblWinners;
    IBOutlet UILabel *lbllossers;
    
    
    
    
    

    
    
    
}
-(IBAction)actiononBack:(id)sender;
-(IBAction)actionONtitle:(id)sender;
@end
