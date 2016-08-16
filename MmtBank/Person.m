//
//  Person.m
//  MmtBank
//
//  Created by André Lehmann on 01/08/13.
//  Copyright (c) 2013 Curcio Jamunda Sobrinho. All rights reserved.
//

#import "Person.h"

@implementation Person

@synthesize personName;
@synthesize personSurname;
@synthesize personPhone;
@synthesize personEmail;
@synthesize personArray;

static NSMutableArray *personNovoArray;

+ (NSMutableArray*)returnData
{
    if (personNovoArray == nil) {
        personNovoArray = [[NSMutableArray alloc] init];
    }
    return personNovoArray;
}

- (id)init
{
    self = [super init];
    if (self) {
        personArray =  [[NSMutableArray alloc] init];
        
    }
    return self;
}

+(void) addPersonDataWithName: (NSString *)personNameS personLastName:(NSString *)personLastNameS personPhone:(NSString *) personPhoneS personEmail:(NSString *) personEmailS personPhoto:(UIImage *) personPhotoS {
    
    NSLog(@"add =%@ e %@", personNameS, personLastNameS);
    NSMutableDictionary * d= [NSMutableDictionary dictionaryWithObjects:@[personNameS, personLastNameS, personPhoneS, personEmailS, personPhotoS] forKeys:@[@"personName",@"personSurname", @"personPhone", @"personEmail", @"personPhoto"]];
    [personNovoArray addObject:d];
}

+(void) updatePersonWithName: (NSString *)personNameS personLastName:(NSString *)personLastNameS personPhone:(NSString *) personPhoneS personEmail:(NSString *) personEmailS oldPersonName :(NSString *)oldPersonNameS oldPersonLastName :(NSString *)oldPersonLastNameS{
    
    NSLog(@"update =%@ e %@", oldPersonNameS, oldPersonLastNameS);
    
    for (NSMutableDictionary *d in personNovoArray) {
        NSString *aName = [d valueForKey:@"personName"];
        NSString *aLastName = [d valueForKey:@"personSurname"];
        if ([aName isEqualToString:oldPersonNameS] &&
                   [aLastName isEqualToString:oldPersonLastNameS]) {
            [d setValue:personNameS forKey:@"personName"];
            [d setValue:personLastNameS forKey:@"personSurname"];
            [d setValue:personPhoneS forKey:@"personPhone"];
            [d setValue:personEmailS forKey:@"personEmail"];
        }
    }
}


@end
