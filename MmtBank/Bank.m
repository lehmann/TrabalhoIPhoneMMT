//
//  Bank.m
//  MmtBank
//
//  Created by Curcio Jamunda Sobrinho on 06/07/13.
//  Copyright (c) 2013 Curcio Jamunda Sobrinho. All rights reserved.
//

#import "Bank.h"

@implementation Bank

@synthesize bankName;
@synthesize bankNumber;
@synthesize bankArray;

static NSMutableArray *bankNovoArray;

+ (NSMutableArray*)returnData
{
    if (bankNovoArray == nil) bankNovoArray = [[NSMutableArray alloc] init];
    
    return bankNovoArray;
}

- (id)init
{
    self = [super init];
    if (self) {
          bankArray =  [[NSMutableArray alloc] init];
        
    }
    return self;
}

+(void) addBankDataWithName: (NSString *)bankNameS bcoNumber:(NSNumber *)bankNumberN{
    
    NSLog(@"add =%@ e %@", bankNumberN, bankNameS);
    NSMutableDictionary * d= [NSMutableDictionary dictionaryWithObjects:@[bankNameS, bankNumberN] forKeys:@[@"bankNome",@"bankNumber"]];
    [bankNovoArray addObject:d];
}

+(void) updateBankDataWithName: (NSString *)bankNameS bcoNumber:(NSNumber *)bankNumberN forBcoNumber: (NSNumber *) oldBcoNumber {
    
    NSLog(@"update =%@ e %@", bankNumberN, bankNameS);
    for (NSMutableDictionary *d in bankNovoArray) {
        NSNumber *bNumber = [d valueForKey:@"bankNumber"];
        if ([bNumber isEqualToNumber:oldBcoNumber]) {
            [d setValue:bankNameS forKey:@"bankNome"];
            [d setValue:bankNumberN forKey:@"bankNumber"];
        }
    }
}
+(NSMutableDictionary*) searchBankWithNumber: (NSNumber *)bankNumberN {
    for (NSMutableDictionary *d in bankNovoArray) {
        NSNumber *bNumber = [d valueForKey:@"bankNumber"];
        if ([bNumber isEqualToNumber:bankNumberN]) {
            return d;
        }
    }
    return nil;
}

@end
