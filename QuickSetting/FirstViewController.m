//
//  FirstViewController.m
//  QuickSetting
//
//  Created by 明桐的Mac on 16/11/8.
//  Copyright © 2016年 小谩的Mac. All rights reserved.
//

#import "FirstViewController.h"
#import "QuickHeader.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    switch (self.tag) {
        case 0:
            [QueickSettingTool initPrepareJumpWithPrefsStr:@"Prefs:root=General&path=About"];
            break;
        case 1:
            [QueickSettingTool initPrepareJumpWithPrefsStr:@"Prefs:root=General&path=ACCESSIBILITY"];
            break;
            
        case 2:
            [QueickSettingTool initPrepareJumpWithPrefsStr:@"Prefs:root=Bluetooth"];
            break;
            
        case 3:
            [QueickSettingTool initPrepareJumpWithPrefsStr:@"Prefs:root=General&path=STORAGE_ICLOUD_USAGE/DEVICE_STORAGE"];
            break;
        case 4:
            if (!self.show3DTouch) {
                [QueickSettingTool initPrepareJumpWithPrefsStr:@"Prefs:root=LOCATION_SERVICES"];
            }
        default:
            break;
    }
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
