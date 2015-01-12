//
//  TornamenViewController.m
//  TournamentModule
//
//  Created by Manoj Jonna on 21/12/14.
//  Copyright (c) 2014 Manoj Jonna. All rights reserved.
//

#import "TornamenViewController.h"
#import "EdittournamentViewController.h"


@interface TornamenViewController ()

@end

@implementation TornamenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupHorizontalScrollView];
    
    txtNotificationMessage.delegate=self;
    txtTwitterMessage.delegate=self;
    
    lblTile.font= [UIFont fontWithName:@"Futura-Bold" size:20.0];
    
    lblSubTile.font= [UIFont fontWithName:@"Futura-Medium" size:15.0];
    lblSubTile.textColor=[UIColor colorWithRed:124/255.0 green:198/255.0 blue:228/255.0 alpha:1] ;
    
    lblTile1.font= [UIFont fontWithName:@"Futura-Bold" size:10.0];
    
    lblTile2.font= [UIFont fontWithName:@"Futura-Bold" size:10.0];
    lblTile3.font= [UIFont fontWithName:@"Futura-Bold" size:10.0];
    
    
    lblWinner1.font= [UIFont fontWithName:@"Futura-Bold" size:20.0];
    lblWinner2.font= [UIFont fontWithName:@"Futura-Bold" size:20.0];
    lblWinner3.font= [UIFont fontWithName:@"Futura-Bold" size:20.0];
    lblWinner4.font= [UIFont fontWithName:@"Futura-Bold" size:20.0];
    lblWinner5.font= [UIFont fontWithName:@"Futura-Bold" size:20.0];
    lblWinner6.font= [UIFont fontWithName:@"Futura-Bold" size:20.0];
    lblWinner7.font= [UIFont fontWithName:@"Futura-Bold" size:20.0];
    lblWinner8.font= [UIFont fontWithName:@"Futura-Bold" size:20.0];
    
    lblWinners.font= [UIFont fontWithName:@"Futura-Medium" size:15.0];
    lbllossers.font= [UIFont fontWithName:@"Futura-Medium" size:15.0];
  
    
    scrData.frame=CGRectMake(0, 302, 320, 600);
    scrData.contentSize=CGSizeMake(320, 600);
    headBg.hidden=YES;
    
    
    UISwipeGestureRecognizer *swipeup = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeup:)];
    
    // Setting the swipe direction.
    [swipeup setDirection:UISwipeGestureRecognizerDirectionUp];
    
    UISwipeGestureRecognizer* swipeUpGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipedown:)];
    swipeUpGestureRecognizer.direction = UISwipeGestureRecognizerDirectionDown;
    [self.view addGestureRecognizer:swipeUpGestureRecognizer];
    
    
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    
    
    [scrData addGestureRecognizer:swipeup];
    // Setting the swipe direction.
    [swipeLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
    imgbg.userInteractionEnabled=YES;
    
    
    // Adding the swipe gesture on image view
    [imgbg addGestureRecognizer:swipeLeft];
    
    [self.view addSubview:scrData];
    
    
    

    // Do any additional setup after loading the view from its nib.
}


- (BOOL) textViewShouldBeginEditing:(UITextView *)textView
{
    
    if(textView==txtNotificationMessage)
    {
        txtNotificationMessage.text = @"";
        txtNotificationMessage.textColor = [UIColor whiteColor];
    }
    else{
        txtTwitterMessage.text = @"";
        txtTwitterMessage.textColor = [UIColor whiteColor];
    }
    return YES;
}



-(void) textViewDidChange:(UITextView *)textView
{
    
    if(txtTwitterMessage.text.length == 0){
        txtTwitterMessage.text = @"TWITTER MESSAGE";
        txtTwitterMessage.textColor = [UIColor darkGrayColor];
        
        
        
        
        [txtTwitterMessage resignFirstResponder];
    }
    else if(txtNotificationMessage.text==0){
        txtNotificationMessage.text = @"NOTIFICATION MESSAGE";
        txtNotificationMessage.textColor = [UIColor darkGrayColor];
        [txtNotificationMessage resignFirstResponder];
    }
    
}

-(IBAction)actionONtitle:(id)sender
{
    EdittournamentViewController *objEidt=[[EdittournamentViewController alloc]init];
    [self.navigationController pushViewController:objEidt animated:YES];
    
}
-(void)viewWillDisappear:(BOOL)animated
{
    scrollView=nil;
    
}

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if([text isEqualToString:@"\n"])
    {
        [textView resignFirstResponder];
    }
    return YES;
}

-(void)handleSwipeup:(UISwipeGestureRecognizer *)swipe
{
    lblTile1.hidden=YES;
    lblTile2.hidden=YES;
    lblTile3.hidden=YES;
    viewForSwipe1.hidden=YES;
    viewForSwipe2.hidden=YES;
    imgbg.userInteractionEnabled=NO;
    headBg.hidden=NO;
    imgbg.frame=CGRectMake(0, 0, 320, 0);
    
    
    scrData.backgroundColor=[UIColor clearColor];
    scrollView.hidden=YES;
    
    
    
    scrData.frame=CGRectMake(0, 100, 320, 568);
    scrData.contentSize=CGSizeMake(320, 700);
    
    
    
}


-(void)handleSwipedown:(UISwipeGestureRecognizer *)swipe
{
    lblTile1.hidden=NO;
    lblTile2.hidden=NO;
    lblTile3.hidden=NO;
    viewForSwipe1.hidden=NO;
    viewForSwipe2.hidden=NO;
    imgbg.userInteractionEnabled=YES;
    headBg.hidden=NO;
    imgbg.frame=CGRectMake(0, 0, 320, 300);
    
    
    scrData.backgroundColor=[UIColor clearColor];
    scrollView.hidden=NO;
    [self setupHorizontalScrollView];
    
    
    
    scrData.frame=CGRectMake(0, 302, 320, 568);
    scrData.contentSize=CGSizeMake(320, 700);

}
-(void)handleSwipe:(UISwipeGestureRecognizer *)swipe {
    
    imgbg.image=[UIImage imageNamed:@"headBG2.png"];
    
    viewForSwipe1.frame=CGRectMake(0, 100, 320, 190);
    lblTile1.hidden=YES;
    lblTile2.hidden=YES;
    lblTile3.hidden=YES;
    
    
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe1:)];
    
    // Setting the swipe direction.
    [swipeLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
    
    [viewForSwipe1 addGestureRecognizer:swipeLeft];
    
    
    
    
    [self.view addSubview:viewForSwipe1];
    
    
    
  }
-(void)handleSwipe1:(UISwipeGestureRecognizer *)swipe

{
    viewForSwipe2.frame=CGRectMake(0, 100, 320, 190);
    viewForSwipe1.hidden=YES;
    
    [self.view addSubview:viewForSwipe2];


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


- (void)setupHorizontalScrollView
{
    scrollView.delegate = self;
    scrollView.backgroundColor=[UIColor clearColor];
    
    
    [scrollView setCanCancelContentTouches:NO];
    
    scrollView.indicatorStyle = UIScrollViewIndicatorStyleWhite;
    scrollView.clipsToBounds = NO;
    scrollView.scrollEnabled = YES;
    scrollView.pagingEnabled = YES;
    
    NSUInteger nimages = 0;
    NSInteger tot=0;
    CGFloat cx = 5;
    for (; ; nimages++) {
        NSString *imageName = [NSString stringWithFormat:@"image%lu.png", (nimages +1)];
        UIImage *image = [UIImage imageNamed:imageName];
        if (tot==15) {
            break;
        }
        if (4==nimages) {
            nimages=0;
        }
        
        UIImageView *imageView = [[UIImageView alloc] init];
         NSLog(@" --------- %f - %f - %f - %f", imageView.frame.origin.x, imageView.frame.origin.y, imageView.frame.size.width, imageView.frame.size.height);
        
        imageView.frame=CGRectMake(cx+nimages*80, 10, 60, 60);
        imageView.image=image;
        
        
        UILabel *lblNmae=[[UILabel alloc]init];
        lblNmae.frame=CGRectMake(5+tot*70, 65, 60, 40);
        lblNmae.text=@"Kurt Angle";
        lblNmae.font=[UIFont fontWithName:@"Futura-Medium" size:10.0];
        
        lblNmae.textAlignment=NSTextAlignmentCenter;
        
        
        lblNmae.textColor=[UIColor whiteColor];
        
        lblNmae.backgroundColor=[UIColor clearColor];
        [scrollView addSubview:lblNmae];
        
        
        
        
        CGRect rect = imageView.frame;
        rect.size.height = 60;
        rect.size.width = 60;
        rect.origin.x = cx;
        rect.origin.y = 10;
        
        imageView.frame = rect;
        imageView.tag=2;
        
        [scrollView addSubview:imageView];
        
        cx += imageView.frame.size.width+10;
        tot++;
    }
    
    [scrollView setContentSize:CGSizeMake(cx, [scrollView bounds].size.height)];
}


- (void)changeScrollBarColorFor:(UIScrollView *)scrollView
{
    for ( UIView *view in scrollView.subviews ) {
        
        if (view.tag == 0 && [view isKindOfClass:UIImageView.class])
        {
            NSLog(@" --------- %f - %f - %f - %f", view.frame.origin.x, view.frame.origin.y, view.frame.size.width, view.frame.size.height);
            
            UIImageView *imageView = (UIImageView *)view;
            
            if(imageView.tag!=2)
            {
            imageView.image=[UIImage imageNamed:@"selectedSep.png"];
            }
        }
    }
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self changeScrollBarColorFor:scrollView];
}

-(IBAction)actiononBack:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
    
}
@end
