//
//  SearchTableViewController.m
//  weAppLoginWebService
//
//  Created by Laurana Franco on 26/03/15.
//  Copyright (c) 2015 Humberto Vieira de Castro. All rights reserved.
//

#import "SearchTableViewController.h"
#import "SendMailViewController.h"
#import "Usuario.h"

@import UIKit;

@interface SearchTableViewController ()
@property (weak, nonatomic) IBOutlet UISearchBar *searchTableView;

@end



@implementation SearchTableViewController
Usuario *new;
NSMutableArray *users;

- (void)viewDidLoad {
    [super viewDidLoad];
    new = [[Usuario alloc]init];
    users = [new retornaUsuarios];
    self.searchTableView.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.searchTableView resignFirstResponder];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return users.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SearchContacts" forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"SearchContacts"];
    }
    new = [users objectAtIndex:indexPath.row];
    UILabel *nameSearch = (UILabel *)[cell viewWithTag:101];
    nameSearch.text = new.user;
    UILabel *emailSearch = (UILabel *)[cell viewWithTag:102];
    emailSearch.text = new.email;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.contactUser = [users objectAtIndex:indexPath.row];
    UIStoryboard *main = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
    SendMailViewController *sendMail = [main instantiateViewControllerWithIdentifier:@"sendID"];
    sendMail = [[SendMailViewController alloc]initWithUser:self.contactUser];
    [self performSegueWithIdentifier:@"searchSegue" sender:self];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [users removeAllObjects];
    users = [new buscaUsuariosPorNome:self.searchTableView.text];
    [((UITableView *)self.view) reloadData];
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
