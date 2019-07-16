//
//  DragAnimation.m
//  AnimationDemo
//
//  Created by 大碗豆 on 17/5/26.
//  Copyright © 2017年 大碗豆. All rights reserved.
//

#import "DragAnimation.h"
#import "XMHView.h"

@interface DragAnimation ()

@end

@implementation DragAnimation

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    XMHView *view = [[XMHView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
