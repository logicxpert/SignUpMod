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
    
    
    IBOutlet UIButton *btnWinner1;
    IBOutlet UIButton *btnWinner2;
    IBOutlet UIButton   *btnWinner3;
    IBOutlet UIButton *btnWinner4;
    IBOutlet UIButton *btnWinner5;
    IBOutlet UIButton *btnWinner6;
    IBOutlet UIButton *btnWinner7;
    IBOutlet UIButton *btnWinner8;
    
    IBOutlet UIButton *btnWinner9;
    IBOutlet UIButton *btnWinner10;
    
    IBOutlet UILabel *lblWinners;
    IBOutlet UILabel *lbllossers;
    
    
    
    
    

    
    
    
}

-(IBAction)actiononsetTime:(id)sender;
-(IBAction)actiononBack:(id)sender;
-(IBAction)actionONtitle:(id)sender;
-(IBAction)actiononEdit:(id)sender;
@end
