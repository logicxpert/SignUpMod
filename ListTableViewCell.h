//
//  ListTableViewCell.h
//  TournamentApp
//
//  Created by Manoj Jonna on 13/12/14.
//  Copyright (c) 2014 Manoj Jonna. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListTableViewCell : UITableViewCell

@property(strong,nonatomic)UIImageView *imgviewPic;
@property(strong,nonatomic)UILabel *lblEventName;
@property(strong,nonatomic)UILabel *lblEventDAte;
@property(strong,nonatomic)UIButton *btnClose;



@end
