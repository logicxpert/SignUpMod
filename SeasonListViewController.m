//
//  SeasonListViewController.m
//  SignUpMod
//
//  Created by Admin on 11/01/15.
//  Copyright (c) 2015 Manoj Jonna. All rights reserved.
//

#import "SeasonListViewController.h"
#import "HudView.h"
#import "AppDelegate.h"
#import "ListTableViewCell.h"
#import "CreateSesonViewController.h"
#import "SeasoninfoViewController.h"



@interface SeasonListViewController ()
{
    HudView *aHUD;
    
}

@end

@implementation SeasonListViewController
@synthesize tblList;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden=YES;
    
    tblList.delegate=self;
    tblList.dataSource=self;
    tblList.backgroundColor=[UIColor clearColor];
    
    arrayImges=[[NSMutableArray alloc]initWithObjects:@"Group-3.png",@"Group-3.png",@"Group-3.png",@"Group-3.png", nil];
    arrayData=[[NSMutableArray alloc]init];
    
    
    
    
    // Do any additional setup after loading the view from its nib.
}

- (void) killHUD{
    if(aHUD != nil ){
        [aHUD.loadingView removeFromSuperview];
        [self.view setUserInteractionEnabled:YES];
        
        aHUD = nil;
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    }
}
- (void) showHUD{
    if(aHUD == nil){
        aHUD = [[HudView alloc]init];
        aHUD.tag=5555;
        [aHUD loadingViewInView:self.view text:@"Please Wait..."];
        [aHUD setUserInteractionEnabledForSuperview:self.view.superview];
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    }
}

-(void)viewWillAppear:(BOOL)animated
{
    [tblList reloadData];
    
    
//    [self showHUD];
//    
//    
//    
//    [self performSelector:@selector(callservice) withObject:nil afterDelay:0.5];
    
}

-(void)callservice

{
    
    NSMutableArray *ParamName=[[NSMutableArray alloc]initWithObjects:@"empty", nil];
    
    
    // NSMutableArray *ParamValue=[[NSMutableArray alloc]initWithObjects:array,array,[[NSUserDefaults standardUserDefaults]valueForKey:@"StartTimeStamp"],array,@"false",txtEvtname.text,[[NSUserDefaults standardUserDefaults]valueForKey:@"EndTimeStamp"], nil];
    
    NSMutableArray *ParamValue=[[NSMutableArray alloc]initWithObjects:@"false",nil];
    
    
    NSMutableString *paramString=[NSMutableString stringWithFormat:@"{\"%@\":\"%@\"",[ParamName objectAtIndex:0],[ParamValue  objectAtIndex:0]];
    int i = 1;
    while (i<[ParamName count]) {
        NSString *temStr=[NSString stringWithFormat:@",\"%@\":\"%@\"",[ParamName objectAtIndex:i],[ParamValue  objectAtIndex:i]];
        [paramString appendString:temStr];
        i++;
    }
    
    
    NSString *bodyStr = [NSString stringWithFormat:@"%@}",paramString];
    
    
    bodyStr = [bodyStr stringByReplacingOccurrencesOfString:@"\"(" withString:@"["];
    
    bodyStr = [bodyStr stringByReplacingOccurrencesOfString:@")\"" withString:@"]"];
    
    bodyStr = [bodyStr stringByReplacingOccurrencesOfString:@"\"[" withString:@"["];
    bodyStr = [bodyStr stringByReplacingOccurrencesOfString:@"]\"" withString:@"]"];
    bodyStr = [bodyStr stringByReplacingOccurrencesOfString:@"\\" withString:@""];
    bodyStr = [bodyStr stringByReplacingOccurrencesOfString:@"\"{" withString:@"{"];
    bodyStr = [bodyStr stringByReplacingOccurrencesOfString:@"}\"" withString:@"}"];
    
    
    
    NSMutableURLRequest *mRequest = [[NSMutableURLRequest alloc]
                                     initWithURL:[NSURL URLWithString:[NSString
                                                                       stringWithFormat:@"http://54.68.218.212:8080/tournamentapis/web/srf/services/main/event/state/all?empty=false"]]];
    
    
    NSData* data = [bodyStr dataUsingEncoding:NSUTF8StringEncoding];
    // [//mRequest setHTTPBody:data];
    // [mRequest setValue:@"application/json" forHTTPHeaderField:@"content-type"];
    
    
    [mRequest setValue:@"application/json" forHTTPHeaderField:@"content-type"];
    [mRequest setValue:[[NSUserDefaults standardUserDefaults]valueForKey:@"authkey"] forHTTPHeaderField:@"AUTH-KEY"];
    
    [mRequest setHTTPMethod:@"GET"];
    
    NSURLResponse *response = nil;
    NSError *error = nil;
    NSData *responseData1  = [NSURLConnection sendSynchronousRequest:mRequest returningResponse:&response error:&error];
    
    
    
    if (error!=nil) {
        //[delegate getResponse:error]; // commented on 20august
        // NSLog(@" %@",error);
        //return;zzzllljmdjnfusdnfosdful
    }
    NSString *responseString = [[NSString alloc]initWithData:responseData1 encoding:NSUTF8StringEncoding];
    
    responseString = [responseString stringByReplacingOccurrencesOfString:@"\\" withString:@""];
    if ([responseString hasPrefix:@"\""])
    {
        responseString = [responseString substringFromIndex:1];
    } if ([responseString hasSuffix:@"\""])
    {
        responseString = [responseString substringToIndex:[responseString length]-1];
        
    }
    
    NSDictionary *json=  [NSJSONSerialization JSONObjectWithData:responseData1 options:0 error:&error];
    
    [self killHUD];
    
    arrayData =[json valueForKey:@"list"];
    
    if ([arrayData count]>0) {
        [tblList reloadData];
    }
    else{
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Warning" message:@"No Events" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles: nil];
        [alert show];
        
    }
    
    
    
    
    NSLog(@"dsfg=%@",responseString);
}
-(IBAction)actiononAdd:(id)sender
{
   CreateSesonViewController *objCreate=[[CreateSesonViewController alloc]init];
    
    AppDelegate *app=(AppDelegate *)[UIApplication sharedApplication].delegate;
    [app.navmain pushViewController:objCreate animated:YES];

    
    
      [self.navigationController pushViewController:objCreate animated:YES];
    
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
    
    return 5;   //count number of row from counting array hear cataGorry is An Array
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.backgroundColor=[UIColor clearColor];
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MyIdentifier = @"MyIdentifier";
    
    ListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[NSString stringWithFormat:@"%d",indexPath.row]];
    
    if (cell == nil)
    {
        cell = [[ListTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                        reuseIdentifier:MyIdentifier];
    }
    
    cell.imgviewPic.frame=CGRectMake(5, 5, 310, 140);
    cell.lblEventName.frame=CGRectMake(0, 30, 320,40 );
    cell.lblEventDAte.frame=CGRectMake(0, 60,320, 40);
    
    cell.lblEventName.textAlignment=NSTextAlignmentCenter;
    cell.lblEventDAte.textAlignment=NSTextAlignmentCenter;
    
    
    cell.imgviewPic.image=[UIImage imageNamed:@"Group-3.png"];
    
    cell.lblEventDAte.textColor=[UIColor whiteColor];
    cell.lblEventName.textColor=[UIColor whiteColor];
    
    [cell.lblEventName setFont:[UIFont fontWithName:@"Futura-Bold" size:20.0]];
    
    [cell.lblEventDAte setFont:[UIFont fontWithName:@"Futura-Normal" size:20.0]];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
    
        cell.lblEventName.text=@"Cricket World cup";
   
    
    
    ;    cell.lblEventDAte.text=@"2014-2015";
    
    // Here we use the provided setImageWithURL: method to load the web image
    // Ensure you use a placeholder image otherwise cells will be initialized with no image
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    SeasoninfoViewController *obj=[[SeasoninfoViewController alloc]init];
    [self.navigationController pushViewController:obj animated:YES];
    
//    EventInfoViewController *objEventInfo=[[EventInfoViewController alloc]init];
//    AppDelegate *app=(AppDelegate *)[UIApplication sharedApplication].delegate;
//    
//    
//    [app.navmain pushViewController:objEventInfo animated:YES];
    
}
@end
