//
//  ViewController.m
//  RuntimePractice_Demo
//
//  Created by admin on 16/6/21.
//  Copyright © 2016年 AlezJi. All rights reserved.
//

#import "ViewController.h"
#import "PresentViewController.h"


@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    _tableView.tableFooterView = [UIView new];
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    
}

#pragma mark - UITableViewDataSource, UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier
                                                            forIndexPath:indexPath];
    
    
    cell.textLabel.font = [UIFont fontWithName:@"Bradley Hand" size:15];
    
    if (indexPath.row == 0) {
        cell.textLabel.text = [NSString stringWithFormat:@"展示loadingView"];
    }else if (indexPath.row == 1){
        cell.textLabel.text = [NSString stringWithFormat:@"展示BlankView"];
    }else{
        cell.textLabel.text = [NSString stringWithFormat:@"展示FailView"];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    PresentViewController *dest = [self.storyboard instantiateViewControllerWithIdentifier:@"PresentViewController"];
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    dest.title = cell.textLabel.text;
    
    dest.showType = (ShowType)indexPath.row;
    [self.navigationController pushViewController:dest animated:YES];
}

@end
