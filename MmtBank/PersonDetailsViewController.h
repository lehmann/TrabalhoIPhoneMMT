//
//  PersonDetailsViewController.h
//  MmtBank
//
//  Created by Andre Lehmann on 03/08/13.
//  Copyright (c) 2013 Curcio Jamunda Sobrinho. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PersonDetailsProtocol <NSObject>

-(void) closeEdit: (id)sender;
-(void) setData:(NSMutableDictionary*) dictionary;

@end

@interface PersonDetailsViewController : UIViewController <UITextFieldDelegate, UIActionSheetDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, PersonDetailsProtocol> {
    
}

@property (nonatomic)  IBOutlet UITextField *textFieldPersonName;
@property (nonatomic)  IBOutlet UITextField *textFieldPersonSurname;
@property (nonatomic)  IBOutlet UITextField *textFieldPersonNumber;
@property (nonatomic)  IBOutlet UITextField *textFieldPersonEmail;
@property (nonatomic)  IBOutlet UIImageView *imageViewPersonPhoto;

@property (nonatomic)  NSString *personName, *personSurname, *personPhone, *personEmail;
@property (nonatomic)  UIImage *personPhoto;
@property (nonatomic)  BOOL creating;

- (IBAction)savePersonInfo:(id)sender;
@property id <PersonDetailsProtocol> delegate;
@end
