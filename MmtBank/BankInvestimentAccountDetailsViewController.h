//
//  BankAccountDetailsViewController.h
//  MmtBank
//
//  Created by André Lehmann on 01/08/13.
//  Copyright (c) 2013 Curcio Jamunda Sobrinho. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BankInvestimentAccountDetailsViewController : UIViewController {
   
}

@property (nonatomic)  IBOutlet UITextField *textFieldQntdMeses;
@property (nonatomic)  IBOutlet UITextField *textFieldValorCalculado;

@property (nonatomic)  IBOutlet UITextField *textFieldAccountBank;
@property (nonatomic)  IBOutlet UITextField *textFieldAccountNumber;

@property (nonatomic)  IBOutlet UITextField *textFieldAccountBalance;
@property (nonatomic)  IBOutlet UITextField *textFieldAccountAgency;
@property (nonatomic)  IBOutlet UITextField *textFieldAccountPercent;

@property (nonatomic)  NSString *accountBank, *accountNumber, *accountAgency;
@property (nonatomic)  NSNumber *accountPercentage;
@property (nonatomic)  float accountBalance;
@property (nonatomic)  BOOL creating;

- (IBAction)saveBankInfo:(id)sender;
- (IBAction)calcProjection:(id)sender;
@end
