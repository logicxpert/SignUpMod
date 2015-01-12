//
//  SplashViewController.m
//  SignUpMod
//
//  Created by Manoj Jonna on 14/12/14.
//  Copyright (c) 2014 Manoj Jonna. All rights reserved.
//

#import "SplashViewController.h"
#import "LoginViewController.h"

@interface SplashViewController ()

@end

@implementation SplashViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden=YES;
    // Do any additional setup after loading the view from its nib.
}
-(void)viewWillAppear:(BOOL)animated

{
    [self performSelector:@selector(moveNext:) withObject:nil afterDelay:3.0];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    self.navigationController.navigationBarHidden=YES;
    // Dispose of any resources that can be recreated.
}
-(void)moveNext:(id)sender
{
    LoginViewController *objSpalsh=[[LoginViewController alloc]init];
    [self.navigationController pushViewController:objSpalsh animated:objSpalsh];
    
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
