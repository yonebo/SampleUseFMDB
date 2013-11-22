//
//  MainViewController.h
//  SampleUseFMDB
//
//  Created by MacPro01 on 2013/11/21.
//  Copyright (c) 2013年 eyoneya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController
{
    IBOutlet UITextField *tfKey;
    IBOutlet UITextField *tfTData;
    IBOutlet UITextField *tfIData;
    IBOutlet UITextField *tfBData;
    IBOutlet UISwitch *swBData;
    
    IBOutlet UIButton *buttonSearch;
    IBOutlet UIButton *buttonRegistry;
    IBOutlet UIButton *buttonDelete;
    
}
@property (nonatomic, retain) IBOutlet UITextField *tfKey;
@property (nonatomic, retain) IBOutlet UITextField *tfTData;
@property (nonatomic, retain) IBOutlet UITextField *tfIData;

@property (nonatomic, retain) IBOutlet UISwitch *swBData;
- (IBAction)switchBData:(id)sender;

@property (nonatomic, retain) IBOutlet UIPickerView *pickerBData;

@property (nonatomic, retain) IBOutlet UIButton *buttonSearch;
- (IBAction)searchData:(id)sender;

@property (nonatomic, retain) IBOutlet UIButton *buttonDelete;
- (IBAction)deleteData:(id)sender;

@property (nonatomic, retain) IBOutlet UIButton *buttonRegistry;
- (IBAction)saveData:(id)sender;

- (IBAction)closeSoftwareKeyboard:(id)sender;

@end
