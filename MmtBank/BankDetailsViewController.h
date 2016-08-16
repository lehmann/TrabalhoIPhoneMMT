//
//  BankDetailsViewController.h
//  MmtBank
//
//  Created by Curcio Jamunda Sobrinho on 06/07/13.
//  Copyright (c) 2013 Curcio Jamunda Sobrinho. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BankDetailsViewController : UIViewController {
    
}

@property (nonatomic)  IBOutlet UITextField *textFieldBankName, *textFieldBankNumber;

@property (nonatomic)  NSString *bankName, *bankNumber;
@property (nonatomic)  BOOL newObject;

- (IBAction)saveBankInfo:(id)sender;
@end
