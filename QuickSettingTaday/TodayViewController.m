//
//  TodayViewController.m
//  QuichSettingExtention
//
//  Created by 明桐的Mac on 16/11/7.
//  Copyright © 2016年 小谩的Mac. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>
#import "QuickHeader.h"

@interface TodayViewController () <NCWidgetProviding>

@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.preferredContentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, 100);
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(-20, 0, [UIScreen mainScreen].bounds.size.width + 10, 120)];
    imageView.image = [UIImage imageNamed:@"未标题-1"];//自定义 750 与200像素图片
    imageView.contentMode = UIViewContentModeScaleAspectFill;  
    [self.view addSubview:imageView];
    [QueickSettingTool initInTerPolationMotionEffectWithEffectImageView:imageView BaseView:nil];
    [QueickSettingTool configSnowEmitterLayerWithdefuetView:self.view];
    NSArray *imageArr = @[@"无线网",@"蜂窝数据",@"电池",@"定位"];
    for (int i = 0; i < 4; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake([UIScreen mainScreen].bounds.size.width / 4 * i + 15, 25, 50, 50);
        [btn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",imageArr[i]]] forState:UIControlStateNormal];
        btn.tag = i;
        [btn addTarget:self action:@selector(action:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    }
    
}

- (void)action:(UIButton*)btn {
    switch (btn.tag) {
        case 0:
            [QueickSettingTool initPrepareJumpWithPrefsStr:@"Prefs:root=WIFI"];
            break;
        case 1:
            [QueickSettingTool initPrepareJumpWithPrefsStr:@"Prefs:root=MOBILE_DATA_SETTINGS_ID"];
            break;
        case 2:
            [QueickSettingTool initPrepareJumpWithPrefsStr:@"Prefs:root=BATTERY_USAGE"];
            break;
        case 3:
            [QueickSettingTool initPrepareJumpWithPrefsStr:@"Prefs:root=Privacy&path=LOCATION"];
            break;
        default:
            break;
    }
    
}

- (UIEdgeInsets)widgetMarginInsetsForProposedMarginInsets:(UIEdgeInsets)defaultMarginInsets {
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // Perform any setup necessary in order to update the view.
    
    // If an error is encountered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData
    
    completionHandler(NCUpdateResultNoData);
}

@end
