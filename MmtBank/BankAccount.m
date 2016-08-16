//
//  BankAccount.m
//  MmtBank
//
//  Created by André Lehmann on 02/08/13.
//  Copyright (c) 2013 Curcio Jamunda Sobrinho. All rights reserved.
//

#import "BankAccount.h"
#import "Bank.h"

@implementation BankAccount

@synthesize accountNumber;
@synthesize accountAgency;
@synthesize accountBank;

static NSMutableArray *accountNovoArray;

+ (NSMutableArray*)returnData
{
    if (accountNovoArray == nil) accountNovoArray = [[NSMutableArray alloc] init];
    
    return accountNovoArray;
}

- (id)init
{
    self = [super init];
    if (self) {
        self.accountBalance = 0.0;
    }
    return self;
}

+(void) addAccountWithNumber: (NSNumber *)accountNumberN accountAgency:(NSNumber *)accountAgencyN  accountBank:(NSNumber *)accountBankN {
    
    NSLog(@"add =%@, %@ e %@", accountNumberN, accountAgencyN, accountBankN);
    
    NSMutableDictionary* bankAccount = [Bank searchBankWithNumber: accountBankN];

    NSMutableDictionary * d= [NSMutableDictionary dictionaryWithObjects:@[accountNumberN, accountAgencyN, bankAccount] forKeys:@[@"accountNumber",@"accountAgency",@"accountBank"]];
    [accountNovoArray addObject:d];
}

+(void) updateAccountWithNumber: (NSNumber *)accountNumberN accountAgency:(NSNumber *)accountAgencyN forAccountNumber:(NSNumber *) oldAccountNumber {
    
    NSLog(@"update =%@ e %@", accountNumberN, accountAgencyN);

    for (NSMutableDictionary *d in accountNovoArray) {
        NSNumber *aNumber = [d valueForKey:@"accountNumber"];
        if ([aNumber isEqualToNumber:oldAccountNumber]) {
            [d setValue:accountNumberN forKey:@"accountNumber"];
            [d setValue:accountAgencyN forKey:@"accountAgency"];
        }
    }
}

@end
