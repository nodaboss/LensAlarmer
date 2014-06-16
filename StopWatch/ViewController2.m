//
//  ViewController2.m
//  StopWatch
//
//  Created by Shunya Noda on 2014/05/09.
//  Copyright (c) 2014年 Shunya Noda. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 ()

@end

@implementation ViewController2

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
}
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self ReadDefaults];
    [self ReadDefaults2];
    [self Edit];
    //効果音ファイル読み込み
    NSString *path = [[NSBundle mainBundle] pathForResource:@"se_maoudamashii_se_pc01" ofType:@"mp3"];
    NSURL *url = [NSURL fileURLWithPath:path];
    AudioServicesCreateSystemSoundID((CFURLRef)CFBridgingRetain(url), &sound);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


-(void)Edit{
    
    counterLabel.backgroundColor= [UIColor colorWithRed:1 green:0 blue:0.6 alpha:1];
    counterLabel.textAlignment = NSTextAlignmentCenter;
    [counterLabel setFont:[UIFont fontWithName:@"Futura-Medium" size:80]];
    
    counterLabel2.backgroundColor= [UIColor colorWithRed:0 green:0.8 blue:0.2 alpha:1];
    counterLabel2.textAlignment = NSTextAlignmentCenter;
    [counterLabel2 setFont:[UIFont fontWithName:@"Futura-Medium" size:80]];
    
    
    [_addButton setTitle:@"+" forState:UIControlStateNormal];
//    [_addButton setFont:[UIFont fontWithName:@"Futura-Medium" size:60]];
    _addButton.titleLabel.font = [UIFont fontWithName:@"Futura-Medium" size:60];
    
    [_decreaseButton setTitle:@"ー" forState:UIControlStateNormal];
//    [_decreaseButton setFont:[UIFont fontWithName:@"Futura-Medium" size:40]];
    _decreaseButton.titleLabel.font = [UIFont fontWithName:@"Futura-Medium" size:40];
    
    [_add2Butoon setTitle:@"+" forState:UIControlStateNormal];
//    [_add2Butoon setFont:[UIFont fontWithName:@"Futura-Medium" size:60]];
    _add2Butoon.titleLabel.font = [UIFont fontWithName:@"Futura-Medium" size:60];
    
    [_decrease2Button setTitle:@"ー" forState:UIControlStateNormal];
//    [_decrease2Button setFont:[UIFont fontWithName:@"Futura-Medium" size:40]];
    _decrease2Button.titleLabel.font = [UIFont fontWithName:@"Futura-Medium" size:40];
    
    _addButton.backgroundColor= [UIColor colorWithRed:0.8 green:0 blue:0.2 alpha:1];
    _decreaseButton.backgroundColor= [UIColor colorWithRed:0.2 green:0.6 blue:1 alpha:1];
    _add2Butoon.backgroundColor= [UIColor colorWithRed:0.8 green:0 blue:0.2 alpha:1];
    _decrease2Button.backgroundColor= [UIColor colorWithRed:0.2 green:0.6 blue:1 alpha:1];

    self.leftLends.text = @"Left Lens";
    _leftLends.backgroundColor= [UIColor clearColor];
    _leftLends.textAlignment = NSTextAlignmentCenter;
    [_leftLends setFont:[UIFont fontWithName:@"Futura-Medium" size:30]];
    
    self.rightLends.text = @"Right Lens";
    _rightLends.backgroundColor= [UIColor clearColor];
    _rightLends.textAlignment = NSTextAlignmentCenter;
    [_rightLends setFont:[UIFont fontWithName:@"Futura-Medium" size:30]];
    
    


}

- (IBAction)add
{
    
   
    AudioServicesPlaySystemSound(sound);
    

    
       NSUserDefaults* rDefaults = [NSUserDefaults standardUserDefaults];
	Count = [rDefaults integerForKey:@"number1"] + 1;
	counterLabel.text = [NSString stringWithFormat:@"%d", Count];
    [self SaveDefaults];
    
    }

- (IBAction)decrease
{
    AudioServicesPlaySystemSound(sound);

    NSUserDefaults* rDefaults = [NSUserDefaults standardUserDefaults];
    Count = [rDefaults integerForKey:@"number1"] - 1;
	counterLabel.text = [NSString stringWithFormat:@"%d", Count];
    if (Count <= 0) {
        Count = 0;
        counterLabel.text = @"0";
    }
    [self SaveDefaults];
}

- (IBAction)add2:(id)sender
{
    AudioServicesPlaySystemSound(sound);

    NSUserDefaults* rDefaults2 = [NSUserDefaults standardUserDefaults];
    Count2 = [rDefaults2 integerForKey:@"number2"] + 1;
	counterLabel2.text = [NSString stringWithFormat:@"%d", Count2];
    [self SaveDefaults2];

}

- (IBAction)decrease2:(id)sender
{
    AudioServicesPlaySystemSound(sound);

    NSUserDefaults* rDefaults2 = [NSUserDefaults standardUserDefaults];
    Count2 = [rDefaults2 integerForKey:@"number2"] - 1;
	counterLabel2.text = [NSString stringWithFormat:@"%d", Count2];
    if (Count2 <= 0) {
        Count2 = 0;
        counterLabel2.text = @"0";
    }
    [self SaveDefaults2];

}

-(void)SaveDefaults{
    NSUserDefaults* sDefaults = [NSUserDefaults standardUserDefaults];
    [sDefaults setInteger:Count forKey:@"number1"];
    NSLog(@"count設定完了=%d",(int)sDefaults);
    [sDefaults synchronize];
}

-(void)SaveDefaults2{
    NSUserDefaults* sDefaults2 = [NSUserDefaults standardUserDefaults];
    [sDefaults2 setInteger:Count2 forKey:@"number2"];
    NSLog(@"count2設定完了=%d",(int)sDefaults2);
    [sDefaults2 synchronize];
}

-(void)ReadDefaults{
    NSUserDefaults* rDefaults = [NSUserDefaults standardUserDefaults];
    int	cnumber = [rDefaults integerForKey:@"number1"];
    counterLabel.text = [NSString stringWithFormat:@"%d",cnumber];
    NSLog(@"読み込み成功=%d",cnumber);
}

-(void)ReadDefaults2{
    NSUserDefaults* rDefaults2 = [NSUserDefaults standardUserDefaults];
    int	cnumber2 = [rDefaults2 integerForKey:@"number2"];
    counterLabel2.text = [NSString stringWithFormat:@"%d",cnumber2];
    NSLog(@"読み込み成功2=%d",cnumber2);
}

@end
