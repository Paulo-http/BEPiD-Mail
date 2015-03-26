//
//  SignInViewController.m
//  weAppLoginWebService
//
//  Created by Paulo Henrique Leite on 3/23/15.
//  Copyright (c) 2015 Humberto Vieira de Castro. All rights reserved.
//

#import "SignInViewController.h"
#import "Usuario.h"

@interface SignInViewController ()

//  textfield SingIn View
@property (weak, nonatomic) IBOutlet UITextField *userNameSingIn;
@property (weak, nonatomic) IBOutlet UITextField *passwordSingIn;

//  buttons SingIn View
@property (weak, nonatomic) IBOutlet UIButton *continueSingIn;

@end

@implementation SignInViewController

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.userNameSingIn resignFirstResponder];
    [self.passwordSingIn resignFirstResponder];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)SingInUser:(id)sender {
    Usuario *new = [[Usuario alloc]init];
    NSMutableArray *users = [[NSMutableArray alloc]init];
    users = [new retornaUsuarios];
    for(int i=0; i<users.count; i++) {
        new = [users objectAtIndex:i];
        if([self.userNameSingIn.text isEqual: new.user] && [self.passwordSingIn.text isEqual: new.senha]) {
            UIStoryboard *tela = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            SignInViewController *view = [tela instantiateViewControllerWithIdentifier:@"homeViewID"];
            view.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
            [self presentViewController:view animated:YES completion:nil];
        }
    }
}

@end
