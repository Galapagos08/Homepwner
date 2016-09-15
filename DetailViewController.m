//
//  DetailViewController.m
//  Homepwner
//
//  Created by Dan Esrey on 2016/14/09.
//  Copyright © 2016 Dan Esrey. All rights reserved.
//

#import "DetailViewController.h"
#import "Item.h"
#import "ItemStore.h"

@interface DetailViewController ()<UITextFieldDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate>


- (IBAction)backgroundTapped:(UITapGestureRecognizer *)sender;
@property (strong, nonatomic) IBOutlet UITextField *nameField;
@property (strong, nonatomic) IBOutlet UITextField *serialNumberField;
@property (strong, nonatomic) IBOutlet UITextField *valueField;
@property (strong, nonatomic) IBOutlet UILabel *dateLabel;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
- (IBAction)cameraButtonTapped:(UIBarButtonItem *)sender;

@end

@implementation DetailViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.nameField.text = self.item.name;
    self.serialNumberField.text = self.item.serialNumber;
    self.valueField.text = [[self valueFormatter] stringFromNumber:@(self.item.valueInDollars)];
    self.dateLabel.text = [[self dateFormatter] stringFromDate:self.item.dateCreated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    // Clear the first responder
    [self.view endEditing:YES];
    
    // Update the item's properties from the text fields
    self.item.name = self.nameField.text;
    self.item.serialNumber = self.serialNumberField.text;
    NSNumber *numberInDollars = [[self valueFormatter] numberFromString:self.valueField.text];
    self.item.valueInDollars = numberInDollars.intValue;
}

// MARK: - Accessors
- (void)setItem:(Item *)item {
    _item = item;
    self.navigationItem.title = item.name;
}

// MARK: - UITextField Delegate
- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

// MARK: - Formatters
- (NSNumberFormatter *)valueFormatter {
    static NSNumberFormatter *formatter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        formatter = [NSNumberFormatter new];
        formatter.numberStyle = NSNumberFormatterDecimalStyle;
        formatter.minimumFractionDigits = 2;
        formatter.maximumFractionDigits = 2;
    });
    return formatter;
}
- (NSDateFormatter *)dateFormatter {
    static NSDateFormatter *formatter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        formatter = [NSDateFormatter new];
        formatter.dateStyle = NSDateFormatterMediumStyle;
        formatter.timeStyle = NSDateFormatterNoStyle;
    });
    return formatter;
}



- (IBAction)backgroundTapped:(UITapGestureRecognizer *)sender {
    [self.view endEditing:YES];
}
- (IBAction)cameraButtonTapped:(UIBarButtonItem *)sender {
  
    UIImagePickerController *ipc = [UIImagePickerController new];
  
    // If the device has a camera, take a picture.
    if ([UIImagePickerController
         isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        ipc.sourceType = UIImagePickerControllerSourceTypeCamera;
    } else { // Otherwise, just pick a photo from teh library.
        ipc.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    ipc.delegate = self;
    
    // Put the picker on the screen
    [self presentViewController:ipc animated:YES completion:nil];

}
@end
