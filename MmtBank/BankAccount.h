//
//  BankAccount.h
//  MmtBank
//
//  Created by André Lehmann on 02/08/13.
//  Copyright (c) 2013 Curcio Jamunda Sobrinho. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BankAccount : NSObject

@property (nonatomic, strong) NSMutableArray *accountBank;
@property (nonatomic) NSNumber *accountNumber;
@property (nonatomic) NSNumber *accountAgency;
@property (nonatomic) float accountBalance;

+(void) addAccountWithNumber: (NSNumber *)accountNumberN accountAgency:(NSNumber *)accountAgency accountBank:(NSNumber *)accountBank;
+(void) updateAccountWithNumber: (NSNumber *)accountNumberN accountAgency:(NSNumber *)accountAgencyN forAccountNumber:(NSNumber *) oldAccountNumber;
+(NSMutableArray *)returnData;

@end
