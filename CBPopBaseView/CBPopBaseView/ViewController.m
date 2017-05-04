//
//  ViewController.m
//  CBPopBaseView
//
//  Created by 这个夏天有点冷 on 2017/5/3.
//  Copyright © 2017年 YLT. All rights reserved.
//

#import "ViewController.h"
#import "myView.h"

@interface ViewController ()

@property (strong, nonatomic) myView *view1;
- (IBAction)addButtonClicked:(UIButton *)sender;

@end

@implementation ViewController

- (myView *)view1
{
    if (!_view1) {
        _view1 = [[[NSBundle mainBundle] loadNibNamed:@"myView" owner:nil options:nil] lastObject];
        _view1.frame = CGRectMake(0, 0, 300, 300);
    }
    return _view1;
}

- (IBAction)addButtonClicked:(UIButton *)sender {
    [self.view1 showPopView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    if (self.view1) {
        [self.view1 hidenPopView];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
