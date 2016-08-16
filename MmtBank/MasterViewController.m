//
//  MasterViewController.m
//  MmtBank
//
//  Created by Curcio Jamunda Sobrinho on 06/07/13.
//  Copyright (c) 2013 Curcio Jamunda Sobrinho. All rights reserved.
//

#import "MasterViewController.h"
#import "PersonViewController.h"


@implementation MasterViewController

- (void)awakeFromNib
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        self.clearsSelectionOnViewWillAppear = NO;
        self.contentSizeForViewInPopover = CGSizeMake(320.0, 600.0);
    }
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    _objects = [NSMutableArray array];
    
    NSString *opcaoBancos=@"Bancos";
    NSString *opcaoContas=@"Contas";
    NSString *opcaoClientes=@"Clientes";
    
    [_objects addObject:opcaoBancos];
    [_objects addObject:opcaoContas];
    [_objects addObject:opcaoClientes];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    NSString *object = _objects[indexPath.row];
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
        [_objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Indexpath for perform segue %d", indexPath.row);
    if (indexPath.row == 0) {
        [self performSegueWithIdentifier:@"showBanksFromMaster" sender:indexPath];
    } else if (indexPath.row == 1) {
        [self performSegueWithIdentifier:@"showAccountsFromMaster" sender:indexPath];
    } else if (indexPath.row == 2) {
        [self performSegueWithIdentifier:@"showPersonsFromMaster" sender:indexPath];
    }
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showBanksFromMaster"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSString *object = _objects[indexPath.row];
        BankViewController *bankControler = [segue destinationViewController];
        bankControler.tituloNavigationBar = object;
    } else if ([[segue identifier] isEqualToString:@"showAccountsFromMaster"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSString *object = _objects[indexPath.row];
        BankAccountViewController *bankControler = [segue destinationViewController];
        bankControler.titleNavigationBar = object;
    } else if ([[segue identifier] isEqualToString:@"showPersonsFromMaster"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSString *object = _objects[indexPath.row];
        PersonViewController *personControler = [segue destinationViewController];
        personControler.titleNavigationBar = object;
    }
}

@end
