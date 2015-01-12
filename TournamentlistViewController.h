//
//  EventlistViewController.h
//  TournamentApp
//
//  Created by Manoj Jonna on 13/12/14.
//  Copyright (c) 2014 Manoj Jonna. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DDMenuController.h"
@interface TournamentlistViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,DDMenuControllerDelegate>


{
    NSMutableArray *arrayImges;
    
    

}
@property(strong,nonatomic)IBOutlet UITableView *tblList;


-(IBAction)actiononMenu:(id)sender;

-(IBAction)actiononAdd:(id)sender;

@end
