//
//  ColorfulAnimation.m
//  AnimationDemo
//
//  Created by 大碗豆 on 17/5/25.
//  Copyright © 2017年 大碗豆. All rights reserved.
//

#import "ColorfulAnimation.h"
#import "SDMoreCicle.h"

@interface ColorfulAnimation ()

@end

@implementation ColorfulAnimation

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"点击屏幕试试";
    [self.view addSubview:[SDMoreCicle viewWithCicle:self.view.frame]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
