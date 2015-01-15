//
//  LoginViewController.m
//  SignUpMod
//
//  Created by Manoj Jonna on 14/12/14.
//  Copyright (c) 2014 Manoj Jonna. All rights reserved.
//

#import "LoginViewController.h"
#import "SignupviewController.h"

#import "UserLoginViewController.h"
@interface LoginViewController ()

@end

@implementation LoginViewController
@synthesize lblText1,lblText2,lblText3,lblTitle,btnLogin,btnSIngUp,btnUseaasGuest,btn1,btn2,btn3,btn4,btn5,imgWelcome;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    pageVIewCont.frame = CGRectMake(pageVIewCont.frame.origin.x, pageVIewCont.frame.origin.y, pageVIewCont.frame.size.width+10, pageVIewCont.frame.size.height+10);
    arrayforImages = [[NSMutableArray alloc]initWithObjects:@"screen1.png",@"screen2.png",@"screen3.png",@"screen4.png",@"screen5.png", nil];
    
    int x=0;
    [pageVIewCont setNumberOfPages:5];
    UIImageView *imgForScrolls;
    for ( int i=0; i<5; i++)
    {
        imgForScrolls  = [[UIImageView alloc]initWithFrame:CGRectMake(x, 0, 200, 220)];
        [imgForScrolls setImage:[UIImage imageNamed:[arrayforImages objectAtIndex:i]]];
        [scrollView addSubview:imgForScrolls];
        x=x+200;
    }
    [scrollView setContentSize:CGSizeMake(x, 200)];
    
  lblTitle.font=  [UIFont fontWithName:@"Nunito-Bold" size:15.0];
    lblText1.font=[UIFont fontWithName:@"Nunito-Regular" size:9.0];
    lblText2.font=[UIFont fontWithName:@"Nunito-Regular" size:9.0];
    lblText3.font=[UIFont fontWithName:@"Nunito-Regular" size:9.0];
    lbl1frame=lblText1.frame;
    lbl2frame=lblText2.frame;
    lbl3frame=lblText3.frame;


    
    btnLogin.titleLabel.font=[UIFont fontWithName:@"Nunito-Light" size:17.0];
    btnSIngUp.titleLabel.font=[UIFont fontWithName:@"Nunito-Light" size:17.0];

    btnUseaasGuest.titleLabel.font=[UIFont fontWithName:@"Nunito-Light" size:17.0];

   
    
    //btnLogin setFont:[UIFont fontWithName:@"Futura-Medium" size:11.0];
    // Do any additional setup after loading the view from its nib.
}


-(void)viewWillAppear:(BOOL)animated
{
    i=0;
    
   timer = [NSTimer scheduledTimerWithTimeInterval: 4.0
                                                  target: self
                                                selector:@selector(onTick:)
                                                userInfo: nil repeats:YES];
  
   
}

-(void)viewWillDisappear:(BOOL)animated
{
    [timer invalidate];
    
}

-(void)onTick:(id)sender
{
    i++;
    float width=i*200;
    if(i<5)
    {
   [scrollView setContentOffset:CGPointMake(width,0) animated:YES];
    }
    else{
        i=0;
        float width=i*200;
        [scrollView setContentOffset:CGPointMake(width,0) animated:YES];
    }
    
    
    
}
-(IBAction)actiononSignup:(id)sender
{
    SignupviewController *objSignup=[[SignupviewController alloc]init];
    [self.navigationController pushViewController:objSignup animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)actiononButton1:(UIButton*)sender
{
    imgWelcome.image=[UIImage imageNamed:@"screen1.png"];
   
    
    [sender setBackgroundImage:[UIImage imageNamed:@"selectedBullet.png"] forState:UIControlStateNormal];;
    [btn2 setBackgroundImage:[UIImage imageNamed:@"bullet.png"] forState:UIControlStateNormal];;
    [btn3 setBackgroundImage:[UIImage imageNamed:@"bullet.png"] forState:UIControlStateNormal];;
    [btn4 setBackgroundImage:[UIImage imageNamed:@"bullet.png"] forState:UIControlStateNormal];;
    [btn5 setBackgroundImage:[UIImage imageNamed:@"bullet.png"] forState:UIControlStateNormal];;
    
    
    
    
    
}

-(IBAction)actiononButton2:(UIButton*)sender
{
    imgWelcome.image=[UIImage imageNamed:@"screen2.png"];
   

    [sender setBackgroundImage:[UIImage imageNamed:@"selectedBullet.png"] forState:UIControlStateNormal];;
     [btn1 setBackgroundImage:[UIImage imageNamed:@"bullet.png"] forState:UIControlStateNormal];;
     [btn3 setBackgroundImage:[UIImage imageNamed:@"bullet.png"] forState:UIControlStateNormal];;
     [btn4 setBackgroundImage:[UIImage imageNamed:@"bullet.png"] forState:UIControlStateNormal];;
    [btn5 setBackgroundImage:[UIImage imageNamed:@"bullet.png"] forState:UIControlStateNormal];;
    
    
    
    
    
}
-(IBAction)actiononButton3:(UIButton*)sender
{
    imgWelcome.image=[UIImage imageNamed:@"screen3.png"];
    
    
    
    
    [sender setBackgroundImage:[UIImage imageNamed:@"selectedBullet.png"] forState:UIControlStateNormal];;
    [btn1 setBackgroundImage:[UIImage imageNamed:@"bullet.png"] forState:UIControlStateNormal];;
    [btn2 setBackgroundImage:[UIImage imageNamed:@"bullet.png"] forState:UIControlStateNormal];;
    [btn4 setBackgroundImage:[UIImage imageNamed:@"bullet.png"] forState:UIControlStateNormal];;
    [btn5 setBackgroundImage:[UIImage imageNamed:@"bullet.png"] forState:UIControlStateNormal];;
    
    
    
    
    
}
-(IBAction)actiononButton4:(UIButton*)sender
{
    imgWelcome.image=[UIImage imageNamed:@"screen4.png"];
    
    
    
    
    
    [sender setBackgroundImage:[UIImage imageNamed:@"selectedBullet.png"] forState:UIControlStateNormal];;
    [btn1 setBackgroundImage:[UIImage imageNamed:@"bullet.png"] forState:UIControlStateNormal];;
    [btn2 setBackgroundImage:[UIImage imageNamed:@"bullet.png"] forState:UIControlStateNormal];;
    [btn3 setBackgroundImage:[UIImage imageNamed:@"bullet.png"] forState:UIControlStateNormal];;
    [btn5 setBackgroundImage:[UIImage imageNamed:@"bullet.png"] forState:UIControlStateNormal];;
    
    
    
    
    
}
-(IBAction)actiononLogin:(id)sender
{
    UserLoginViewController *objlogin=[[UserLoginViewController alloc]init];
    [self.navigationController pushViewController:objlogin animated:YES];
    
}
-(IBAction)actiononButton5:(UIButton*)sender
{
    imgWelcome.image=[UIImage imageNamed:@"screen5.png"];
   
    
    
    
    
    [sender setBackgroundImage:[UIImage imageNamed:@"selectedBullet.png"] forState:UIControlStateNormal];;
    [btn1 setBackgroundImage:[UIImage imageNamed:@"bullet.png"] forState:UIControlStateNormal];;
    [btn2 setBackgroundImage:[UIImage imageNamed:@"bullet.png"] forState:UIControlStateNormal];;
    [btn3 setBackgroundImage:[UIImage imageNamed:@"bullet.png"] forState:UIControlStateNormal];;
    [btn4 setBackgroundImage:[UIImage imageNamed:@"bullet.png"] forState:UIControlStateNormal];;
    
    
    
    
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    int pageNumber = scrollView.contentOffset.x/200;
    
    
    if (pageNumber==0)
    {
        lblTitle.text=@"FOLLOW YOUR HEART";
        lblText1.text=@"Follow your friends,TO's or favoritre  players to see";
        lblText2.text=@"when they are playing next and track their";
        lblText3.text=@"tournament  progress and placements.";
        
        lblText1.font=[UIFont fontWithName:@"Nunito-Regular" size:9];
        lblText3.font=[UIFont fontWithName:@"Nunito-Regular" size:9];
        lblText2.font=[UIFont fontWithName:@"Nunito-Regular" size:9];
    }
    else if (pageNumber==1)
    {
        lblTitle.text=@"Key Features";
        lblText3.text=@"";
        lblText1.font=[UIFont fontWithName:@"Nunito-Regular" size:9];
        lblText3.font=[UIFont fontWithName:@"Nunito-Regular" size:9];
        lblText2.font=[UIFont fontWithName:@"Nunito-Regular" size:9];
        
        lblText1.text=@"Create,edit,and view seasons,events,teams&tournaments";
        lblText2.text=@"of any kind or any platform online or offline";
    }
    else if(pageNumber==2)
    {
        lblTitle.text=@"GET NOTIFICATIONS";
        lblText1.text=@"Get notifications on upcoming events or even in";
        lblText2.text=@"tournament notifications right before a match starts on your";
        lblText1.font=[UIFont fontWithName:@"Nunito-Regular" size:9];
        lblText3.font=[UIFont fontWithName:@"Nunito-Regular" size:9];
        lblText2.font=[UIFont fontWithName:@"Nunito-Regular" size:9];
        lblText3.text=@"phone,tablet,Android wear device,or Apple Watch";
       
    }
    else if(pageNumber==3)
    {
        lblTitle.text=@"PRE-REGISTER";
        
        lblText1.text=@"Preregister yourself, a team,or specific members of a team";
        lblText2.text=@"for any tournament";
        lblText1.font=[UIFont fontWithName:@"Nunito-Regular" size:9];
        lblText3.font=[UIFont fontWithName:@"Nunito-Regular" size:9];
        lblText2.font=[UIFont fontWithName:@"Nunito-Regular" size:9];
        lblText3.text=@"";;
    }
    else if(pageNumber==4)
    {
        lblTitle.text=@"POOLS & BRACKETS";
        lblText1.font=[UIFont fontWithName:@"Nunito-Regular" size:9];
        lblText3.font=[UIFont fontWithName:@"Nunito-Regular" size:9];
        lblText2.font=[UIFont fontWithName:@"Nunito-Regular" size:9];
        lblText1.text=@"Automatic bracket making based on, Seeding, Teams,";
        lblText2.text=@"and locations.";
        lblText3.text=@"";
    }
    
    [pageVIewCont setCurrentPage:pageNumber];
}

@end
