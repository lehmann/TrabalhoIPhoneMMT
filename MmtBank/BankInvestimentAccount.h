//
//  BankAccount.h
//  MmtBank
//
//  Created by André Lehmann on 02/08/13.
//  Copyright (c) 2013 Curcio Jamunda Sobrinho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BankAccount.h"

@interface BankInvestimentAccount : BankAccount

@property (nonatomic) NSNumber *accountPercentage;

+(void) addAccountWithNumber: (NSNumber *)accountNumberN accountAgency:(NSNumber *)accountAgency accountBank:(NSNumber *)accountBank accountPercentage:(NSNumber *)accountPercentage;
+(void) updateAccountWithNumber: (NSNumber *)oldAccountNumber accountAgency:(NSNumber *)oldAccountAgency forAccountNumber:(NSNumber *) accountNumberN
               forAccountAgency:(NSNumber *)accountAgencyN forAccountPercentage:(NSNumber*)accountPercentageN;
+(NSMutableArray *)returnData;

+(float) calculadora: (float) saldo : (NSNumber*) percentual :(int) meses;
-(void) calcular;

@end
