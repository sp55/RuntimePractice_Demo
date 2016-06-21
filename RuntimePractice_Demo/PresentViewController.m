//
//  PresentViewController.m
//  RuntimePractice_Demo
//
//  Created by admin on 16/6/21.
//  Copyright © 2016年 AlezJi. All rights reserved.
//

#import "PresentViewController.h"
#import "UIViewController+Presenter.h"


@interface PresentViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation PresentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    
    self.tableView.dataSource = self;
    _tableView.tableFooterView = [UIView new];
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    
    /**
     *  开始获取数据（假装
     */
    [self startFetchData];
}

- (void)startFetchData{
    [self startLoading];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self stopLoading];
        if (_showType == ShowTypeLoadingAndBlank) {
            [self showBlankView:self.view message:@"我们中出了一个叛徒"];
        }else if (_showType == ShowTypeLoadingAndFaiture){
            [self showFailureViewAndRecallHanlde:^{
                [self startFetchData];
            } inContainer:self.view];
        }
    });
}


#pragma mark - UITableViewDataSource, UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier
                                                            forIndexPath:indexPath];
    
    cell.textLabel.text = [NSString stringWithFormat:@"current row is %d",(int)indexPath.row];
    cell.textLabel.font = [UIFont fontWithName:@"Bradley Hand" size:18];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
@end
