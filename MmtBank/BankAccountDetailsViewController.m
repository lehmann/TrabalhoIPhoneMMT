//
//  BankAccountDetailsViewController.m
//  MmtBank
//
//  Created by André Lehmann on 01/08/13.
//  Copyright (c) 2013 Curcio Jamunda Sobrinho. All rights reserved.
//

#import "BankAccountDetailsViewController.h"
#import "BankAccount.h"
#import "Bank.h"

@interface BankAccountDetailsViewController ()

@end

@implementation BankAccountDetailsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (IBAction)saveBankInfo:(id)sender {
    
    BankAccount *bankAccount = [BankAccount new];
    bankAccount.accountNumber = [NSNumber numberWithInt:[self.textFieldAccountNumber.text intValue]];
    bankAccount.accountAgency = [NSNumber numberWithInt:[self.textFieldAccountAgency.text intValue]];
    
    NSNumber* bankNumber = [NSNumber numberWithInt:[self.textFieldAccountBank.text intValue]];
    
    NSMutableDictionary* bank = [Bank searchBankWithNumber: bankNumber];
    bankAccount.accountBank = bank;
    
    if (self.creating) {
        [BankAccount addAccountWithNumber:bankAccount.accountNumber accountAgency:bankAccount.accountAgency accountBank:bankNumber  ];
    } else {
        NSNumberFormatter *f = [NSNumberFormatter new];
        [f setNumberStyle:NSNumberFormatterDecimalStyle];
        NSNumber *oldAccountNumber = [f numberFromString:self.accountNumber];
        [BankAccount updateAccountWithNumber:bankAccount.accountNumber  accountAgency:bankAccount.accountAgency forAccountNumber:oldAccountNumber];
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}
-(void) viewWillAppear:(BOOL)animated {
    
    NSLog(@"6");
    self.textFieldAccountNumber.text=self.accountNumber;
    self.textFieldAccountAgency.text=self.accountAgency;
    self.textFieldAccountBank.text=self.accountBank;
    NSLog(@"7");
}

@end

