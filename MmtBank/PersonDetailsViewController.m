//
//  PersonDetailsViewController.m
//  MmtBank
//
//  Created by Andre Lehmann on 03/08/13.
//  Copyright (c) 2013 Curcio Jamunda Sobrinho. All rights reserved.
//

#import "PersonDetailsViewController.h"
#import "Person.h"

#define ALog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)

@interface PersonDetailsViewController ()

@end

@implementation PersonDetailsViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

#pragma make - delegates do
-(void) closeEdit: (id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void) setData:(NSMutableDictionary*) dictionary {
    [dictionary enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        if([key isEqualToString:@"email"]) {
            self.textFieldPersonEmail.text = [obj description];
        } else if([key isEqualToString:@"nome"]) {
            self.textFieldPersonName.text = [obj description];
        } else if([key isEqualToString:@"sobrenome"])  {
            self.textFieldPersonSurname.text = [obj description];
        } else if([key isEqualToString:@"telefone"])  {
            self.textFieldPersonNumber.text = [obj description];
        }
    }];
}

-(IBAction)cancelAndClose:(id)sender {
    [self.delegate closeEdit:sender];
}
- (IBAction)savePersonInfo:(id)sender {
    Person *person = [Person new];
    person.personPhone = self.textFieldPersonNumber.text;
    person.personName = self.textFieldPersonName.text;
    person.personSurname = self.textFieldPersonSurname.text;
    person.personEmail = self.textFieldPersonEmail.text;
    person.personPhoto = self.imageViewPersonPhoto.image;
    
    if (self.creating) {
        [Person addPersonDataWithName:person.personName personLastName:person.personSurname personPhone:person.personPhone personEmail:person.personEmail personPhoto:person.personPhoto];
    } else {
        NSNumberFormatter *f = [NSNumberFormatter new];
        [f setNumberStyle:NSNumberFormatterDecimalStyle];
        NSString* oldPersonName = self.personName;
        NSString* oldPersonSurname = self.personSurname;
        [Person updatePersonWithName:person.personName personLastName:person.personSurname personPhone:person.personPhone personEmail:person.personEmail oldPersonName:oldPersonName oldPersonLastName:oldPersonSurname];
    }
    if(self.delegate) {
        NSMutableDictionary* dict = [NSMutableDictionary new];
        [dict setObject:person.personName forKey:@"nome"];
        [dict setObject:person.personSurname forKey:@"sobrenome"];
        [dict setObject:person.personEmail forKey:@"email"];
        [dict setObject:person.personPhone forKey:@"telefone"];
        [self.delegate setData:dict];
    }
    
    [self.delegate closeEdit:sender];
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField {
    NSLog(@"textFieldShouldReturn %@", self.textFieldPersonName.text);
    if(textField == self.textFieldPersonName) {
        [self.textFieldPersonSurname becomeFirstResponder];
    }
    if(textField == self.textFieldPersonSurname) {
        [self.textFieldPersonNumber becomeFirstResponder];
    }
    if(textField == self.textFieldPersonNumber) {
        [self.textFieldPersonEmail becomeFirstResponder];
    }
    if(textField == self.textFieldPersonEmail) {
        [self savePersonInfo: self];
    }
    return TRUE;
}

-(void) viewWillAppear:(BOOL)animated {
    self.textFieldPersonName.text=self.personName;
    self.textFieldPersonSurname.text=self.personSurname;
    self.textFieldPersonNumber.text=self.personPhone;
    self.textFieldPersonEmail.text=self.personEmail;
    if (self.personPhoto) {
        self.imageViewPersonPhoto.image=self.personPhoto;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.textFieldPersonName.delegate = self;
    self.textFieldPersonSurname.delegate = self;
    self.textFieldPersonNumber.delegate = self;
    self.textFieldPersonEmail.delegate = self;
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(changePhoto:)];
    singleTap.numberOfTapsRequired = 1;
    singleTap.numberOfTouchesRequired = 1;
    [self.imageViewPersonPhoto addGestureRecognizer:singleTap];
    [self.imageViewPersonPhoto setUserInteractionEnabled:YES];
}

-(void) changePhoto: (UIGestureRecognizer*) gestureRecognizer {
    ALog(@"");
    UIActionSheet *as = [[UIActionSheet alloc] initWithTitle:@"Escolha" delegate:self cancelButtonTitle:@"Cancelar" destructiveButtonTitle:nil otherButtonTitles:@"Câmera",@"Usar Existente",  nil];
    [as showFromTabBar:self.tabBarController.tabBar];
}
#pragma make - delegates do UIActionSheetDelegate
-(void) actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    if([actionSheet.title isEqualToString:@"Escolha"]) {
        UIImagePickerController *ip = [[UIImagePickerController alloc]init];
        ip.delegate = self;
        if(buttonIndex == 0) {
            if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
                [ip setSourceType:UIImagePickerControllerSourceTypeCamera];
                [self presentViewController:ip animated:YES completion:nil];
            } else {
                UIAlertView *noCamera = [[UIAlertView alloc] initWithTitle:@"Bã!" message:@"Câmera não disponível" delegate:self cancelButtonTitle:@"Cancelar" otherButtonTitles:nil];
                [noCamera show];
            }
        } else if (buttonIndex == 1) {
            if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
                [ip setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
                [self presentViewController:ip animated:YES completion:nil];
            } else {
                UIAlertView *noCamera = [[UIAlertView alloc] initWithTitle:@"Bã!" message:@"Photo Library não disponível" delegate:self cancelButtonTitle:@"Cancelar" otherButtonTitles:nil];
                [noCamera show];
            }
        }
    }
}
#pragma mark - delegates da Câmera
-(void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage *img = [info objectForKey:UIImagePickerControllerOriginalImage];
    [UIView transitionWithView:self.imageViewPersonPhoto duration:0.5
                       options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
                           self.imageViewPersonPhoto.image = img;
                       } completion:nil];
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void) imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
