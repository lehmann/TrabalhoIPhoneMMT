//
//  BankAccountDetailsViewController.h
//  MmtBank
//
//  Created by André Lehmann on 01/08/13.
//  Copyright (c) 2013 Curcio Jamunda Sobrinho. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BankAccountDetailsViewController : UIViewController {
    
}

@property (nonatomic)  IBOutlet UITextField *textFieldAccountNumber;

@property (nonatomic)  IBOutlet UITextField *textFieldAccountAgency;
@property (nonatomic)  IBOutlet UITextField *textFieldAccountBank;

@property (nonatomic)  NSString *accountNumber, *accountAgency, *accountBank;
@property (nonatomic)  BOOL creating;

- (IBAction)saveBankInfo:(id)sender;
@end
