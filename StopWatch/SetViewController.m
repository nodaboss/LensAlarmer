//
//  SetViewController.m
//  StopWatch
//
//  Created by Shunya Noda on 2014/05/13.
//  Copyright (c) 2014年 Shunya Noda. All rights reserved.
//

#import "SetViewController.h"

@interface SetViewController (){
    UIView *_backView;
    BOOL _visibleFlag;
    UIPickerView *picker;
    NSArray *NodaArray;
}


@end

@implementation SetViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
}
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self EditLabel];
    [self EditButton];
    [self EditButton2];
    [self EditBackview];
    [self SwitchControl];

    NodaArray = [[NSArray alloc] init];

    NodaArray = @[@"装着した時間",@"8時 00分",@"12時 00分",@"16時 00分",@"20時 00分"];
    [self pickerControl];

}





- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}



-(void)EditLabel{
    self.setLabel.text = @"通知";
    self.setLabel2.text = @"通知時間";
}



- (IBAction)setSwitch:(id)sender {
    
        if (self.setSwitchName.on == YES) {
            NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
            [userDefaults setBool:YES forKey:@"the_key"];
            [[NSUserDefaults standardUserDefaults] synchronize];
            NSLog(@"オン");
         }else{
             NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
             [userDefaults removeObjectForKey:@"the_key"];  // KEY_Iを削除する
             NSLog(@"オフ");
        
}}

-(void)SwitchControl{
    
    bool KeyNumber = [[NSUserDefaults standardUserDefaults] objectForKey:@"the_key"];
    
    if (KeyNumber == nil) {
        _setSwitchName.on = NO;
    }

}




-(void)EditButton{
    [_setButton addTarget:self action:@selector(setButtonAct:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_setButton];
}




- (IBAction)setButtonAct:(id)sender {
    NSLog(@"Tap");
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3];
    
    if(_visibleFlag){
        //Viewを表示
        _backView.frame = CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, 300);
        _backView.alpha = 0.0;
        _visibleFlag = NO;
        
    }else{
        //Viewを表示
        _backView.frame = CGRectMake(0, self.view.bounds.size.height-250, self.view.bounds.size.width, 250);
        _backView.alpha = 1.0;
        _visibleFlag = YES;
    }
    [UIView commitAnimations];
}





-(void)EditBackview{
    
    _backView = [[UIView alloc] initWithFrame:CGRectMake(0,self.view.bounds.size.height, self.view.bounds.size.width, 250)];
    _backView.backgroundColor = [UIColor colorWithRed:0.192157 green:0.760784 blue:0.952941 alpha:1.0];
    _backView.alpha = 0.0;
    [self.view addSubview:_backView];
    _visibleFlag = NO;
    
    // UIPickerのインスタンス化
    picker = [[UIPickerView alloc]init];
    
    // デリゲートを設定
      picker.delegate = self;
    
    // データソースを設定
    picker.dataSource = self;
    
    // 選択インジケータを表示
    picker.showsSelectionIndicator = YES;
    
    // UIPickerのインスタンスをビューに追加
    [_backView addSubview:picker];
    

}


/**
 * ピッカーに表示する列数を返す
 */
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

/**
 * ピッカーに表示する行数を返す
 */
- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component
{
    return NodaArray.count;
}

/**
 * 行のサイズを変更
 */
- (CGFloat)pickerView:(UIPickerView *)pickerView
    widthForComponent:(NSInteger)component
{
    switch (component) {
        case 0: // 1列目
            return 200.0;
            break;
            default:
            return 0;
            break;
    }
}

/**
 * ピッカーに表示する値を返す
 */
- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
        return [NSString stringWithFormat:@"%@",NodaArray[row]];
}

/**
 * ピッカーの選択行が決まったとき
 */
- (void)pickerView:(UIPickerView *)pickerView
      didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    // 1列目の選択された行数を取得
    NSInteger val = [pickerView selectedRowInComponent:0];
    NSLog(@"%d行目が選択", val);
    
    NSUserDefaults *picksave = [NSUserDefaults standardUserDefaults];
    [picksave setInteger:val forKey:@"KEY_time"];
    NSLog(@"ピッカー保存");

}

-(void)pickerControl{
    
    NSInteger i = [[NSUserDefaults standardUserDefaults] integerForKey:@"KEY_time"];
    NSLog(@"picker=%d",i);

    if (i == 0) {
        [picker selectRow:0 inComponent:0 animated:NO];
    }if (i == 1) {
        [picker selectRow:1 inComponent:0 animated:NO];
    }if (i == 2) {
        [picker selectRow:2 inComponent:0 animated:NO];
    }if (i == 3) {
        [picker selectRow:3 inComponent:0 animated:NO];
    }if (i == 4) {
        [picker selectRow:4 inComponent:0 animated:NO];
    }
}


-(void)EditButton2{
    [_setButton2 setTitle:@"日数設定" forState:UIControlStateNormal];
}
- (IBAction)setButtonAct2:(id)sender {
//    
//    UITableViewController *SetTableViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"CustomCellOneViewController"];
//    [self presentViewController:SetTableViewController animated:YES completion:nil];
}




@end
