//
//  SetViewController.h
//  StopWatch
//
//  Created by Shunya Noda on 2014/05/13.
//  Copyright (c) 2014年 Shunya Noda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SetViewController : UIViewController
@property (weak, nonatomic) IBOutlet UISwitch *setSwitchName;

@property (weak, nonatomic) IBOutlet UILabel *setLabel;
- (IBAction)setSwitch:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *setLabel2;

@property (weak, nonatomic) IBOutlet UIButton *setButton;
- (IBAction)setButtonAct:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *setButton2;
- (IBAction)setButtonAct2:(id)sender;

@end
