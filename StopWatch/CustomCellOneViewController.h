//
//  CustomCellOneViewController.h
//  Lens Alarmer
//
//  Created by Shunya Noda on 2014/06/10.
//  Copyright (c) 2014年 Shunya Noda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCellOneViewController : UITableViewController
- (IBAction)BuckButton:(id)sender;

- (IBAction)switchCtrl:(id)sender;

@end

// カスタムセル
@interface CustomOneCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UISwitch *switchCtrl;
@end