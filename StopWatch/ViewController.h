//
//  ViewController.h
//  StopWatch
//
//  Created by Shunya Noda on 2014/05/07.
//  Copyright (c) 2014年 Shunya Noda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>


@interface ViewController : UIViewController{
SystemSoundID sound;
}

@property NSTimeInterval startTime;

-(IBAction)timerStart:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *timerStart;

- (IBAction)timerReset:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *timerReset;


- (IBAction)Notification:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *NotifiButton;


@property IBOutlet UILabel *timerLabel;
@property (weak, nonatomic) IBOutlet UILabel *timerLabel2;
@property (weak, nonatomic) IBOutlet UILabel *timerLabel3;
@property (weak, nonatomic) IBOutlet UILabel *timerLabel4;
@property (weak, nonatomic) IBOutlet UILabel *DayLabel;
@property (weak, nonatomic) IBOutlet UILabel *HourLabel;
@property (weak, nonatomic) IBOutlet UILabel *MinuteLabel;
@property (weak, nonatomic) IBOutlet UILabel *SecondLabel;

@end
