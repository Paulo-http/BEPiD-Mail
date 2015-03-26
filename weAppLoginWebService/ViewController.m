//
//  ViewController.m
//  weAppLoginWebService
//
//  Created by Humberto Vieira de Castro on 3/20/15.
//  Copyright (c) 2015 Humberto Vieira de Castro. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.usernameLabel.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"UsernameID"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


    
@end
