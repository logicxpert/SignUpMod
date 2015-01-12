//
//  EventlistViewController.h
//  TournamentApp
//
//  Created by Manoj Jonna on 13/12/14.
//  Copyright (c) 2014 Manoj Jonna. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EventlistViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>


{
    NSMutableArray *arrayImges;
    
    NSMutableArray *arrayData;
    
    
    

}
@property(strong,nonatomic)IBOutlet UITableView *tblList;
@property(strong,nonatomic)IBOutlet UIButton *btnStartEvent;

@property(strong,nonatomic)IBOutlet UILabel *lblTitle;


-(IBAction)actiononMenu:(id)sender;
-(IBAction)actiononAdd:(id)sender;


@end
