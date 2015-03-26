//
//  EmailsTableViewController.m
//  weAppLoginWebService
//
//  Created by Paulo Henrique Leite on 3/26/15.
//  Copyright (c) 2015 Humberto Vieira de Castro. All rights reserved.
//

#import "EmailsTableViewController.h"
#import "MailBoxViewController.h"
#import "Email.h"

@interface EmailsTableViewController ()

@end

@implementation EmailsTableViewController
Email *e;
NSMutableArray *arrayEmail;

- (void)viewDidLoad {
    [super viewDidLoad];
    e = [[Email alloc]init];
    NSString *username = [[NSUserDefaults standardUserDefaults] objectForKey:@"UsernameID"];
    NSLog(@"%@", username);
    arrayEmail = [e ultimosEmails:username];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return arrayEmail.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"emailSending" forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"emailSending"];
    }
    
    e = [arrayEmail objectAtIndex:indexPath.row];

    UILabel *nameLabel = (UILabel *)[cell viewWithTag:101];
    nameLabel.text = e.assunto;
    NSLog(@"%@", e.assunto);
    UILabel *emailLabel = (UILabel *)[cell viewWithTag:102];
    emailLabel.text = e.texto;
    NSLog(@"%@", e.texto);
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    self.contactUser = [users objectAtIndex:indexPath.row];
//    UIStoryboard *main = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
//    SendMailViewController *sendMail = [main instantiateViewControllerWithIdentifier:@"sendID"];
//    sendMail = [[SendMailViewController alloc]initWithUser:self.contactUser];
//    [self performSegueWithIdentifier:@"contactsSegue" sender:self];
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
