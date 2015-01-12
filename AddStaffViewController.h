//
//  AddStaffViewController.h
//  TournamentApp
//
//  Created by Manoj Jonna on 19/12/14.
//  Copyright (c) 2014 Manoj Jonna. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddStaffViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>
{
    
}
@property (strong,nonatomic)IBOutlet UITableView *tblData;
@property(strong,nonatomic)IBOutlet UITextField *txtSearch;

@property(strong,nonatomic)IBOutlet UILabel *lblTitle;


-(IBAction)actiononBack:(id)sender;

@end
