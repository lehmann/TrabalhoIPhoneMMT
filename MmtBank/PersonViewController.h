//
//  PersonViewController.h
//  MmtBank
//
//  Created by Andre Lehmann on 03/08/13.
//  Copyright (c) 2013 Curcio Jamunda Sobrinho. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"
#import "PersonDetailsViewController.h"

@interface PersonViewController : UIViewController
<UITableViewDataSource, UITableViewDelegate, PersonDetailsProtocol>{
    
    NSMutableArray *persons;
    IBOutlet UITableView *tableView;
    
}

@property (nonatomic) NSString *titleNavigationBar;
@property (nonatomic)  IBOutlet UITableView *tableView;
@end
