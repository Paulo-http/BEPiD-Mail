//
//  ContatosTableViewController.m
//  weAppLoginWebService
//
//  Created by Paulo Henrique Leite on 3/23/15.
//  Copyright (c) 2015 Humberto Vieira de Castro. All rights reserved.
//

#import "ContatosTableViewController.h"
#import "Usuario.h"
#import "sendMailViewController.h"

@interface ContatosTableViewController ()
@end

@implementation ContatosTableViewController
NSMutableArray *users;
Usuario *new;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    new = [[Usuario alloc]init];
    users = [new retornaUsuarios];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    Usuario *new = [[Usuario alloc]init];
    NSMutableArray *users = [[NSMutableArray alloc]init];
    users = [new retornaUsuarios];
   
    return users.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Contatos" forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Contatos"];
    }
     new = [users objectAtIndex:indexPath.row];
     UILabel *nameLabel = (UILabel *)[cell viewWithTag:101];
     nameLabel.text = new.user;
     UILabel *emailLabel = (UILabel *)[cell viewWithTag:102];
     emailLabel.text = new.email;
    NSLog(@"%ld", indexPath.row);
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    self.contactUser = [users objectAtIndex:indexPath.row];
    NSLog(@"%@", self.contactUser.email);
    UIStoryboard *main = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
    
    sendMailViewController *sendMail = [main instantiateViewControllerWithIdentifier:@"sendID"];
    sendMail = [[sendMailViewController alloc]initWithUser:self.contactUser];
    //sendMailViewController *sendMail2 = [[sendMailViewController alloc]initWithUser:self.contactUser];
    //sendMail2 = [main instantiateViewControllerWithIdentifier:@"sendID"];
    //[self presentViewController:sendMail2 animated:YES completion:nil];
    //[self presentModalViewController:sendMail2 animated:YES];
    [self performSegueWithIdentifier:@"mailSegue" sender:self];


}

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
