//
//  EventInfoViewController.m
//  TournamentApp
//
//  Created by Manoj Jonna on 13/12/14.
//  Copyright (c) 2014 Manoj Jonna. All rights reserved.
//

#import "EventInfoViewController.h"
#import "ListTableViewCell.h"
#import "EventEditViewController.h"

@interface EventInfoViewController ()

@end

@implementation EventInfoViewController
@synthesize tbldata,lblDate,lblTitle1,lblTitle2;


- (void)viewDidLoad {
    [super viewDidLoad];
     arrayImges=[[NSMutableArray alloc]initWithObjects:@"Group-3.png",@"Group-3.png",@"Group-3.png",@"Group-3.png", nil];
    
  lblDate.font=  [UIFont fontWithName:@"Nunito-Regular" size:20.0];
    tbldata.backgroundColor= [UIColor clearColor];
    lblTitle2.font=  [UIFont fontWithName:@"Nunito-Bold" size:18.0];
    lblTitle1.font=  [UIFont fontWithName:@"Nunito-Bold" size:18.0];


    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;    //count of section
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 4;    //count number of row from counting array hear cataGorry is An Array
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.backgroundColor=[UIColor clearColor];
    
}
-(IBAction)actiononBack:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}



- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MyIdentifier = @"MyIdentifier";
    
    ListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    
    if (cell == nil)
    {
        cell = [[ListTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                        reuseIdentifier:MyIdentifier];
    }
    
    cell.imgviewPic.frame=CGRectMake(5, 5, 310, 140);
    cell.lblEventName.frame=CGRectMake(100, 30, 250,40 );
    cell.lblEventDAte.frame=CGRectMake(120, 60,230, 40);
    
    cell.imgviewPic.image=[UIImage imageNamed:[arrayImges objectAtIndex:indexPath.row]];
    
    cell.lblEventDAte.textColor=[UIColor whiteColor];
    cell.lblEventName.textColor=[UIColor whiteColor];
    
    
    
    [cell.lblEventName setFont:[UIFont fontWithName:@"Nunito-Bold" size:20.0]];
    
    [cell.lblEventDAte setFont:[UIFont fontWithName:@"Nunito-Regular" size:20.0]];
    
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
    
    
    cell.lblEventName.text=@"cricket match";
    cell.lblEventDAte.text=@"16/3/2014";
    
    // Here we use the provided setImageWithURL: method to load the web image
    // Ensure you use a placeholder image otherwise cells will be initialized with no image
    
    return cell;
}
-(IBAction)actiononINfo:(id)sender
{
    EventEditViewController *objEvent=[[EventEditViewController alloc]init];
    [self.navigationController pushViewController:objEvent animated:YES];
    
}
@end
