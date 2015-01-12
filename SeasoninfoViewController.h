//
//  SeasoninfoViewController.h
//  SignUpMod
//
//  Created by Admin on 11/01/15.
//  Copyright (c) 2015 Manoj Jonna. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SeasoninfoViewController : UIViewController<UITableViewDelegate,UITableViewDelegate>
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
