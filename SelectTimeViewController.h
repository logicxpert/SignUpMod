//
//  SelectTimeViewController.h
//  TournamentModule
//
//  Created by Manoj Jonna on 21/12/14.
//  Copyright (c) 2014 Manoj Jonna. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KGGTimePickerView.h"


@interface SelectTimeViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    IBOutlet UITableView *tblview1;
    IBOutlet UITableView *tblbview2;
    IBOutlet UITableView *tblview3;
    NSMutableArray *arrayHours;
    NSMutableArray *arryMinutes;
    NSMutableArray *arrayAm;
    
    
    
}



@end
