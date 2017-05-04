//
//  CBPopBaseView.h
//  CBPopBaseView
//
//  Created by 这个夏天有点冷 on 2017/5/3.
//  Copyright © 2017年 YLT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CBPopBaseView : UIView

@property (strong, nonatomic) UIView *bgView;

/**
 显示
 */
- (void)showPopView;

/**
 隐藏
 */
- (void)hidenPopView;

@end
