//
//  ViewController.m
//  StopWatch
//
//  Created by Shunya Noda on 2014/05/07.
//  Copyright (c) 2014年 Shunya Noda. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"


@interface ViewController ()

@end

@implementation ViewController{

    NSTimer *NodaTimer;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    [self ReadDefaults];
    [self EditDesign];
    
    //効果音ファイル読み込み
    NSString *path = [[NSBundle mainBundle] pathForResource:@"se_maoudamashii_se_pc01" ofType:@"mp3"];
    NSURL *url = [NSURL fileURLWithPath:path];
    AudioServicesCreateSystemSoundID((CFURLRef)CFBridgingRetain(url), &sound);
    
    
    NSDate *date =[[NSUserDefaults standardUserDefaults] objectForKey:@"cdate"];
    
    if (date > 0) {
        NodaTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timeCounter) userInfo:nil repeats:YES];
    }else{
        [NodaTimer invalidate];
        NodaTimer=nil;
        self.timerLabel.text = @"00";
        self.timerLabel2.text = @"00";
        self.timerLabel3.text = @"00";
        self.timerLabel4.text = @"00";
        
        
}}


- (void)didReceiveMemoryWarning{
    
    [super didReceiveMemoryWarning];
}



-(IBAction)timerStart:(id)sender{
    
    AudioServicesPlaySystemSound(sound);
    NSLog(@"スタート押された");

    if (![NodaTimer isValid]) {
        NodaTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timeCounter) userInfo:nil repeats:YES];
        
               [self SaveDefaults];
        
                UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"カウントスタート"
                              message:@"現在の装着時刻から、7日間ごとに通知がきます。"
                              delegate:self
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil];
        [alert show];

        
    }}


- (IBAction)timerReset:(id)sender {
    
    AudioServicesPlaySystemSound(sound);

    NSLog(@"ボタンが押されました");
    
    static const NSInteger secondAlertTag = 2;
    
    //アラートビューの生成と設定
    UIAlertView *alert2 = [[[UIAlertView alloc]init]
                          initWithTitle:@"確認"
                          message:@"リセットしてもよろしいですか？"
                          delegate:self
                          cancelButtonTitle:@"YES" otherButtonTitles:@"NO", nil];
    
    alert2.tag = secondAlertTag;
    [alert2 show];

}

-(void)SaveDefaults{
    
    //現在時刻を保存
    NSDate* startdate = [NSDate date];
    
    [[NSUserDefaults standardUserDefaults] setObject:startdate forKey:@"cdate"];
    
    startdate = [[NSDate alloc]init];
    
    NSLog(@"日時保存=%d",(int)startdate);
}

-(void)ReadDefaults{
    
    NSDate *nowdate = [NSDate date];
    int tmp= [nowdate timeIntervalSinceDate:[[NSUserDefaults standardUserDefaults] objectForKey:@"cdate"]];
    
    int day = fmod((tmp/60/60/24), 365);
    int hour = fmod((tmp/60/60), 24);
    int minute = fmod((tmp/60), 60);
    int second = fmod(tmp, 60);
    
    self.timerLabel.text = [NSString stringWithFormat:@"%02d", day];
    self.timerLabel2.text = [NSString stringWithFormat:@"%02d",hour];
    self.timerLabel3.text = [NSString stringWithFormat:@"%02d",minute];
    self.timerLabel4.text = [NSString stringWithFormat:@"%02d",second];
    
    NSLog(@"%02d:%02d:%02d:%02d",day,hour,minute,second);
}
     
- (void)timeCounter{
    
    //保存日時ー現在日時ひいて経過時間計算➡表示
    NSDate *nowdate = [NSDate date];
    
    int cTime = [nowdate timeIntervalSinceDate:[[NSUserDefaults standardUserDefaults] objectForKey:@"cdate"]];
    
    NSLog(@"差分=%d",cTime);
    
    int day = fmod((cTime/60/60/24), 365);
    int hour = fmod((cTime/60/60), 24);
    int minute = fmod((cTime/60), 60);
    int second = fmod(cTime, 60);
    
    self.timerLabel.text = [NSString stringWithFormat:@"%02d", day];
    self.timerLabel2.text = [NSString stringWithFormat:@"%02d",hour];
    self.timerLabel3.text = [NSString stringWithFormat:@"%02d",minute];
    self.timerLabel4.text = [NSString stringWithFormat:@"%02d",second];
    
    NSLog(@"S=%d",second);
    NSLog(@"M=%d",minute);
    NSLog(@"H=%d",hour);
    NSLog(@"D=%d",day);
    
    
    NSUserDefaults *ud2 = [NSUserDefaults standardUserDefaults];
    BOOL b = [ud2 boolForKey:@"KEY"];
    
    if (b == YES) {
        [self Notification1];
        [self Notification2];
        [self Notification3];
        [self Notification4];
        [self Notification5];
        [self Notification6];
        [self Notification7];
        [self Notification8];
        [self Notification9];
        [self Notification10];
        [self Notification11];
        [self Notification12];
    }else{
        
        [[UIApplication sharedApplication] cancelAllLocalNotifications];
    
    }
    
    }


-(void)Notification1{
    
    NSDate *NotificationDate = [NSDate date];
    
    int cTime = [NotificationDate timeIntervalSinceDate:[[NSUserDefaults standardUserDefaults] objectForKey:@"cdate"]];
    
    if (cTime <= 60*60*24*7) {
        
        UILocalNotification *localNotification = [[UILocalNotification alloc]init];
        
        NSDate * Notifidate = [[NSUserDefaults standardUserDefaults] objectForKey:@"cdate"];
        
        localNotification.fireDate = [Notifidate dateByAddingTimeInterval:60*60*24*7];
        
        localNotification.alertBody = [NSString stringWithFormat:@"レンズ装着から１週間が経ちました"];
        
        localNotification.soundName = UILocalNotificationDefaultSoundName;
        
        localNotification.timeZone = [NSTimeZone defaultTimeZone];
        
        [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];

    }
    
    }


-(void)Notification2{
    
    
    NSDate *NotificationDate = [NSDate date];
    
    int cTime = [NotificationDate timeIntervalSinceDate:[[NSUserDefaults standardUserDefaults] objectForKey:@"cdate"]];
    
    if (cTime <= 60*60*24*14) {

    
    UILocalNotification *localNotification = [[UILocalNotification alloc]init];
    
    NSDate * Notifidate = [[NSUserDefaults standardUserDefaults] objectForKey:@"cdate"];
    
    localNotification.fireDate = [Notifidate dateByAddingTimeInterval:60*60*24*14];
    
    localNotification.alertBody = [NSString stringWithFormat:@"レンズ装着から２週間が経ちました"];
    
    localNotification.soundName = UILocalNotificationDefaultSoundName;
    
    localNotification.timeZone = [NSTimeZone defaultTimeZone];
    
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
    }
    
}



-(void)Notification3{
    
    
    
    NSDate *NotificationDate = [NSDate date];
    
    int cTime = [NotificationDate timeIntervalSinceDate:[[NSUserDefaults standardUserDefaults] objectForKey:@"cdate"]];
    
    if (cTime <= 60*60*24*21) {

    
    UILocalNotification *localNotification = [[UILocalNotification alloc]init];
    
    NSDate * Notifidate = [[NSUserDefaults standardUserDefaults] objectForKey:@"cdate"];
    
    localNotification.fireDate = [Notifidate dateByAddingTimeInterval:60*60*24*21];
    
    localNotification.alertBody = [NSString stringWithFormat:@"レンズ装着から３週間が経ちました"];
    
    localNotification.soundName = UILocalNotificationDefaultSoundName;
    
    
    localNotification.timeZone = [NSTimeZone defaultTimeZone];
    
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
    }
    
}

-(void)Notification4{
    
    NSDate *NotificationDate = [NSDate date];
    
    int cTime = [NotificationDate timeIntervalSinceDate:[[NSUserDefaults standardUserDefaults] objectForKey:@"cdate"]];
    
    if (cTime <= 60*60*24*28) {

    
    UILocalNotification *localNotification = [[UILocalNotification alloc]init];
    
    NSDate * Notifidate = [[NSUserDefaults standardUserDefaults] objectForKey:@"cdate"];
    
    localNotification.fireDate = [Notifidate dateByAddingTimeInterval:60*60*24*28];
    
    localNotification.alertBody = [NSString stringWithFormat:@"レンズ装着から１ヶ月が経ちました"];
    
    localNotification.soundName = UILocalNotificationDefaultSoundName;
    
    localNotification.timeZone = [NSTimeZone defaultTimeZone];
    
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
    }
    
    
}

-(void)Notification5{
    
    NSDate *NotificationDate = [NSDate date];
    
    int cTime = [NotificationDate timeIntervalSinceDate:[[NSUserDefaults standardUserDefaults] objectForKey:@"cdate"]];
    
    if (cTime <= 60*60*24*35) {

    UILocalNotification *localNotification = [[UILocalNotification alloc]init];
    
    NSDate * Notifidate = [[NSUserDefaults standardUserDefaults] objectForKey:@"cdate"];
    
    localNotification.fireDate = [Notifidate dateByAddingTimeInterval:60*60*24*35];
    
    localNotification.alertBody = [NSString stringWithFormat:@"レンズ装着から１ヶ月と１週間が経ちました"];
    
    localNotification.soundName = UILocalNotificationDefaultSoundName;
    
    
    localNotification.timeZone = [NSTimeZone defaultTimeZone];
    
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
    }
}

-(void)Notification6{
    
    NSDate *NotificationDate = [NSDate date];
    
    int cTime = [NotificationDate timeIntervalSinceDate:[[NSUserDefaults standardUserDefaults] objectForKey:@"cdate"]];
    
    if (cTime <= 60*60*24*42) {
        
        UILocalNotification *localNotification = [[UILocalNotification alloc]init];
        
        NSDate * Notifidate = [[NSUserDefaults standardUserDefaults] objectForKey:@"cdate"];
        
        localNotification.fireDate = [Notifidate dateByAddingTimeInterval:60*60*24*42];
        
        localNotification.alertBody = [NSString stringWithFormat:@"レンズ装着から１ヶ月と２週間が経ちました"];
        
        localNotification.soundName = UILocalNotificationDefaultSoundName;
        
        
        localNotification.timeZone = [NSTimeZone defaultTimeZone];
        
        [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
    }
}

-(void)Notification7{
    
    NSDate *NotificationDate = [NSDate date];
    
    int cTime = [NotificationDate timeIntervalSinceDate:[[NSUserDefaults standardUserDefaults] objectForKey:@"cdate"]];
    
    if (cTime <= 60*60*24*49) {
        
        UILocalNotification *localNotification = [[UILocalNotification alloc]init];
        
        NSDate * Notifidate = [[NSUserDefaults standardUserDefaults] objectForKey:@"cdate"];
        
        localNotification.fireDate = [Notifidate dateByAddingTimeInterval:60*60*24*49];
        
        localNotification.alertBody = [NSString stringWithFormat:@"レンズ装着から１ヶ月と３週間が経ちました"];
        
        localNotification.soundName = UILocalNotificationDefaultSoundName;
        
        
        localNotification.timeZone = [NSTimeZone defaultTimeZone];
        
        [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
    }
}

-(void)Notification8{
    
    NSDate *NotificationDate = [NSDate date];
    
    int cTime = [NotificationDate timeIntervalSinceDate:[[NSUserDefaults standardUserDefaults] objectForKey:@"cdate"]];
    
    if (cTime <= 60*60*24*56) {
        
        UILocalNotification *localNotification = [[UILocalNotification alloc]init];
        
        NSDate * Notifidate = [[NSUserDefaults standardUserDefaults] objectForKey:@"cdate"];
        
        localNotification.fireDate = [Notifidate dateByAddingTimeInterval:60*60*24*56];
        
        localNotification.alertBody = [NSString stringWithFormat:@"レンズ装着から１ヶ月と２ヶ月が経ちました"];
        
        localNotification.soundName = UILocalNotificationDefaultSoundName;
        
        
        localNotification.timeZone = [NSTimeZone defaultTimeZone];
        
        [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
    }
}

-(void)Notification9{
    
    NSDate *NotificationDate = [NSDate date];
    
    int cTime = [NotificationDate timeIntervalSinceDate:[[NSUserDefaults standardUserDefaults] objectForKey:@"cdate"]];
    
    if (cTime <= 60*60*24*63) {
        
        UILocalNotification *localNotification = [[UILocalNotification alloc]init];
        
        NSDate * Notifidate = [[NSUserDefaults standardUserDefaults] objectForKey:@"cdate"];
        
        localNotification.fireDate = [Notifidate dateByAddingTimeInterval:60*60*24*63];
        
        localNotification.alertBody = [NSString stringWithFormat:@"レンズ装着から２ヶ月と１週間が経ちました"];
        
        localNotification.soundName = UILocalNotificationDefaultSoundName;
        
        
        localNotification.timeZone = [NSTimeZone defaultTimeZone];
        
        [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
    }
}

-(void)Notification10{
    
    NSDate *NotificationDate = [NSDate date];
    
    int cTime = [NotificationDate timeIntervalSinceDate:[[NSUserDefaults standardUserDefaults] objectForKey:@"cdate"]];
    
    if (cTime <= 60*60*24*70) {
        
        UILocalNotification *localNotification = [[UILocalNotification alloc]init];
        
        NSDate * Notifidate = [[NSUserDefaults standardUserDefaults] objectForKey:@"cdate"];
        
        localNotification.fireDate = [Notifidate dateByAddingTimeInterval:60*60*24*70];
        
        localNotification.alertBody = [NSString stringWithFormat:@"レンズ装着から２ヶ月と２週間が経ちました"];
        
        localNotification.soundName = UILocalNotificationDefaultSoundName;
        
        
        localNotification.timeZone = [NSTimeZone defaultTimeZone];
        
        [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
    }
}

-(void)Notification11{
    
    NSDate *NotificationDate = [NSDate date];
    
    int cTime = [NotificationDate timeIntervalSinceDate:[[NSUserDefaults standardUserDefaults] objectForKey:@"cdate"]];
    
    if (cTime <= 60*60*24*77) {
        
        UILocalNotification *localNotification = [[UILocalNotification alloc]init];
        
        NSDate * Notifidate = [[NSUserDefaults standardUserDefaults] objectForKey:@"cdate"];
        
        localNotification.fireDate = [Notifidate dateByAddingTimeInterval:60*60*24*77];
        
        localNotification.alertBody = [NSString stringWithFormat:@"レンズ装着から２ヶ月と３週間が経ちました"];
        
        localNotification.soundName = UILocalNotificationDefaultSoundName;
        
        
        localNotification.timeZone = [NSTimeZone defaultTimeZone];
        
        [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
    }
}

-(void)Notification12{
    
    NSDate *NotificationDate = [NSDate date];
    
    int cTime = [NotificationDate timeIntervalSinceDate:[[NSUserDefaults standardUserDefaults] objectForKey:@"cdate"]];
    
    if (cTime <= 60*60*24*84) {
        
        UILocalNotification *localNotification = [[UILocalNotification alloc]init];
        
        NSDate * Notifidate = [[NSUserDefaults standardUserDefaults] objectForKey:@"cdate"];
        
        localNotification.fireDate = [Notifidate dateByAddingTimeInterval:60*60*24*84];
        
        localNotification.alertBody = [NSString stringWithFormat:@"レンズ装着から３ヶ月が経ちました"];
        
        localNotification.soundName = UILocalNotificationDefaultSoundName;
        
        
        localNotification.timeZone = [NSTimeZone defaultTimeZone];
        
        [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
    }
}


- (IBAction)Notification:(id)sender {
    NSLog(@"ボタンが押されました");
    AudioServicesPlaySystemSound(sound);

    static const NSInteger firstAlertTag = 1;
    
    //アラートビューの生成と設定
    UIAlertView *alert = [[[UIAlertView alloc]init]
                          initWithTitle:@"通知設定"
                          message:@"通知を受け取りますか？"
                          delegate:self
                          cancelButtonTitle:@"YES" otherButtonTitles:@"NO", nil];
    
    alert.tag = firstAlertTag;
    [alert show];
    

}



-(void)alertView:(UIAlertView*)alertView
clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    BOOL a;
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];

    if (alertView.tag == 1) {
        
        switch (buttonIndex) {
            case 0:
                a = YES;
                [ud setBool:YES forKey:@"KEY"];
                NSLog(@"はい");
                
                break;
                
            case 1:
                a = NO;
                [ud setBool:NO forKey:@"KEY"];
                NSLog(@"いいえ");
                break;
        }
    }if (alertView.tag == 2) {
        
        switch (buttonIndex) {
                
            case 0:{
                
                [NodaTimer invalidate];
                self.timerLabel.text = @"00";
                self.timerLabel2.text = @"00";
                self.timerLabel3.text = @"00";
                self.timerLabel4.text = @"00";
                NodaTimer=nil;
                
                
                // NSUserDefaultsからデータを削除する
                NSUserDefaults *startdate = [NSUserDefaults standardUserDefaults];
                [startdate removeObjectForKey:@"cdate"];
                NSLog(@"日時消去=%d",(int)startdate);
                
                [[UIApplication sharedApplication] cancelAllLocalNotifications];
                
                startdate = [[NSUserDefaults alloc]init];
                

                NSLog(@"はい2");
                
                break;
            }
            case 1:
               
                NSLog(@"いいえ2");
                break;
        }

    }
    
}

-(void)EditDesign{
    _timerLabel.backgroundColor= [UIColor colorWithRed:0 green:0.8 blue:0.2 alpha:1];
    _timerLabel.textAlignment = NSTextAlignmentCenter;
    [_timerLabel setFont:[UIFont fontWithName:@"Futura-Medium" size:80]];

    
    
    
    _timerLabel2.backgroundColor= [UIColor colorWithRed:0.6 green:0 blue:0.8 alpha:1];
    _timerLabel2.textAlignment = NSTextAlignmentCenter;
    [_timerLabel2 setFont:[UIFont fontWithName:@"Futura-Medium" size:70]];

    _timerLabel3.backgroundColor= [UIColor colorWithRed:1 green:0 blue:0.6 alpha:1];
    _timerLabel3.textAlignment = NSTextAlignmentCenter;
    [_timerLabel3 setFont:[UIFont fontWithName:@"Futura-Medium" size:50]];
    

    _timerLabel4.backgroundColor= [UIColor colorWithRed:0.2 green:0 blue:1 alpha:1];
    _timerLabel4.textAlignment = NSTextAlignmentCenter;
    [_timerLabel4 setFont:[UIFont fontWithName:@"Futura-Medium" size:50
                           ]];

    
    
    _NotifiButton.backgroundColor= [UIColor colorWithRed:0.8 green:0.4 blue:0.2 alpha:1];
    _timerStart.backgroundColor= [UIColor colorWithRed:0.8 green:0 blue:0.2 alpha:1];
    _timerReset.backgroundColor= [UIColor colorWithRed:0.2 green:0.6 blue:1 alpha:1];
    
    [_timerStart setTitle:@"Start" forState:UIControlStateNormal];
//    [_timerStart setFont:[UIFont fontWithName:@"Futura-Medium" size:20]];
    _timerStart.titleLabel.font = [UIFont fontWithName:@"Futura-Medium" size:20];
    

    [_timerReset setTitle:@"Reset" forState:UIControlStateNormal];
//    [_timerReset setFont:[UIFont fontWithName:@"Futura-Medium" size:20]];
    _timerReset.titleLabel.font = [UIFont fontWithName:@"Futura-Medium" size:20];
    
    [_NotifiButton setTitle:@"Alarm" forState:UIControlStateNormal];
//    [_NotifiButton setFont:[UIFont fontWithName:@"Futura-Medium" size:20]];
    _NotifiButton.titleLabel.font = [UIFont fontWithName:@"Futura-Medium" size:20];

    
    
    self.DayLabel.text = @"Day";
    _DayLabel.backgroundColor= [UIColor clearColor];
    _DayLabel.textAlignment = NSTextAlignmentCenter;
    [_DayLabel setFont:[UIFont fontWithName:@"Futura-Medium" size:30]];
    
    self.HourLabel.text = @"Hour";
    _HourLabel.backgroundColor= [UIColor clearColor];
    _HourLabel.textAlignment = NSTextAlignmentCenter;
    [_HourLabel setFont:[UIFont fontWithName:@"Futura-Medium" size:20]];
    
    self.MinuteLabel.text = @"Min";
    _MinuteLabel.backgroundColor= [UIColor clearColor];
    _MinuteLabel.textAlignment = NSTextAlignmentCenter;
    [_MinuteLabel setFont:[UIFont fontWithName:@"Futura-Medium" size:15]];
    
    self.SecondLabel.text = @"Sec";
    _SecondLabel.backgroundColor= [UIColor clearColor];
    _SecondLabel.textAlignment = NSTextAlignmentCenter;
    [_SecondLabel setFont:[UIFont fontWithName:@"Futura-Medium" size:15]];




}


@end