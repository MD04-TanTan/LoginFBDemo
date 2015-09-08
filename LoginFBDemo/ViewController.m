//
//  ViewController.m
//  LoginFBDemo
//
//  Created by Tan Tan on 9/8/15.
//  Copyright (c) 2015 Tan Tan. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    FBSDKLoginButton * loginButton = [[FBSDKLoginButton alloc] init];
    loginButton.center = self.view.center;
    //loginButton.readPermissions = @[@"public_profile",@"email",@"user_friends"];
    //[loginButton addTarget:self action:@selector(btnLoginFB:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:loginButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnLoginFB:(id)sender{
    
}

@end
