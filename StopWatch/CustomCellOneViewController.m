//
//  CustomCellOneViewController.m
//  Lens Alarmer
//
//  Created by Shunya Noda on 2014/06/10.
//  Copyright (c) 2014年 Shunya Noda. All rights reserved.
//

#import "CustomCellOneViewController.h"

// カスタムセル
@implementation CustomOneCell

@end

@interface CustomCellOneViewController (){
    NSArray *NodaArray2;
}

@end

@implementation CustomCellOneViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 35;
}

// セルの内容を返す
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CustomOneCell";
    // カスタムセルにキャスト。キャストすることによりカスタムセルのpropertyが使える
    
    CustomOneCell *cell = (CustomOneCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    // セルの値を設定
    cell.label.text = [NSString stringWithFormat:@"%d日後",indexPath.row+1];   // Label
    if (indexPath.row == 29) {
        cell.label.text = @"1ヶ月後";
    }if (indexPath.row == 30) {
        cell.label.text = @"2ヶ月後";
    }if (indexPath.row == 31) {
        cell.label.text = @"3ヶ月後";
    }if (indexPath.row == 32) {
        cell.label.text = @"4ヶ月後";
    }if (indexPath.row == 33) {
        cell.label.text = @"5ヶ月後";
    }if (indexPath.row == 34) {
        cell.label.text = @"半年後";
    }
    
    return cell;
}

- (IBAction)switchCtrl:(id)sender {

}

@end
