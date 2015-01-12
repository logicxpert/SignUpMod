//
//  AddStaffViewController.m
//  TournamentApp
//
//  Created by Manoj Jonna on 19/12/14.
//  Copyright (c) 2014 Manoj Jonna. All rights reserved.
//

#import "AddStaffViewController.h"
#import "AddStaffTableViewCell.h"



@interface AddStaffViewController ()

@end

@implementation AddStaffViewController
@synthesize tblData,lblTitle;


- (void)viewDidLoad {
    [super viewDidLoad];
    tblData.delegate=self;
    tblData.dataSource=self;
    self.txtSearch.delegate=self;
    lblTitle.font=[UIFont fontWithName:@"Futura-Medium" size:18.0];
    
    
    
    tblData.backgroundColor=[UIColor clearColor];
    
    
    // Do any additional setup after loading the view from its nib.
}
-(IBAction)actiononBack:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
    
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

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.backgroundColor=[UIColor clearColor];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 10;    //count number of row from counting array hear cataGorry is An Array
}



- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MyIdentifier = @"MyIdentifier";
    
    AddStaffTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    
    if (cell == nil)
    {
        cell = [[AddStaffTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                       reuseIdentifier:MyIdentifier] ;
    }
    
    cell.imgProfilepic.frame=CGRectMake(20, 5, 60,60 );
    cell.lblName.frame=CGRectMake(100 , 10, 200, 30);
    cell.lblnickname.frame=CGRectMake(100, 30, 200, 30);
    cell.lblName.textColor=[UIColor whiteColor];
    
    
    
    cell.imgProfilepic.image=[UIImage imageNamed:@"Group-1-copy-3.png"];
    cell.lblName.text=@"John Cena";
    
    cell.lblnickname.font=   [UIFont fontWithName:@"FuturaTEELig" size:17.0];
    cell.lblName.font=   [UIFont fontWithName:@"FuturaTEELig" size:13.0];
    cell.lblnickname.textColor= [UIColor colorWithRed:124/255.0 green:198/255.0 blue:228/255.0 alpha:1];
    
    cell.lblnickname.text=@"@rkorton";
    
    
    // Here we use the provided setImageWithURL: method to load the web image
    // Ensure you use a placeholder image otherwise cells will be initialized with no image
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 75;
    
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
    
}
@end
