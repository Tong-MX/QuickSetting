//
//  ViewController.m
//  QuickSetting
//
//  Created by 明桐的Mac on 16/11/7.
//  Copyright © 2016年 小谩的Mac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIAlertViewDelegate> {
    NSString *recodeTitle;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [QueickSettingTool configSnowEmitterLayerWithdefuetView:self.view];
}

- (void)viewWillAppear:(BOOL)animated {
    if (!self.show3DTouch) {
        FirstViewController *controller = [[FirstViewController alloc] init];
        controller.tag = 4;
        controller.show3DTouch = self.show3DTouch;
        [self.navigationController pushViewController:controller animated:YES];
    }
}

@end
