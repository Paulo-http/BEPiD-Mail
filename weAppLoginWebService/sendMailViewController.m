//
//  sendMailViewController.m
//  weAppLoginWebService
//
//  Created by Paulo Henrique Leite on 3/25/15.
//  Copyright (c) 2015 Humberto Vieira de Castro. All rights reserved.
//

#import "sendMailViewController.h"
#import "ContatosTableViewController.h"

@interface sendMailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *contactLabel;

@end

@implementation sendMailViewController
Usuario *userSend;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.contactLabel.text = userSend.email;
    // Do any additional setup after loading the view.
}


- (id)initWithUser:(Usuario *)u {
    self = [super init];
    if(self){
        userSend = u;
    }
    return self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    self.contactLabel.text = userSend.email;
}

- (IBAction)showEmail:(id)sender {
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
