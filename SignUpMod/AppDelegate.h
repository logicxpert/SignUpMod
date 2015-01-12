//
//  AppDelegate.h
//  SignUpMod
//
//  Created by Manoj Jonna on 14/12/14.
//  Copyright (c) 2014 Manoj Jonna. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DDMenuController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property(strong,nonatomic)UINavigationController *navmain;
@property(readwrite)BOOL isstart;

@property(strong,nonatomic)NSString *isselected;

@property(strong,nonatomic) DDMenuController *objMenuControllrer;

@property(readwrite)BOOL isEnd;






@end

