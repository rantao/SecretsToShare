//
//  SecretsTableViewController.m
//  SecretsToShare
//
//  Created by Ran Tao on 8.30.12.
//  Copyright (c) 2012 Ran Tao. All rights reserved.
//

#import "SecretsTableViewController.h"
#import "CreateSecretViewController.h"
#import "ImageTableCell.h"
#import "SecretStore.h"
#import "Secret.h"

@interface SecretsTableViewController () <UITableViewDelegate,UITableViewDataSource>
@end

@implementation SecretsTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        self.title = @"Secrets to Share";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    UIBarButtonItem *addSecret = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(pushAddSecret)];
    self.navigationItem.rightBarButtonItem=addSecret;
     self.navigationItem.leftBarButtonItem = self.editButtonItem;
}

- (void) pushAddSecret {
    CreateSecretViewController *csvc = [CreateSecretViewController new];
    [self.navigationController pushViewController:csvc animated:YES];
    [self.tableView reloadData];
    
}

-(void) viewDidAppear:(BOOL)animated {
    [self.tableView reloadData];

}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    NSArray *secrets = [SecretStore allSecrets];
    return [secrets count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    static NSString *CellIdentifier = @"Cell";
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    ImageTableCell *cell = (ImageTableCell *) [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        //cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        
        //instead use custome cell
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"ImageTableCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    // Configure the cell...
    NSArray *secrets = [SecretStore allSecrets];
//    cell.textLabel.text = [[secrets objectAtIndex:[indexPath row]] entry];
//    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//    [formatter setDateFormat:@"EEEE MM.dd.yyyy 'at' hh:mm a"];
//    NSString *stringFromDate = [formatter stringFromDate:[[secrets objectAtIndex:[indexPath row]] date]];
//    cell.detailTextLabel.text = stringFromDate;
//    cell.imageView.image = [UIImage imageWithData:[[secrets objectAtIndex:[indexPath row]] imageData]];
    
    //use custom cell layout
    cell.titleLabel.text = [[secrets objectAtIndex:[indexPath section]] entry];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"EEEE MM.dd.yyyy 'at' hh:mm a"];
    NSString *stringFromDate = [formatter stringFromDate:[[secrets objectAtIndex:[indexPath section]] date]];
    cell.timeLabel.text = stringFromDate;
    cell.photo.image = [UIImage imageWithData:[[secrets objectAtIndex:[indexPath section]] imageData]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 397;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
