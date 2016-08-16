//
//  BankViewController.h
//  MmtBank
//
//  Created by Curcio Jamunda Sobrinho on 06/07/13.
//  Copyright (c) 2013 Curcio Jamunda Sobrinho. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Bank.h"

@interface BankViewController : UIViewController
<UITableViewDataSource, UITableViewDelegate>{
    
    IBOutlet UITableView *bankTableView;
    NSMutableArray *banks;
    
}

@property (nonatomic) NSString *tituloNavigationBar;
@property (nonatomic) IBOutlet UITableView *bankTableView;
@end
