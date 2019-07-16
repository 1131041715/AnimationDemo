//
//  ClickPopoer.m
//  AnimationDemo
//
//  Created by 大碗豆 on 17/5/25.
//  Copyright © 2017年 大碗豆. All rights reserved.
//

#import "ClickPopoer.h"
#import "RXRotateButtonOverlayView.h"

#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

@interface ClickPopoer ()<RXRotateButtonOverlayViewDelegate>

@property (nonatomic, strong) RXRotateButtonOverlayView* overlayView;
@property (nonatomic, strong) UIButton* btn;

@end

@implementation ClickPopoer

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.btn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - action
- (void)btnClicked:(UIButton*)btn
{
    [self.view addSubview:self.overlayView];
    [self.overlayView show];
}

#pragma mark - RXRotateButtonOverlayViewDelegate
- (void)didSelected:(NSUInteger)index
{
    NSLog(@"clicked %zd btn",index);
}

#pragma mark - getter
- (UIButton *)btn
{
    if (_btn == nil) {
        _btn = [[UIButton alloc] initWithFrame:CGRectMake((SCREEN_WIDTH - 100) / 2.0,SCREEN_HEIGHT - 300, 100, 44)];
        [_btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [_btn setBackgroundColor:[UIColor greenColor]];
        [_btn setTitle:@"click me !" forState:UIControlStateNormal];
        [_btn.layer setCornerRadius:5];
    }
    return _btn;
}
- (RXRotateButtonOverlayView *)overlayView
{
    if (_overlayView == nil) {
        _overlayView = [[RXRotateButtonOverlayView alloc] init];
        [_overlayView setTitles:@[@"test1",@"test2",@"test3"]];
        [_overlayView setTitleImages:@[@"first",@"second",@"third"]];
        [_overlayView setDelegate:self];
        [_overlayView setFrame:self.view.bounds];
    }
    return _overlayView;
}

@end
