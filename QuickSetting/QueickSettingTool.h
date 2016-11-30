//
//  QueickSettingTool.h
//  QueickSettingTool
//
//  Created by 明桐的Mac on 16/11/9.
//  Copyright © 2016年 小谩的Mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface QueickSettingTool : NSObject
/*
@prarm 跳转的方法
@prarm prefsStr 传入要跳转的字符串
 */
+ (void)initPrepareJumpWithPrefsStr:(NSString*)prefsStr;

/*
@prarm 雪花方法
@prarm defuetView 传入要显示的界面
 */
+ (void)configSnowEmitterLayerWithdefuetView:(UIView*)defuetView;

/*
 @prarm 重力方法
 @prarm effectImageView 传入要显示的图片
 @prarm baseView        如果有传入要最底层的界面没有传入nil
 */
+ (void)initInTerPolationMotionEffectWithEffectImageView:(UIImageView*)effectImageView BaseView:(UIView*)baseView;
@end
