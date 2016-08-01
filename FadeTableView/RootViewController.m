//
//  RootViewController.m
//  FadeTableView
//
//  Created by Crystal on 16/7/8.
//  Copyright © 2016年 crystal. All rights reserved.
//

#import "RootViewController.h"
#import "YCZSectionHeaderView.h"
#include "SectionModel.h"

NSString *const headerViewIdentifier = @"headerViewIdentifier";
NSString *const cellIdentifer = @"cellIdentifer";

@interface RootViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataSource;

@end

#pragma mark lifecyclemethod

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupDataSource];
    [self setupUI];
}

- (void)sourceTreeTest1 {
    
    
}

- (void)sourceTreeTest2 {
    
    
}

- (void)setupDataSource {
    
    _dataSource = [NSMutableArray array];
    
    for (int i = 0; i < 5; i++) {
        
        SectionModel *secModel = [[SectionModel alloc] init];
        secModel.sectionTitle = [NSString stringWithFormat:@"Crystal%d",i];

        [_dataSource addObject:secModel];
    }
    
    for (int i = 0; i < 5; i++) {
        
        NSMutableArray *cellArray = [NSMutableArray array];
        
        for (int j = 0; j <= i; j++) {
            
            [cellArray addObject:[NSString stringWithFormat:@"Cell%d",j]];
        }
        
        SectionModel *secModel = _dataSource[i];
        secModel.cellDataSource = cellArray;
    }
    
}

- (void)setupUI {
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self.tableView registerClass:[YCZSectionHeaderView class] forHeaderFooterViewReuseIdentifier:headerViewIdentifier];
    
    [self.view addSubview:self.tableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return [_dataSource count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    SectionModel *secModel = _dataSource[section];
    NSMutableArray *cellArray = secModel.cellDataSource;
    
    return secModel.isExpand ? [cellArray count] : 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifer];
    
    if (!cell) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifer];
    }
    
    SectionModel *secModel = _dataSource[indexPath.section];
    
    [cell.textLabel setText:secModel.cellDataSource[indexPath.row]];
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    YCZSectionHeaderView *headerView = [self.tableView dequeueReusableHeaderFooterViewWithIdentifier:headerViewIdentifier];
    
    SectionModel *secModel = _dataSource[section];
    
    headerView.secModel = secModel;
    [headerView.titleLable setText:secModel.sectionTitle];
    headerView.ExpandCallBack = ^(BOOL isExpand) {
        
        secModel.isExpand = isExpand;
        [tableView reloadSections:[NSIndexSet indexSetWithIndex:section] withRowAnimation:UITableViewRowAnimationFade];
    };

    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 44.0f;
}

@end
