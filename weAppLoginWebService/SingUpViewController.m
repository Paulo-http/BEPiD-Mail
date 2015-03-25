//
//  SingUpViewController.m
//  weAppLoginWebService
//
//  Created by Paulo Henrique Leite on 3/23/15.
//  Copyright (c) 2015 Humberto Vieira de Castro. All rights reserved.
//

#import "SingUpViewController.h"
#import "Usuario.h"

@interface SingUpViewController ()
//  SingUp TextFields
@property (weak, nonatomic) IBOutlet UITextField *userNameSingUp;
@property (weak, nonatomic) IBOutlet UITextField *passwordSingUp;
@property (weak, nonatomic) IBOutlet UITextField *confirmSingUp;
@property (weak, nonatomic) IBOutlet UITextField *nickNameSingUp;
@property (weak, nonatomic) IBOutlet UITextField *userEmailSingUp;

//  SingUp Labels
@property (weak, nonatomic) IBOutlet UILabel *notificationSingUp;
@end

@implementation SingUpViewController

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.userNameSingUp resignFirstResponder];
    [self.passwordSingUp resignFirstResponder];
    [self.confirmSingUp resignFirstResponder];
    [self.nickNameSingUp resignFirstResponder];
    [self.userEmailSingUp resignFirstResponder];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)SingUpUser:(id)sender {
    Usuario *new = [[Usuario alloc]init];
    if([self.passwordSingUp.text isEqual:self.confirmSingUp.text] && ![self.userNameSingUp.text isEqual:@""] && ![self.passwordSingUp.text isEqual:@""] && ![self.userEmailSingUp.text isEqualToString:@""]) {
        
        new.user = self.userNameSingUp.text;
        new.senha = self.passwordSingUp.text;
        new.apelido = self.nickNameSingUp.text;
        new.email = self.userEmailSingUp.text;
        
        [new insereUsuario: new];
        
        UIStoryboard * tela = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        SingUpViewController * view = [tela instantiateViewControllerWithIdentifier:@"homeView"];
        view.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
        [self presentViewController:view animated:YES completion:nil];
        
    } else {
        
        self.notificationSingUp.text = @"Enter all data to continue!";
    }
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
