//
//  ViewController.m
//  LoginFBDemo
//
//  Created by Tan Tan on 9/8/15.
//  Copyright (c) 2015 Tan Tan. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()<FBSDKLoginButtonDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //[self.btnLogin addTarget:self action:@selector(btnLoginFB:) forControlEvents:UIControlEventTouchUpInside];
    
    if ([FBSDKAccessToken currentAccessToken]) {
        NSLog(@"Token available");
        [self fetchUserInfo];
    }
    else{
        FBSDKLoginButton * loginButton = [[FBSDKLoginButton alloc] init];
        loginButton.center = self.view.center;
        loginButton.readPermissions = @[@"public_profile",@"email",@"user_friends"];
        loginButton.delegate = self;
        [self.view addSubview:loginButton];
    }
}



- (void)loginButton:(FBSDKLoginButton *)loginButton didCompleteWithResult:(FBSDKLoginManagerLoginResult *)result error:(NSError *)error{
    NSLog(@"Logged in success");
    if (error != nil) {
        NSLog(@"%@",error);
    }
    [self fetchUserInfo];
    
}


- (void)loginButtonDidLogOut:(FBSDKLoginButton *)loginButton{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)fetchUserInfo {
    if ([FBSDKAccessToken currentAccessToken]) {
        [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:@{@"fields": @"id, name"}]
         startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
             if (!error) {
                 NSLog(@"fetched user:%@", result);
             }
         }];
    }
}

- (IBAction)btnLoginFB:(id)sender{
    FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
    [login
     logInWithReadPermissions: @[@"public_profile"]
     handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
         if (error) {
             NSLog(@"Process error");
         } else if (result.isCancelled) {
             NSLog(@"Cancelled");
         } else {
             if ([result.grantedPermissions containsObject:@"email"]) {
                 [self fetchUserInfo];
             }
             NSLog(@"Logged in");
         }
     }];
}

@end
