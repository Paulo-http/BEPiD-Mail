//
//  SendMailViewController.m
//  weAppLoginWebService
//
//  Created by Paulo Henrique Leite on 3/25/15.
//  Copyright (c) 2015 Humberto Vieira de Castro. All rights reserved.
//

#import "SendMailViewController.h"
#import "ContactsTableViewController.h"

@interface SendMailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *contactLabel;
@property (weak, nonatomic) IBOutlet UILabel *nomeLabel;

@end

@implementation SendMailViewController
Usuario *userSend;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.contactLabel.text = userSend.email;
    self.nomeLabel.text = userSend.user;
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
    self.contactLabel.text = userSend.email;
}

- (IBAction)showEmail:(id)sender {
    NSLog(@"Falta enviar o email!");
}


@end
