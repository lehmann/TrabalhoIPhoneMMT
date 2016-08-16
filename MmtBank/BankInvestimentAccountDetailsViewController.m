//
//  BankAccountDetailsViewController.m
//  MmtBank
//
//  Created by André Lehmann on 01/08/13.
//  Copyright (c) 2013 Curcio Jamunda Sobrinho. All rights reserved.
//

#import "BankInvestimentAccountDetailsViewController.h"
#import "BankInvestimentAccount.h"

@interface BankInvestimentAccountDetailsViewController ()

@end

@implementation BankInvestimentAccountDetailsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(IBAction) calcProjection:(id)sender {
    int qntdMeses = [self.textFieldQntdMeses.text intValue];
    float novoValor = [BankInvestimentAccount calculadora: self.accountBalance : self.accountPercentage :qntdMeses];
    [self.textFieldValorCalculado setText:[NSString stringWithFormat:@"%.2f", novoValor]];
}

- (IBAction)saveBankInfo:(id)sender {
    
    BankInvestimentAccount *bankAccount = [BankInvestimentAccount new];
    bankAccount.accountNumber = [NSNumber numberWithInt:[self.textFieldAccountNumber.text intValue]];
    bankAccount.accountAgency = [NSNumber numberWithInt:[self.textFieldAccountAgency.text intValue]];
    NSNumber* bankNumber = [NSNumber numberWithInt:[self.textFieldAccountBank.text intValue]];
    bankAccount.accountPercentage = [NSNumber numberWithInt:[self.textFieldAccountPercent.text floatValue]];
    
    if (self.creating) {
        [BankInvestimentAccount addAccountWithNumber:bankAccount.accountNumber accountAgency:bankAccount.accountAgency  accountBank:bankNumber accountPercentage:bankAccount.accountPercentage];
    } else {
        NSNumberFormatter *f = [NSNumberFormatter new];
        [f setNumberStyle:NSNumberFormatterDecimalStyle];
        NSNumber *oldAccountNumber = [f numberFromString:self.accountNumber];
        NSNumber *oldAccountAgency = [f numberFromString:self.accountAgency];
        [BankInvestimentAccount updateAccountWithNumber:oldAccountNumber  accountAgency:oldAccountAgency forAccountNumber:bankAccount.accountNumber forAccountAgency: bankAccount.accountAgency forAccountPercentage:bankAccount.accountPercentage];
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}

-(void) viewWillAppear:(BOOL)animated {
    
    self.textFieldAccountBank.text=self.accountBank;
    self.textFieldAccountNumber.text=self.accountNumber;
    self.textFieldAccountAgency.text=self.accountAgency;
    self.textFieldAccountBalance.text=[NSString stringWithFormat:@"%.2f", self.accountBalance];
    if(self.accountPercentage) {
        self.textFieldAccountPercent.text=[NSString stringWithFormat:@"%@", self.accountPercentage];
    }
}

@end

