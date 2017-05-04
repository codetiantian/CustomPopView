//
//  CBPopBaseView.m
//  CBPopBaseView
//
//  Created by 这个夏天有点冷 on 2017/5/3.
//  Copyright © 2017年 YLT. All rights reserved.
//

#import "CBPopBaseView.h"

#define MainSize [UIScreen mainScreen].bounds.size
#define KEYWINDOW    [UIApplication sharedApplication].keyWindow

#define MinScale  0.001

@implementation CBPopBaseView

- (UIView *)bgView
{
    if (!_bgView) {
        _bgView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _bgView.backgroundColor = [UIColor blackColor];
        _bgView.alpha = 0;
        
        //  添加点击手势
        UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
        [_bgView addGestureRecognizer:tapGes];
    }
    
    return _bgView;
}

- (void)setUpPopView
{
    self.center = CGPointMake(MainSize.width / 2.0, MainSize.height / 2.0);
    self.transform = CGAffineTransformMakeScale(MinScale, MinScale);
    self.layer.cornerRadius = 5.0f;
    self.layer.masksToBounds = YES;
}

- (void)showPopView
{
    if (![self.bgView isDescendantOfView:KEYWINDOW]) {
        [KEYWINDOW addSubview:_bgView];
    }
    
    if (![self isDescendantOfView:KEYWINDOW]) {
        [self setUpPopView];
        [KEYWINDOW addSubview:self];
    }
    
    [UIView animateWithDuration:0.3 delay:0.0 usingSpringWithDamping:0.7 initialSpringVelocity:15 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.bgView.alpha = 0.6;
        self.transform = CGAffineTransformIdentity;
    } completion:nil];
}

- (void)hidenPopView
{
    [UIView animateWithDuration:0.3 delay:0.0 usingSpringWithDamping:0.7 initialSpringVelocity:15 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.bgView.alpha = 0.0;
        self.transform = CGAffineTransformMakeScale(0, 0);
    } completion:^(BOOL finished) {
        if (finished) {
            [self.bgView removeFromSuperview];
            [self removeFromSuperview];
        }
    }];
}

- (void)tap:(UITapGestureRecognizer *)tapGes
{
    [self endEditing:YES];
    [self hidenPopView];
}

@end
