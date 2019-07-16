//
//  TriangleAlertView.m
//  AnimationDemo
//
//  Created by 大碗豆 on 17/5/25.
//  Copyright © 2017年 大碗豆. All rights reserved.
//

#import "TriangleAlertView.h"
#import "SJJTriangleAlertView.h"

@interface TriangleAlertView ()

@end

@implementation TriangleAlertView

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    UIButton *btn = [UIButton new];
    btn.frame = CGRectMake(100, 250, 100, 50);
    [btn setTitle:@"点我" forState:(UIControlStateNormal)];
    [btn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitleColor:[UIColor redColor] forState:(UIControlStateNormal)];
    
    [self.view addSubview:btn];
    
}

- (void)btnAction{
    NSArray *array = @[@"1、每天签到可获得5个金币，连续签到7天可以获得额外15金币的奖励。",
                       @"2、金币可以用于订单结算时抵扣现金或者参与抽奖活动。",
                       @"3、每个金币可以抵扣0.01元。"];
    [SJJTriangleAlertView showWithFrame:CGRectMake(150, 64, 183, 160) WithTextArray:array];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
