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
#import "Email.h"

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
    
    NSInteger id_usuario_principal = [[NSUserDefaults standardUserDefaults] integerForKey:@"UserID"];
    
    Usuario *receptor = userSend;
    
    Email *e = [[Email alloc] init];
    
    e.id_usuario = (int)id_usuario_principal;
    e.id_receptor = receptor.id_usuario;
    
    e.assunto = self.assuntoTextView.text;
    e.texto = self.sendMailTextView.text;
    
    
    UIStoryboard * tela = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    SearchTableViewController * view = [tela instantiateViewControllerWithIdentifier:@"homeViewID"];
    view.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [self presentViewController:view animated:YES completion:nil];
}


@end
