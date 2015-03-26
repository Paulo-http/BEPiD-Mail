//
//  SendMailViewController.m
//  weAppLoginWebService
//
//  Created by Paulo Henrique Leite on 3/25/15.
//  Copyright (c) 2015 Humberto Vieira de Castro. All rights reserved.
//

#import "SendMailViewController.h"
#import "ContactsTableViewController.h"
#import "SearchTableViewController.h"

@interface SendMailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *contactLabel;
@property (weak, nonatomic) IBOutlet UILabel *nomeLabel;
@property (weak, nonatomic) IBOutlet UITextView *sendMailTextView;
@property (weak, nonatomic) IBOutlet UITextView *assuntoTextView;

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

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.sendMailTextView resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    self.contactLabel.text = userSend.email;
}

- (IBAction)showEmail:(id)sender {
    NSLog(@"%@", self.assuntoTextView.text);
    NSLog(@"%@", self.sendMailTextView.text);
    UIStoryboard * tela = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    SearchTableViewController * view = [tela instantiateViewControllerWithIdentifier:@"homeViewID"];
    view.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [self presentViewController:view animated:YES completion:nil];
}


@end
