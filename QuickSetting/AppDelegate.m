//
//  AppDelegate.m
//  QuickSetting
//
//  Created by 明桐的Mac on 16/11/7.
//  Copyright © 2016年 小谩的Mac. All rights reserved.
//

#import "AppDelegate.h"
//3Dtouch


#import <MobileCoreServices/MobileCoreServices.h>
@interface AppDelegate ()
@property (nonatomic,strong) ViewController *mainbarVC;
@property (nonatomic,strong) UINavigationController *nav;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //此app只使用有3dtouch的手机否者会引起崩溃
    
    _window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    _window.backgroundColor = [UIColor whiteColor];
    
    
    
    
    _mainbarVC  =  [[ViewController alloc] init];
    _nav = [[UINavigationController alloc] initWithRootViewController:_mainbarVC];
    _nav.navigationBar.translucent = NO;
    _window.rootViewController = _nav;
    [_window makeKeyAndVisible];

    [self show3DtouchMethod];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    
}

+ (AppDelegate *)appDelegate {
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}

- (void)applicationDidEnterBackground:(UIApplication *)application {

}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    [_mainbarVC viewWillAppear:YES];
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark 自定义3Dtouch方法与图片

- (void)show3DtouchMethod{
    
    UIApplicationShortcutIcon *iconCircle = [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeHome];
    UIApplicationShortcutItem *shortItemCircle = [[UIApplicationShortcutItem alloc] initWithType:OnceDTouch localizedTitle:WirelessNetwork localizedSubtitle:nil icon:iconCircle userInfo:nil];
    
    UIApplicationShortcutIcon *iconAnswer = [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeDate];
    UIApplicationShortcutItem * shortItemAnswer = [[UIApplicationShortcutItem alloc] initWithType:TwoDTouch localizedTitle:Honeycomb localizedSubtitle:nil icon:iconAnswer userInfo:nil];
    
    UIApplicationShortcutIcon *iconDailyKnowledge = [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeMail];
    UIApplicationShortcutItem * shortItemDailyKnowledge = [[UIApplicationShortcutItem alloc] initWithType:ThreeDTouch localizedTitle:Battery localizedSubtitle:nil icon:iconDailyKnowledge userInfo:nil];
    
    UIApplicationShortcutIcon *iconWeight = [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeShuffle];
    UIApplicationShortcutItem * shortItemWeight = [[UIApplicationShortcutItem alloc] initWithType:FourTouchWeight localizedTitle:LocationService localizedSubtitle:nil icon:iconWeight userInfo:nil];
    
    NSArray *shortItems = [[NSArray alloc] initWithObjects:shortItemWeight, shortItemDailyKnowledge, shortItemAnswer, shortItemCircle, nil];
    
    if (shortItems.count > 0) {
        [[UIApplication sharedApplication] setShortcutItems:shortItems];
    }
}

#pragma mark 3Dtouch代理方法

- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler{
    _mainbarVC.show3DTouch = YES;
    [self iSShow3DTouchMethod:shortcutItem];
}

#pragma mark 显示3Dtouch方法

- (void)iSShow3DTouchMethod:(UIApplicationShortcutItem *)shortcutItem{
    //判断先前我们设置的唯一标识
    if([shortcutItem.type isEqualToString:OnceDTouch]){
        FirstViewController *controller = [[FirstViewController alloc] init];
        controller.tag = 0;
        [self.nav pushViewController:controller animated:YES];
    }else if ([shortcutItem.type isEqualToString:TwoDTouch]){
        FirstViewController *controller = [[FirstViewController alloc] init];
        controller.tag = 1;
        [self.nav pushViewController:controller animated:YES];
    }else if ([shortcutItem.type isEqualToString:ThreeDTouch]){
        FirstViewController *controller = [[FirstViewController alloc] init];
        controller.tag = 2;
        [self.nav pushViewController:controller animated:YES];
    }else if ([shortcutItem.type isEqualToString:FourTouchWeight]){
        FirstViewController *controller = [[FirstViewController alloc] init];
        controller.tag = 3;
        [self.nav pushViewController:controller animated:YES];
    }
}

@end
