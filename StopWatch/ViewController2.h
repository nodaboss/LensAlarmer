//
//  ViewController2.h
//  StopWatch
//
//  Created by Shunya Noda on 2014/05/09.
//  Copyright (c) 2014年 Shunya Noda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>

@interface ViewController2 : UIViewController
{
    IBOutlet UILabel *counterLabel;
    int Count;
    
    IBOutlet UILabel *counterLabel2;
    int Count2;
    
    //効果音
    SystemSoundID sound;
}



@property (weak, nonatomic) IBOutlet UIButton *addButton;
@property (weak, nonatomic) IBOutlet UIButton *decreaseButton;
@property (weak, nonatomic) IBOutlet UIButton *add2Butoon;
@property (weak, nonatomic) IBOutlet UIButton *decrease2Button;

@property (weak, nonatomic) IBOutlet UILabel *leftLends;
@property (weak, nonatomic) IBOutlet UILabel *rightLends;

- (IBAction)add;

- (IBAction)decrease;

- (IBAction)add2:(id)sender;

- (IBAction)decrease2:(id)sender;
@end
