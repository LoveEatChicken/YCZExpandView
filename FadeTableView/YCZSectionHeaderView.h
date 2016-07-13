//
//  YCZSectionHeaderView.h
//  FadeTableView
//
//  Created by Crystal on 16/7/8.
//  Copyright © 2016年 crystal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SectionModel.h"

typedef void (^YCZSectionHeaderExpandCallBack) (BOOL isExpanded);

@interface YCZSectionHeaderView : UITableViewHeaderFooterView

@property (nonatomic, strong) UILabel *titleLable;
@property (nonatomic, strong) SectionModel *secModel;
@property (nonatomic, copy) YCZSectionHeaderExpandCallBack ExpandCallBack;

@end
