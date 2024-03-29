//
//  AdsViewDemo.m
//  AnimationDemo
//
//  Created by 大碗豆 on 17/5/25.
//  Copyright © 2017年 大碗豆. All rights reserved.
//

#import "AdsViewDemo.h"

#import "AppDelegate.h"
#import "WJAdsView.h"
@interface AdsViewDemo ()<WJAdsViewDelegate>
{
    
    
}

@end

@implementation AdsViewDemo

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor brownColor];
    [self performSelector:@selector(showAdsView)
               withObject:nil
               afterDelay:1];
}


- (void)showAdsView{
    //    [_infoCard show];
    
    AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
    app.window.backgroundColor = [UIColor colorWithWhite:20
                                                   alpha:0.3];
    WJAdsView *adsView = [[WJAdsView alloc] initWithWindow:app.window];
    adsView.tag = 10;
    adsView.delegate = self;
    
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for (int i = 0; i < 2; i ++) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0,adsView.mainContainView.frame.size.width, adsView.mainContainView.frame.size.width)];
        label.font = [UIFont boldSystemFontOfSize:20.0];
        label.textAlignment = NSTextAlignmentCenter;
        label.text = [NSString stringWithFormat:@"视图 %d", i+1];
        label.textColor = [UIColor redColor];
        label.backgroundColor = [UIColor colorWithRed:0 green:183.0/255.0 blue:238.0/255.0 alpha:1.000];
        label.layer.cornerRadius = adsView.mainContainView.frame.size.width/2;
        label.layer.masksToBounds = YES;
        [array addObject:label];
    }
    [self.view addSubview:adsView];
    adsView.containerSubviews = array;
    [adsView showAnimated:YES];
}

- (void)hide{
    WJAdsView *adsView = (WJAdsView *)[self.view viewWithTag:10];
    [adsView hideAnimated:YES];
}
- (void)wjAdsViewDidAppear:(WJAdsView *)view{
    NSLog(@"视图出现");
}
- (void)wjAdsViewDidDisAppear:(WJAdsView *)view{
    NSLog(@"视图消失");
}

- (void)wjAdsViewTapMainContainView:(WJAdsView *)view currentSelectIndex:(long)selectIndex{
    NSLog(@"点击主内容视图:--%ld",selectIndex);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
