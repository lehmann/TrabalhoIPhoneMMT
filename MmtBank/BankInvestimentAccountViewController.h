//
//  BankAccountViewController.h
//  MmtBank
//
//  Created by André Lehmann on 02/08/13.
//  Copyright (c) 2013 Curcio Jamunda Sobrinho. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BankInvestimentAccount.h"

@interface BankInvestimentAccountViewController : UIViewController
<UITableViewDataSource, UITableViewDelegate>{
    
    IBOutlet UITableView *bankAccountTableView;
    NSMutableArray *bankAccounts;
    
}

@property (nonatomic) NSString *titleNavigationBar;
@property (nonatomic) IBOutlet UITableView *bankAccountTableView;
@end
