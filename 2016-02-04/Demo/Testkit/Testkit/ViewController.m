//
//  ViewController.m
//  Testkit
//
//  Created by Martin on 10/7/15.
//  Copyright (c) 2015 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize pricefield,PriceLabel,buyBtn;

@synthesize reference_no;


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.navigationBarHidden=YES;
    
    pricefield.delegate=self;
    
    [self DesignView];
    
    [self showDoneButtonOnKeyboard];
    
}

-(void)DesignView
{
    int x,gap,height,ypos=0,labelHeight,offerLblWIDTH,offerLblHEIGHT,descriptionLblWIDTH,descriptionLblHEIGHT,PayableLabelWIDTH;
    
    int font_size;
    
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad) {
        // iPad
        x=70,gap=20,height=70,labelHeight=50,offerLblWIDTH=170,descriptionLblWIDTH=240,descriptionLblHEIGHT=180,offerLblHEIGHT=120,PayableLabelWIDTH=90;
        font_size=23;
    } else {
        // iPhone
        x=20,gap=10,height=50,labelHeight=50,offerLblWIDTH=120,descriptionLblWIDTH=170,descriptionLblHEIGHT=140,offerLblHEIGHT=80,PayableLabelWIDTH=70;
        font_size=17;
    }
    
    UIView *headerview=[[UIView alloc]initWithFrame:CGRectMake(0, ypos, self.view.frame.size.width, height)];
    [headerview setBackgroundColor:[UIColor colorWithRed:46/255.0 green:71/255.0 blue:149/255.0 alpha:1.0]];
    [self.view addSubview:headerview];
    
    UILabel *tiltLabel= [[UILabel alloc]initWithFrame:CGRectMake(0, ypos,headerview.frame.size.width, headerview.frame.size.height)];
    tiltLabel.font = [UIFont fontWithName:@"Helvetica Bold" size:font_size+3];
    tiltLabel.backgroundColor = [UIColor clearColor];
    tiltLabel.text=@"My Shoping Cart";
    tiltLabel.textColor = [UIColor blackColor];
    tiltLabel.textAlignment = NSTextAlignmentCenter;
    [tiltLabel setCenter:headerview.center];
    [headerview addSubview:tiltLabel];
    
    int offerLblYPOS=headerview.frame.origin.y+height+gap*3;
    
    UILabel *offerLabel= [[UILabel alloc]initWithFrame:CGRectMake(x, offerLblYPOS, offerLblWIDTH,offerLblHEIGHT)];
    offerLabel.font = [UIFont fontWithName:@"Helvetica" size:font_size];
    offerLabel.text=@"Launch Offer ! Grab yours now only INR 1/- per book";
    offerLabel.numberOfLines = 0;
    offerLabel.lineBreakMode=NSLineBreakByWordWrapping;
    offerLabel.minimumScaleFactor = 10.0;
    offerLabel.backgroundColor =[UIColor clearColor] ;
    offerLabel.textColor =[UIColor colorWithRed:36/255.0 green:43/255.0 blue:166/255.0 alpha:1.0];
    offerLabel.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:offerLabel];
    
    int QuntityLblYPOS=headerview.frame.origin.y+height+gap;
    int QuntityLblWIDTH=self.view.frame.size.width/2-x;
    int XPOS=self.view.frame.size.width/2-x+gap*10;
    
    //QuntityLabel
    UILabel *QuntityLabel= [[UILabel alloc]initWithFrame:CGRectMake(XPOS, QuntityLblYPOS,QuntityLblWIDTH,height)];
    QuntityLabel.font = [UIFont fontWithName:@"System" size:font_size];
    QuntityLabel.text=@"Quantity";
    QuntityLabel.backgroundColor = [UIColor clearColor];
    QuntityLabel.textColor = [UIColor blackColor];
    QuntityLabel.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:QuntityLabel];
    
    int pricefieldYPOS=QuntityLabel.frame.origin.y+height-gap;
    int pricefieldWIDTH=height+20;
    
    pricefield = [[UITextField alloc]init];
    pricefield.frame=CGRectMake(XPOS, pricefieldYPOS, pricefieldWIDTH, height);
    pricefield.textColor = [UIColor blackColor];
    pricefield.font = [UIFont fontWithName:@"Helvetica" size:font_size];
    pricefield.backgroundColor=[UIColor clearColor];
    pricefield.delegate=self;
    pricefield.borderStyle=UITextBorderStyleLine;
    pricefield.keyboardType=UIKeyboardTypeNumberPad;
    [pricefield setReturnKeyType:UIReturnKeyDone];
    [self.view addSubview:pricefield];
    
    int descriptionLblYPOS=offerLabel.frame.origin.y+height+gap*5;
    
    UILabel *descriptionLbl= [[UILabel alloc]initWithFrame:CGRectMake(x, descriptionLblYPOS, descriptionLblWIDTH,descriptionLblHEIGHT)];
    descriptionLbl.font = [UIFont fontWithName:@"Helvetica" size:font_size];
    descriptionLbl.text=@"Product Description:  Sachin writes about his own bibiliography of his prolonged career in cricket and his favourite Memories...";
    descriptionLbl.numberOfLines = 0;
    descriptionLbl.lineBreakMode=NSLineBreakByWordWrapping;
    descriptionLbl.minimumScaleFactor = 10.0;
    descriptionLbl.backgroundColor = [UIColor colorWithRed:125/255.0 green:170/255.0 blue:52/255.0 alpha:1.0];
    descriptionLbl.textColor = [UIColor blackColor];
    descriptionLbl.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:descriptionLbl];
    
    int PayableLabelYPOS=descriptionLblYPOS;
    
    UILabel *PayableLabel= [[UILabel alloc]initWithFrame:CGRectMake(XPOS,PayableLabelYPOS, PayableLabelWIDTH,height)];
    PayableLabel.font = [UIFont fontWithName:@"System" size:font_size];
    PayableLabel.numberOfLines = 0;
    PayableLabel.lineBreakMode=NSLineBreakByWordWrapping;
    PayableLabel.minimumScaleFactor = 10.0;
    PayableLabel.text=@"Payable Amount";
    PayableLabel.backgroundColor = [UIColor clearColor];
    PayableLabel.textColor = [UIColor blackColor];
    PayableLabel.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:PayableLabel];
    
    int  PriceLabelYPOS=PayableLabel.frame.origin.y+height;
    int  PriceLabelWidth,PriceLabelHeight;
    
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad) {
        // iPad
        PriceLabelWidth=90;
        PriceLabelHeight=40;
    } else {
        // iPhone
        PriceLabelWidth=60;
        PriceLabelHeight=30;
    }
    PriceLabel= [[UILabel alloc]initWithFrame:CGRectMake(XPOS,PriceLabelYPOS, PriceLabelWidth,height-20)];
    PriceLabel.font = [UIFont fontWithName:@"Helvetica" size:font_size];
    PriceLabel.backgroundColor = [UIColor grayColor];
    PriceLabel.textColor = [UIColor blackColor];
    PriceLabel.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:PriceLabel];
    
    int buyBtnWidth,buyBtnHeight;
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad) {
        // iPad
        buyBtnWidth=75;
        buyBtnHeight=50;
    } else {
        // iPhone
        buyBtnWidth=60;
        buyBtnHeight=45;
    }
    
    //UIButton
    buyBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    buyBtn.frame = CGRectMake(XPOS, PriceLabel.frame.origin.y+height, buyBtnWidth, buyBtnHeight);
    [buyBtn setTitle:@"Buy" forState:UIControlStateNormal];
    [buyBtn addTarget:self action:@selector(BuyAction:) forControlEvents:UIControlEventTouchUpInside];
    buyBtn.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:font_size];
    
    buyBtn.backgroundColor = [UIColor clearColor];
    [buyBtn setTitleColor:[UIColor colorWithRed:0/255.0 green:122/255.0 blue:255/255.0 alpha:1.0] forState:UIControlStateNormal];
    [self.view addSubview:buyBtn];
    
    int imgYPOS=buyBtn.frame.origin.y+buyBtnHeight+gap*2;
    int imgWIDTH=self.view.frame.size.width-self.view.frame.size.width/3;
    int imgHEIGHT=self.view.frame.size.height/3;
    
    UIImageView *imageview =[[UIImageView alloc] initWithFrame:CGRectMake(0,imgYPOS,imgWIDTH,imgHEIGHT)];
    imageview.image=[UIImage imageNamed:@"sachin_book1.png"];
    // imageview.contentMode = UIViewContentModeCenter;
    imageview.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:imageview];
    
}

-(IBAction)BuyAction:(id)sender
{
    NSString *qtyString;
    float price ,priceString;
    
    if([pricefield.text length] !=0 )
    {
        
        qtyString  = pricefield.text;
        
        priceString = [qtyString floatValue];
        
        price = (float)priceString * 1;
        
        //Merchant has to configure the below code
        
        PaymentModeViewController *paymentView=[[PaymentModeViewController alloc]init];
        // Mandatory Parameters
        // Price has to be configured
        paymentView.paymentAmtString = [NSString stringWithFormat:@"%.2f",price];
        
        paymentView.strCurrency =@"INR";
        paymentView.strDisplayCurrency =@"USD";

        //Reference no has to be configured
        paymentView.reference_no = @"223";
        
        paymentView.strDescription = @"Test Description";
      
        paymentView.strBillingName = @"Test";
        paymentView.strBillingAddress = @"Bill address";
        paymentView.strBillingCity =@"Bill City";
        paymentView.strBillingState = @"TN";
        paymentView.strBillingPostal =@"625000";
        paymentView.strBillingCountry = @"IND";
        paymentView.strBillingEmail =@"test@testmail.com";
        paymentView.strBillingTelephone =@"9363469999";
      
        // Non mandatory parameters
        paymentView.strDeliveryName = @"";
        paymentView.strDeliveryAddress = @"";
        paymentView.strDeliveryCity = @"";
        paymentView.strDeliveryState = @"";
        paymentView.strDeliveryPostal =@"";
        paymentView.strDeliveryCountry = @"";
        paymentView.strDeliveryTelephone =@"";
        
        NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
        [defaults setObject:@"223" forKey:@"reference_no"];
        [defaults setObject:[NSString stringWithFormat:@"%.2f",price] forKey:@"strSaleAmount"];
        paymentView.strSaleAmount =[NSString stringWithFormat:@"%.2f",price];

        [defaults synchronize];
        
        //If you want to add any extra parameters dynamically you have to add the Key and value as we mentioned below
        
//        NSMutableDictionary *dynamicKeyValueDictionary = [[NSMutableDictionary alloc]init];
//        
//        [dynamicKeyValueDictionary setValue:@"savings" forKey:@"account_detail"];
//        
//        [dynamicKeyValueDictionary setValue:@"gold" forKey:@"merchant_type"];
//        
//         paymentView.dynamicKeyValueDictionary = dynamicKeyValueDictionary;
        
        [self.navigationController pushViewController:paymentView animated:NO];

    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Please enter the quantity" message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
}

-(void)doneWithNumberPad
{
    NSString *qtyString;
    float price ,priceString;
    
    if ([pricefield.text length] !=0 )
    {
        qtyString  = pricefield.text;
        
        priceString = [qtyString intValue];
        
        price = (int)priceString * 1;
        PriceLabel.text = [NSString stringWithFormat:@"%.2f",price];
        
    }
    else{
        PriceLabel.text = @"";
    }
    [pricefield resignFirstResponder];
    
}

-(void)cancelNumberPad
{
    [pricefield resignFirstResponder];
}

- (void)showDoneButtonOnKeyboard
{
    UIToolbar* numberToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    
    numberToolbar.items = [NSArray arrayWithObjects:
                           [[UIBarButtonItem alloc]initWithTitle:@"Cancel" style:UIBarButtonItemStyleBordered target:self action:@selector(cancelNumberPad)],
                           [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                           [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneWithNumberPad)],
                           nil];
    
    pricefield.inputAccessoryView = numberToolbar;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSString *newString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    [self updateTextLabelsWithText: newString];
    
    return YES;
}

-(void)updateTextLabelsWithText:(NSString *)string
{
    NSString *qtyString;
    float price,priceString;
    
    qtyString  = string;
    
    priceString = [qtyString intValue];
    
    price = (int)priceString * 1;
    PriceLabel.text = [NSString stringWithFormat:@"%.2f",price];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
