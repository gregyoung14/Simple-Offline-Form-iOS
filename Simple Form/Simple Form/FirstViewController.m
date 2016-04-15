//
//  FirstViewController.m
//  Simple Form
//
//  Created by Gregory Young on 4/15/16.
//  Copyright © 2016 Gregory Young. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *companyNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumberTextField;

@property (weak, nonatomic) IBOutlet UIButton *saveButton;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dismissKeyboard {
    [_nameTextField resignFirstResponder];
    [_companyNameTextField resignFirstResponder];
    [_emailTextField resignFirstResponder];
    [_phoneNumberTextField resignFirstResponder];
}

- (IBAction)saveButtonTapped:(id)sender {
    
    NSMutableArray *array = [[NSMutableArray alloc]initWithArray:[[NSUserDefaults standardUserDefaults]valueForKey:@"data_form"]];
    
    if(array.count == 0){
        array = [[NSMutableArray alloc]init];
    }
    
    NSDictionary *info = @{@"name":_nameTextField.text,
                           @"company_name":_companyNameTextField.text,
                           @"email":_emailTextField.text,
                           @"phone_number":_phoneNumberTextField.text,};
    
    [array addObject:info];
    
    [[NSUserDefaults standardUserDefaults]setObject:array forKey:@"data_form"];
    
    //Pop alert thanking them, clear fields
    NSString *title = NSLocalizedString(@"Thanks!", nil);
    NSString *body = @"Thanks for providing your contact information, we'll be in touch!";

    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:body preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *trackAct = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alert addAction:trackAct];
    [self presentViewController:alert animated:YES completion:^{
        _nameTextField.text = @"";
        _companyNameTextField.text = @"";
        _emailTextField.text = @"";
        _phoneNumberTextField.text = @"";
    }];
    
}

@end
