//
//  AddStaffTableViewCell.m
//  TournamentApp
//
//  Created by Manoj Jonna on 19/12/14.
//  Copyright (c) 2014 Manoj Jonna. All rights reserved.
//

#import "AddStaffTableViewCell.h"

@implementation AddStaffTableViewCell
@synthesize imgProfilepic,lblName,lblnickname;




- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        imgProfilepic=[[UIImageView alloc]init];
        lblnickname=[[UILabel alloc]init];
        lblName=[[UILabel alloc]init];
        
        [self addSubview:imgProfilepic];
        [self addSubview:lblName];
        [self addSubview:lblnickname];
        
        
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
