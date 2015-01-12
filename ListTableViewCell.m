//
//  ListTableViewCell.m
//  TournamentApp
//
//  Created by Manoj Jonna on 13/12/14.
//  Copyright (c) 2014 Manoj Jonna. All rights reserved.
//

#import "ListTableViewCell.h"

@implementation ListTableViewCell
@synthesize imgviewPic,lblEventDAte,lblEventName,btnClose;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        imgviewPic=[[UIImageView alloc]init];
        lblEventName=[[UILabel alloc]init];
        lblEventDAte=[[UILabel alloc]init];
        btnClose=[UIButton buttonWithType:UIButtonTypeCustom];
        
        
        
        [self addSubview:btnClose];

        
        [self addSubview:imgviewPic];
        [imgviewPic addSubview:lblEventDAte];
        [imgviewPic addSubview:lblEventName];
        
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib {
    
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
