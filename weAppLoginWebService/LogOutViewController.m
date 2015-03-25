//
//  LogOutViewController.m
//  weAppLoginWebService
//
//  Created by Paulo Henrique Leite on 3/25/15.
//  Copyright (c) 2015 Humberto Vieira de Castro. All rights reserved.
//

#import "LogOutViewController.h"

@interface LogOutViewController ()

@end

@implementation LogOutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIStoryboard * tela = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UINavigationController * view = [tela instantiateViewControllerWithIdentifier:@"rootID"];
    view.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [self presentViewController:view animated:YES completion:nil];
    
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

@end
