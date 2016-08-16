//
//  Bank.h
//  MmtBank
//
//  Created by Curcio Jamunda Sobrinho on 06/07/13.
//  Copyright (c) 2013 Curcio Jamunda Sobrinho. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Bank : NSObject

@property (nonatomic, strong) NSMutableArray *bankArray;
@property (nonatomic) NSString *bankName;
@property (nonatomic) NSNumber *bankNumber;

+(void) addBankDataWithName: (NSString *)bankNameS bcoNumber:(NSNumber *)bankNumberN;
+(void) updateBankDataWithName: (NSString *)bankNameS bcoNumber:(NSNumber *)bankNumberN forBcoNumber: (NSNumber *) oldBcoNumber;
+(NSMutableDictionary*) searchBankWithNumber: (NSNumber *)bankNumberN;
+(NSMutableArray *)returnData;

@end
