//
//  MailBoxViewController.m
//  weAppLoginWebService
//
//  Created by Paulo Henrique Leite on 3/26/15.
//  Copyright (c) 2015 Humberto Vieira de Castro. All rights reserved.
//

#import "MailBoxViewController.h"

@interface MailBoxViewController ()
@property (weak, nonatomic) IBOutlet UITextView *mailBoxTextView;

@end

@implementation MailBoxViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.mailBoxTextView resignFirstResponder];
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
