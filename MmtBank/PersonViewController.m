//
//  PersonViewController.m
//  MmtBank
//
//  Created by Andre Lehmann on 03/08/13.
//  Copyright (c) 2013 Curcio Jamunda Sobrinho. All rights reserved.
//

#import "PersonViewController.h"
#import "PersonDetailsViewController.h"

#define ALog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)

@interface PersonViewController ()

@end

@implementation PersonViewController

@synthesize titleNavigationBar;
@synthesize tableView;

-(void) closeEdit:(id)sender {
    NSLog(@"closeEdit");
    [self.navigationController popViewControllerAnimated:YES];
}

-(void) setData:(NSMutableDictionary *)dictionary {
    NSLog(@"setData");
    persons = [Person returnData];
    [self.tableView reloadData];
}

-(IBAction)addNovo:(id)sender {
    [self performSegueWithIdentifier:@"showDetailsFromPerson" sender:sender];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.navigationItem.title = titleNavigationBar;
    [self.tableView setDelegate:self];
    [self.tableView setDataSource:self];
}

-(void) viewDidAppear:(BOOL)animated {
    persons = [Person returnData];
    
    [self.tableView reloadData];
    NSLog(@"pessoas =%d e contents=%@",persons.count, persons);
}
#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"dentro numero rows=%d", persons.count);
    return persons.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)_tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    NSLog(@"pessoas dentro tablecell=%@", [persons[indexPath.row] valueForKey:@"personName"]);
    NSString *object = [persons[indexPath.row] valueForKey:@"personName"];
    cell.textLabel.text = [object description];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)tableView:(UITableView *)_tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [persons removeObjectAtIndex:indexPath.row];
        [_tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"showDetailsFromPerson" sender:indexPath];
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetailsFromPerson"]) {
        
        PersonDetailsViewController *personControler = [segue destinationViewController];
        if ([sender isKindOfClass:[UIBarButtonItem class]]) {
            personControler.creating = YES;
        } else {
            NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
            NSString *personName = [[persons[indexPath.row] valueForKey:@"personName"] description];
            NSString *personSurname = [[persons[indexPath.row] valueForKey:@"personSurname"] description];
            NSString *personPhone = [[persons[indexPath.row] valueForKey:@"personPhone"] description];
            NSString *personEmail = [[persons[indexPath.row] valueForKey:@"personEmail"] description];
            UIImage *personPhoto = [persons[indexPath.row] valueForKey:@"personPhoto"];
            
            personControler.personName = personName;
            personControler.personSurname = personSurname;
            personControler.personPhone = personPhone;
            personControler.personEmail = personEmail;
            personControler.personPhoto = personPhoto;
            personControler.creating = NO;
        }
    }
}

@end
