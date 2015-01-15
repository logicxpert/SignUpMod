//
//  MenuViewController.m
//  SignUpMod
//
//  Created by Manoj on 28/12/14.
//  Copyright (c) 2014 Manoj Jonna. All rights reserved.
//

#import "MenuViewController.h"
#import "EventlistViewController.h"
#import "AppDelegate.h"
#import "TournamentlistViewController.h"
#import "SeasonListViewController.h"
#import "LoginViewController.h"

@interface MenuViewController ()

@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    btnEvents.titleLabel.font=[UIFont fontWithName:@"Nunito-Regular" size:20.0];
    btnFollowing.titleLabel.font=[UIFont fontWithName:@"Nunito-Regular" size:20.0];

    btnLogout.titleLabel.font=[UIFont fontWithName:@"Nunito-Regular" size:20.0];
    btnMyteams.titleLabel.font=[UIFont fontWithName:@"Nunito-Regular" size:20.0];
    btnSeasons.titleLabel.font=[UIFont fontWithName:@"Nunito-Regular" size:20.0];
    btnSettings.titleLabel.font=[UIFont fontWithName:@"Nunito-Regular" size:20.0];
    btnSynctoServver.titleLabel.font=[UIFont fontWithName:@"Nunito-Regular" size:20.0];
    btntournamnets.titleLabel.font=[UIFont fontWithName:@"Nunito-Regular" size:20.0];
    lblName.font=[UIFont fontWithName:@"Nunito-Regular" size:20.0];
    lblteamName.font=[UIFont fontWithName:@"Nunito-Regular" size:20.0];
    lblteamName.textColor=[UIColor colorWithRed:124/255.0 green:198/255.0 blue:228/255.0 alpha:1];
    
    [btnEvents setTitleColor:[UIColor colorWithRed:170/255.0 green:170/255.0 blue:170/255.0 alpha:1] forState:UIControlStateNormal];
    [btnFollowing setTitleColor:[UIColor colorWithRed:170/255.0 green:170/255.0 blue:170/255.0 alpha:1] forState:UIControlStateNormal];
    [btnLogout setTitleColor:[UIColor colorWithRed:170/255.0 green:170/255.0 blue:170/255.0 alpha:1] forState:UIControlStateNormal];
    [btnMyteams setTitleColor:[UIColor colorWithRed:170/255.0 green:170/255.0 blue:170/255.0 alpha:1] forState:UIControlStateNormal];
    [btnSeasons setTitleColor:[UIColor colorWithRed:170/255.0 green:170/255.0 blue:170/255.0 alpha:1] forState:UIControlStateNormal];
    [btnSettings setTitleColor:[UIColor colorWithRed:170/255.0 green:170/255.0 blue:170/255.0 alpha:1] forState:UIControlStateNormal];
    [btntournamnets setTitleColor:[UIColor colorWithRed:170/255.0 green:170/255.0 blue:170/255.0 alpha:1] forState:UIControlStateNormal];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated

{
    lblName.text=[[NSUserDefaults standardUserDefaults]valueForKey:@"username"];
    
}
-(IBAction)actiononEvent:(id)sender


{
    EventlistViewController *objCOntact=[[EventlistViewController alloc]init];
    AppDelegate *app=(AppDelegate *)[UIApplication sharedApplication].delegate;
    
    UINavigationController *nav1 = [[UINavigationController alloc]initWithRootViewController:objCOntact];
    [app.objMenuControllrer setRootController:nav1 animated:YES];
}


-(IBAction)actionOntourna:(id)sender
{
    TournamentlistViewController *objCOntact=[[TournamentlistViewController alloc]init];
    AppDelegate *app=(AppDelegate *)[UIApplication sharedApplication].delegate;
    
    UINavigationController *nav1 = [[UINavigationController alloc]initWithRootViewController:objCOntact];
    [app.objMenuControllrer setRootController:nav1 animated:YES];

}

-(IBAction)actiononSeasons:(id)sender
{
//    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Message" message:@"Coming soon" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil];
//    [alert show];
    SeasonListViewController *objCOntact=[[SeasonListViewController alloc]init];
    AppDelegate *app=(AppDelegate *)[UIApplication sharedApplication].delegate;
    
    UINavigationController *nav1 = [[UINavigationController alloc]initWithRootViewController:objCOntact];
    [app.objMenuControllrer setRootController:nav1 animated:YES];
    
}
-(IBAction)actiononMyteams:(id)sender
{
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Message" message:@"Coming soon" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil];
    [alert show];
    

}
-(IBAction)actioonlogout:(id)sender
{
//    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Message" message:@"Coming soon" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil];
//    [alert show];
//
    
    AppDelegate *app=(AppDelegate *)[UIApplication sharedApplication].delegate;
    
    NSArray *array=app.navmain.viewControllers;
    
    for (int i=0; i<[array count]; i++) {
        if([[array objectAtIndex:i]isKindOfClass:[LoginViewController class]])
        {
            [app.navmain popToViewController:[array objectAtIndex:i] animated:YES];
            
        }
    }
    



}
-(IBAction)actiononsetting:(id)sender
{
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Message" message:@"Coming soon" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil];
    [alert show];
    

}
-(IBAction)actioonFollowing:(id)sender
{
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Message" message:@"Coming soon" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil];
    [alert show];
    

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
@end
