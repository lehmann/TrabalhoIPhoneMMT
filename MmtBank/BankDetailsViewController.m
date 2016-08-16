//
//  BankDetailsViewController.m
//  MmtBank
//
//  Created by Curcio Jamunda Sobrinho on 06/07/13.
//  Copyright (c) 2013 Curcio Jamunda Sobrinho. All rights reserved.
//

#import "BankDetailsViewController.h"
#import "Bank.h"

@interface BankDetailsViewController ()

@end

@implementation BankDetailsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (IBAction)saveBankInfo:(id)sender {
    
    Bank *bank = [Bank new];
    bank.bankNumber = [NSNumber numberWithInt:[self.textFieldBankNumber.text intValue]];
    bank.bankName = self.textFieldBankName.text;
    
    if (self.newObject) {
        [Bank addBankDataWithName:bank.bankName bcoNumber:bank.bankNumber];
    } else {
        NSNumberFormatter *f = [NSNumberFormatter new];
        [f setNumberStyle:NSNumberFormatterDecimalStyle];
        NSNumber *oldBcoNumber = [f numberFromString:self.bankNumber];
        [Bank updateBankDataWithName:bank.bankName bcoNumber:bank.bankNumber forBcoNumber:oldBcoNumber];
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}
-(void) viewWillAppear:(BOOL)animated {
    self.textFieldBankName.text=self.bankName;
    self.textFieldBankNumber.text=self.bankNumber;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}


@end
