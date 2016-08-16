//
//  BankAccountViewController.m
//  MmtBank
//
//  Created by André Lehmann on 02/08/13.
//  Copyright (c) 2013 Curcio Jamunda Sobrinho. All rights reserved.
//

#import "BankInvestimentAccountViewController.h"
#import "BankInvestimentAccountDetailsViewController.h"

@implementation BankInvestimentAccountViewController

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
    [self performSegueWithIdentifier:@"showDetailsFromBankInvestimentAccount" sender:sender];
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
    bankAccounts = [BankInvestimentAccount returnData];
    
    [self.bankAccountTableView reloadData];
    NSLog(@"BankInvestimentAccounts =%d e content=%@",bankAccounts.count, bankAccounts);
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"BankInvestimentAccounts size=%d", bankAccounts.count);
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
    [self performSegueWithIdentifier:@"showDetailsFromBankInvestimentAccount" sender:indexPath];
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetailsFromBankInvestimentAccount"]) {
        
        BankInvestimentAccountDetailsViewController *bankAccountControler = [segue destinationViewController];
        
        NSLog(@"PRE-PA-RA %@", sender);
        if ([sender isKindOfClass:[UIBarButtonItem class]]) {
            bankAccountControler.creating = YES;
        } else {
            NSIndexPath *indexPath = [self.bankAccountTableView indexPathForSelectedRow];
            NSString *accountNumber = [[bankAccounts[indexPath.row] valueForKey:@"accountNumber"] description];
            NSString *accountAgency = [[bankAccounts[indexPath.row] valueForKey:@"accountAgency"] description];
            float accountBalance = [[bankAccounts[indexPath.row] valueForKey:@"accountBalance"] floatValue];
            NSNumber *accountPercentage = [bankAccounts[indexPath.row] valueForKey:@"accountPercentage"];
            NSMutableArray *accountBank = [bankAccounts[indexPath.row] valueForKey:@"accountBank"];
            
            bankAccountControler.accountNumber = accountNumber;
            bankAccountControler.accountAgency = accountAgency;
            bankAccountControler.accountPercentage = accountPercentage;
            bankAccountControler.accountBalance = accountBalance;
            bankAccountControler.accountBank = [[accountBank valueForKey:@"bankNumber"] description];
            bankAccountControler.creating = NO;
        }
    }
}

@end
