//
//  EventInfoViewController.h
//  TournamentApp
//
//  Created by Manoj Jonna on 13/12/14.
//  Copyright (c) 2014 Manoj Jonna. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EventInfoViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *arrayImges;
}
@property(strong,nonatomic)IBOutlet UITableView *tbldata;
@property(strong,nonatomic)IBOutlet UILabel *lblDate;
@property(strong,nonatomic)IBOutlet UILabel *lblTitle1;
@property(strong,nonatomic)IBOutlet UILabel *lblTitle2;


-(IBAction)actiononINfo:(id)sender;
-(IBAction)actiononBack:(id)sender;





@end
