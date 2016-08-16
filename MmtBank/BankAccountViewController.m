//
//  BankAccountViewController.m
//  MmtBank
//
//  Created by André Lehmann on 02/08/13.
//  Copyright (c) 2013 Curcio Jamunda Sobrinho. All rights reserved.
//

#import "BankAccountViewController.h"
#import "BankAccountDetailsViewController.h"

@implementation BankAccountViewController

@synthesize titleNavigationBar, bankAccountTableView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(IBAction)addNovo:(id)sender {
    
    [self performSegueWithIdentifier:@"showDetailsFromBankAccount" sender:sender];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.navigationItem.title = titleNavigationBar;
    
    [self.bankAccountTableView setDelegate:self];
    [self.bankAccountTableView setDataSource:self];
}

-(void) viewDidAppear:(BOOL)animated {
    
    bankAccounts = [BankAccount returnData];
    
    [self.bankAccountTableView reloadData];
    NSLog(@"BankAccounts =%d e content=%@",bankAccounts.count, bankAccounts);
}
#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"BankAccount size=%d", bankAccounts.count);
    return bankAccounts.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    NSLog(@"Bank id=%@", [bankAccounts[indexPath.row] valueForKey:@"accountNumber"]);
    NSString *object = [bankAccounts[indexPath.row] valueForKey:@"accountNumber"];
    cell.textLabel.text = [object description];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [bankAccounts removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"showDetailsFromBankAccount" sender:indexPath];
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetailsFromBankAccount"]) {
        
        BankAccountDetailsViewController *bankAccountControler = [segue destinationViewController];
        
        if ([sender isKindOfClass:[UIBarButtonItem class]]) {
            bankAccountControler.creating = YES;
        } else {
            NSLog(@"1");
            NSIndexPath *indexPath = [self.bankAccountTableView indexPathForSelectedRow];
            NSString *accountNumber = [[bankAccounts[indexPath.row] valueForKey:@"accountNumber"] description];
            NSString *accountAgency = [[bankAccounts[indexPath.row] valueForKey:@"accountAgency"] description];
            NSLog(@"2");
            NSMutableArray *accountBank = [bankAccounts[indexPath.row] valueForKey:@"accountBank"];
            
            NSLog(@"3");
            bankAccountControler.accountNumber = accountNumber;
            bankAccountControler.accountAgency = accountAgency;
            NSLog(@"4");
            bankAccountControler.accountBank = [[accountBank valueForKey:@"bankNumber"] description];
            bankAccountControler.creating = NO;
            NSLog(@"5");
        }
    }
}

@end
