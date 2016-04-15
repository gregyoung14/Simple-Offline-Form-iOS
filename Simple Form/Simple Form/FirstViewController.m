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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    
}

@end
