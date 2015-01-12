//
//  EventlistViewController.m
//  TournamentApp
//
//  Created by Manoj Jonna on 13/12/14.
//  Copyright (c) 2014 Manoj Jonna. All rights reserved.
//

#import "TournamentlistViewController.h"
#import "ListTableViewCell.h"
#import "AppDelegate.h"
#import "CreateTournamentViewController.h"
#import "TornamenViewController.h"


@interface TournamentlistViewController ()

@end

@implementation TournamentlistViewController
@synthesize tblList;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden=YES;
    
    tblList.delegate=self;
    tblList.dataSource=self;
    
      tblList.backgroundColor=[UIColor clearColor];
    
  AppDelegate *app=(AppDelegate *)[UIApplication sharedApplication].delegate;
    
    app.objMenuControllrer.delegate=self;
    
    
    
    
//    for (UIGestureRecognizer *recognizer in app.objMenuControllrer.view.gestureRecognizers) {
//        
//        if([recognizer isKindOfClass:[UITapGestureRecognizer class]]) {
//            [app.objMenuControllrer.view removeGestureRecognizer:recognizer];
//            [app.objMenuControllrer.tap requireGestureRecognizerToFail:recognizer];
//        }
//        
//        if([recognizer isKindOfClass:[UIPanGestureRecognizer class]]) {
//            [app.objMenuControllrer.pan requireGestureRecognizerToFail:recognizer];
//        }
//    }
    
    arrayImges=[[NSMutableArray alloc]initWithObjects:@"Group-3.png",@"Group-3.png",@"Group-3.png",@"Group-3.png", nil];
    
    
    
    // Do any additional setup after loading the view from its nib.
}


- (void)pan:(UIPanGestureRecognizer*)gesture
{
    NSLog(@"dfg");
    
}


-(IBAction)actiononMenu:(id)sender
{
    
    AppDelegate *app=(AppDelegate *)[UIApplication sharedApplication].delegate;
    //    MenuViewController *menu=[[MenuViewController alloc]init];
    //    app.objMenuControllrer.leftViewController=menu;
    //    [app.objMenuControllrer showLeft:nil];
    //    ContactViewController *objMneu=[[ContactViewController alloc]init];
    //
    //    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:objMneu];
    //
    //    MenuViewController *mneu=[[MenuViewController alloc]init];
    //
    //
    //    DDMenuController *rootController = [[DDMenuController alloc] initWithRootViewController:navController];
    //    menuController = rootController;
    //    menuController.leftViewController=mneu;
    //    [rootController showLeftController:YES];
    
    
    for(int i=0; i<[app.navmain.viewControllers count]; i++)
    {
        if([[app.navmain.viewControllers objectAtIndex:i]isKindOfClass:[DDMenuController class]])
        {
            DDMenuController *ddObj=[app.navmain.viewControllers objectAtIndex:i];
            [ddObj showLeft:nil];
        }
    }
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
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


- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
     NSString *MyIdentifier = @"MyIdentifier";
    
    ListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    
    if (cell == nil)
    {
        cell = [[ListTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                       reuseIdentifier:MyIdentifier];
    }
    
    cell.imgviewPic.frame=CGRectMake(5, 5, 310, 140);
    cell.lblEventName.frame=CGRectMake(0, 30, 320,40 );
    cell.lblEventDAte.frame=CGRectMake(0, 55,320, 40);
    
    cell.imgviewPic.image=[UIImage imageNamed:[arrayImges objectAtIndex:indexPath.row]];
    
    cell.lblEventDAte.textColor=[UIColor whiteColor];
    cell.lblEventName.textColor=[UIColor whiteColor];
    
    [cell.lblEventName setFont:[UIFont fontWithName:@"Futura-Bold" size:18.0]];

      [cell.lblEventDAte setFont:[UIFont fontWithName:@"Futura-Medium" size:15.0]];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
    cell.lblEventDAte.textAlignment=NSTextAlignmentCenter;
    cell.lblEventName.textAlignment=NSTextAlignmentCenter;
    cell.btnClose.frame=CGRectMake(210, 7, 100, 136);
    [cell.btnClose setImage:[UIImage imageNamed:@"closePanel.png"] forState:UIControlStateNormal];
    
    
    
   
    UISwipeGestureRecognizer* gestureR;
    gestureR = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeFrom:)];
    gestureR.direction = UISwipeGestureRecognizerDirectionLeft;
    UISwipeGestureRecognizer* gestureL;
    gestureL = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    gestureL.direction = UISwipeGestureRecognizerDirectionRight;
                
    cell.tag=indexPath.row;
    
    [cell addGestureRecognizer:gestureL];
    [cell addGestureRecognizer:gestureR];
    cell.lblEventName.text=@"FIFA WORLD CUP";
    cell.lblEventDAte.text=@"2014";
    
    // Here we use the provided setImageWithURL: method to load the web image
    // Ensure you use a placeholder image otherwise cells will be initialized with no image
   
    return cell;
}



-(void)handleSwipe:(UISwipeGestureRecognizer *)sender
{
    
    NSIndexPath *myIP = [NSIndexPath indexPathForRow:sender.view.tag inSection:0];
    //Type cast it to CustomCell
    ListTableViewCell *cell = (ListTableViewCell*)[tblList cellForRowAtIndexPath:myIP];
    [UIView animateWithDuration:0.6 animations:^{
        
        cell.imgviewPic.frame=CGRectMake(5, 5, 310, 140);
        
    }];

}

-(void)handleSwipeFrom:(UISwipeGestureRecognizer*)sender
{
    
    
    NSIndexPath *myIP = [NSIndexPath indexPathForRow:sender.view.tag inSection:0];
    //Type cast it to CustomCell
    ListTableViewCell *cell = (ListTableViewCell*)[tblList cellForRowAtIndexPath:myIP];
    [UIView animateWithDuration:0.6 animations:^{
        
        cell.imgviewPic.frame=CGRectMake(-105, 5, 310, 140);
        
    }];

}

-(IBAction)actiononAdd:(id)sender
{
    CreateTournamentViewController *obj=[[CreateTournamentViewController alloc]init];
    [self.navigationController pushViewController:obj animated:YES];
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
 TornamenViewController *objEventInfo=[[TornamenViewController alloc]init];
[self.navigationController pushViewController:objEventInfo animated:YES];
    
}


@end
