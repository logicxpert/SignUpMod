//
//  SeasonListViewController.h
//  SignUpMod
//
//  Created by Admin on 11/01/15.
//  Copyright (c) 2015 Manoj Jonna. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SeasonListViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>


{
    NSMutableArray *arrayImges;
    
    NSMutableArray *arrayData;
    
    
    
    
}
@property(strong,nonatomic)IBOutlet UITableView *tblList;

-(IBAction)actiononMenu:(id)sender;
-(IBAction)actiononAdd:(id)sender;


@end
