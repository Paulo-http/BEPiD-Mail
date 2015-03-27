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
@property (weak, nonatomic) IBOutlet UITextView *assuntoTextView;

@end

@implementation MailBoxViewController
Email *emailSend;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mailBoxTextView.text = emailSend.texto;
    self.assuntoTextView.text = emailSend.assunto;
}

- (id)initWithUser:(Email *)e{
    self = [super init];
    if(self){
        emailSend = e;
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.mailBoxTextView resignFirstResponder];
    [self.assuntoTextView resignFirstResponder];
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
