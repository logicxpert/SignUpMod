//
//  SelectTimeViewController.m
//  TournamentModule
//
//  Created by Manoj Jonna on 21/12/14.
//  Copyright (c) 2014 Manoj Jonna. All rights reserved.
//

#import "SelectTimeViewController.h"


@interface SelectTimeViewController ()

@end

@implementation SelectTimeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    arrayAm=[[NSMutableArray alloc]initWithObjects:@"AM",@"PM", nil];
    arrayHours=[[NSMutableArray alloc]initWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12", nil];
    arryMinutes=[[NSMutableArray alloc]initWithObjects:@"05",@"10",@"15",@"20",@"25",@"30",@"35",@"40",@"45",@"50",@"55",@"00", nil];
    


    [tblview1 setContentSize:CGSizeMake(100, 3000)];
    [tblbview2 setContentSize:CGSizeMake(100, 3000)];
    
    tblview1.showsVerticalScrollIndicator=NO;
    tblbview2.showsVerticalScrollIndicator=NO;
    tblview3.showsVerticalScrollIndicator=NO;
    

    
    
    tblbview2.delegate=self;
    tblbview2.dataSource=self;
    tblview1.dataSource=self;
    tblview1.dataSource=self;
    tblview3.delegate=self;
    tblview3.delegate=self;
    
    
  
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.backgroundColor=[UIColor clearColor];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if(tableView==tblview1)
    {
        return  100;
        
    }
    else if (tableView==tblbview2)
    {
        return  100;
        
    }
    else{
        return [arrayAm count];
        
    }
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault   reuseIdentifier:CellIdentifier ];
    
    }
    cell.textLabel.textColor=[UIColor whiteColor];
    
    
    if(tableView==tblview1)
    {
    
        
        if(indexPath.row<[arrayHours count])
        {
             cell.textLabel.text = [arrayHours objectAtIndex:indexPath.row];
        }
        else{
            long k=indexPath.row%[arrayHours count];
            cell.textLabel.text=[arrayHours objectAtIndex:k];
        }
   
    }
    else if(tableView==tblbview2)
    {
        if(indexPath.row<[arryMinutes count])
        {
            cell.textLabel.text = [arryMinutes objectAtIndex:indexPath.row];
        }
        else{
            long k=indexPath.row%[arrayHours count];
            cell.textLabel.text=[arryMinutes objectAtIndex:k];
        }
        
    }
    else{
        cell.textLabel.text=[arrayAm objectAtIndex:indexPath.row];
        
    }
    
    return cell;
}

@end
  
