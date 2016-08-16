//
//  Person.h
//  MmtBank
//
//  Created by André Lehmann on 01/08/13.
//  Copyright (c) 2013 Curcio Jamunda Sobrinho. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (nonatomic, strong) NSMutableArray *personArray;
@property (nonatomic) NSString *personName;
@property (nonatomic) NSString *personSurname;
@property (nonatomic) NSString *personPhone;
@property (nonatomic) NSString *personEmail;
@property (nonatomic) UIImage *personPhoto;

+(void) addPersonDataWithName: (NSString *)personNameS personLastName:(NSString *)personLastNameS personPhone:(NSString *) personPhoneS personEmail:(NSString *) personEmailS personPhoto:(UIImage *) personPhotoS;
+(void) updatePersonWithName: (NSString *)personNameS personLastName:(NSString *)personLastNameS personPhone:(NSString *) personPhoneS personEmail:(NSString *) personEmailS oldPersonName :(NSString *)oldPersonNameS oldPersonLastName :(NSString *)oldPersonLastNameS;
+(NSMutableArray *)returnData;

@end
