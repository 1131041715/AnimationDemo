//
//  PieCross.m
//  AnimationDemo
//
//  Created by 大碗豆 on 17/5/25.
//  Copyright © 2017年 大碗豆. All rights reserved.
//

#import "PieCross.h"
#import "CLCircle.h"

@interface PieCross ()

@end

@implementation PieCross

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CLCircle *c = [[CLCircle alloc] initWithFrame:self.view.frame];
    [self.view addSubview:c];
    
    //设置开始点的位置
    c.StartPointList = @[@0,@(M_PI*2/3),@(M_PI*3/2)];
    
    //设置开始点和结束点的颜色
    c.colorList = @[[UIColor redColor],[UIColor orangeColor],[UIColor blueColor]];
    //设置饼状图CLCircleStyleFill 或者空心圆CLCircleStyleDefault
    c.style = CLCircleStyleFill;
    //设置线宽
    c.lineWidth = 35;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
