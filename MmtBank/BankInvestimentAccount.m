//
//  BankAccount.m
//  MmtBank
//
//  Created by André Lehmann on 02/08/13.
//  Copyright (c) 2013 Curcio Jamunda Sobrinho. All rights reserved.
//

#import "BankInvestimentAccount.h"
#import "Bank.h"

@implementation BankInvestimentAccount: BankAccount

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
        //put your crap here
    }
    return self;
}

+(float)calculadora: (float) saldo : (NSNumber*) percentual :(int)meses {
    float ret = saldo;
    for (int i = 0; i < meses; i++) {
        ret += (ret * [percentual floatValue]);
    }
    return ret;
}
-(void) calcular {
    self.accountBalance = [BankInvestimentAccount calculadora:self.accountBalance : self.accountPercentage :1];
}

+(void) addAccountWithNumber: (NSNumber *)accountNumberN accountAgency:(NSNumber *)accountAgencyN accountBank:(NSNumber *)accountBankN accountPercentage:(NSNumber *)accountPercentageN {
    
    NSLog(@"add =%@, %@, %@ e %@", accountNumberN, accountAgencyN,accountBankN, accountPercentageN);
    
    NSMutableDictionary* bankAccount = [Bank searchBankWithNumber: accountBankN];
    NSMutableDictionary * d= [NSMutableDictionary dictionaryWithObjects:@[accountNumberN, accountAgencyN, bankAccount, accountPercentageN] forKeys:@[@"accountNumber",@"accountAgency",@"accountBank",@"accountPercentage"]];
    [accountNovoArray addObject:d];
}

+(void) updateAccountWithNumber: (NSNumber *)oldAccountNumber accountAgency:(NSNumber *)oldAccountAgency forAccountNumber:(NSNumber *) accountNumberN
           forAccountAgency:(NSNumber *)accountAgencyN forAccountPercentage:(NSNumber*)accountPercentageN {
    
    NSLog(@"update =%@, %@ e %@", accountNumberN, accountAgencyN, accountPercentageN);

    for (NSMutableDictionary *d in accountNovoArray) {
        NSNumber *aNumber = [d valueForKey:@"accountNumber"];
        NSNumber *aAgency = [d valueForKey:@"accountAgency"];
        if ([aNumber isEqualToNumber:oldAccountNumber] &&
            [aAgency isEqualToNumber:oldAccountAgency]) {
            [d setValue:accountNumberN forKey:@"accountNumber"];
            [d setValue:accountAgencyN forKey:@"accountAgency"];
            [d setValue:accountPercentageN forKey:@"accountPercentage"];
        }
    }
}

@end
