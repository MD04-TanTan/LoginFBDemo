//
//  ViewController.h
//  LoginFBDemo
//
//  Created by Tan Tan on 9/8/15.
//  Copyright (c) 2015 Tan Tan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet FBSDKLoginButton * loginButton;
@property (weak, nonatomic) IBOutlet UIButton *btnLogin;

@end

