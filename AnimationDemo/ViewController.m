//
//  ViewController.m
//  AnimationDemo
//
//  Created by 大碗豆 on 17/5/25.
//  Copyright © 2017年 大碗豆. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)NSMutableArray *dataArr;
@property(nonatomic,strong)UITableView *tabView;

@end

@implementation ViewController

- (NSMutableArray *)dataArr
{
    if (_dataArr == nil) {
        _dataArr = [NSMutableArray new];
        NSArray *arr = [NSArray new];
                arr = @[@"BethelCross",@"PieCross",@"PopoerMenu",@"ClickPopoer",@"ArrowsPopoer",@"RoundButton",@"AdsViewDemo",@"ColorfulAnimation",@"TriangleAlertView",@"DragAnimation",@"HandclapAnimation",@"Masaike"];
                _dataArr = [NSMutableArray arrayWithArray:arr];
    }
    return _dataArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"动画";
    [self loadDefaultSetting];
}

- (void)loadDefaultSetting
{
    UITableView *tab = [UITableView new];
    [self.view addSubview:tab];
    [tab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.leading.bottom.trailing.equalTo(self.view);
    }];
    self.tabView = tab;
    tab.dataSource = self;
    tab.delegate = self;
    tab.rowHeight = 50;
    tab.showsVerticalScrollIndicator = NO;
    tab.showsHorizontalScrollIndicator = NO;
    tab.separatorStyle = UITableViewCellSeparatorStyleNone;
    tab.backgroundColor = ANYColorWithRGB(239, 239, 239);

}


#pragma mark -UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = self.dataArr[indexPath.row];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    
    
    UIImageView *imag = [UIImageView new];
    imag.frame = CGRectMake(0, 47, ANYScreenWidth, 3);
    imag.backgroundColor = ANYColorWithRGB(239, 239, 239);
    [cell.contentView addSubview:imag];
    return cell;
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSString *vcName = self.dataArr[indexPath.row];
    Class clsVC = NSClassFromString(vcName);
    UIViewController *vc = [clsVC new];
    vc.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
