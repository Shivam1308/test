//
//  ViewController.h
//  Testkit
//
//  Created by Martin on 10/7/15.
//  Copyright (c) 2015 test. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <SystemConfiguration/SystemConfiguration.h>
#import <netdb.h>

#import "MRMSiOS.h"
#import "PaymentModeViewController.h"

@interface ViewController : UIViewController<UITextFieldDelegate>
@property(nonatomic,retain)IBOutlet UITextField *pricefield;

@property(nonatomic,retain)IBOutlet UILabel *PriceLabel;

@property(nonatomic,retain)IBOutlet UIButton *buyBtn;


@property(nonatomic,retain)NSString *reference_no;

-(IBAction)BuyAction:(id)sender;


@end

