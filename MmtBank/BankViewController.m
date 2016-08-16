//
//  BankViewController.m
//  MmtBank
//
//  Created by Curcio Jamunda Sobrinho on 06/07/13.
//  Copyright (c) 2013 Curcio Jamunda Sobrinho. All rights reserved.
//

#import "BankViewController.h"
#import "BankDetailsViewController.h"

@implementation BankViewController

@synthesize tituloNavigationBar, bankTableView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(IBAction)addNovo:(id)sender {
    
    [self performSegueWithIdentifier:@"showDetailsFromBank" sender:sender];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.navigationItem.title = tituloNavigationBar;
    
    [self.bankTableView setDelegate:self];
    [self.bankTableView setDataSource:self];
   
}

-(void) viewDidAppear:(BOOL)animated {
    
    banks = [Bank returnData];
    
    [self.bankTableView reloadData];
    NSLog(@"banks =%d e contents=%@",banks.count, banks);
    //banks =(NSMutableArray *)@[@"teste1",@"teste2"];
}
#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"dentro numero rows=%d", banks.count);
    return banks.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    NSLog(@"banks dentro tablecell=%@", [banks[indexPath.row] valueForKey:@"bankNome"]);
    NSString *object = [banks[indexPath.row] valueForKey:@"bankNome"];
    cell.textLabel.text = [object description];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [banks removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"showDetailsFromBank" sender:indexPath];
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetailsFromBank"]) {
        
        BankDetailsViewController *bankControler = [segue destinationViewController];
        if ([sender isKindOfClass:[UIBarButtonItem class]]) {
           bankControler.newObject = YES;
        } else {
            NSIndexPath *indexPath = [self.bankTableView indexPathForSelectedRow];
            NSString *bankNome = [[banks[indexPath.row] valueForKey:@"bankNome"] description];
            NSString *bankNumber = [[banks[indexPath.row] valueForKey:@"bankNumber"] description];
            
            bankControler.bankNumber = bankNumber;
            bankControler.bankName = bankNome;
            bankControler.newObject = NO;
        }
    }
}

@end
