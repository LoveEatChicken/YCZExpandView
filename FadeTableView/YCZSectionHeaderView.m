//
//  YCZSectionHeaderView.m
//  FadeTableView
//
//  Created by Crystal on 16/7/8.
//  Copyright © 2016年 crystal. All rights reserved.
//

#import "YCZSectionHeaderView.h"

#define W [UIScreen mainScreen].bounds.size.width

@interface YCZSectionHeaderView ()

@property (nonatomic, strong) UIButton *sectionButton;
@property (nonatomic, strong) UIImageView *indicatorImageView;
@property (nonatomic, assign) BOOL isExpand;

@end

@implementation YCZSectionHeaderView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        
        [self.contentView addSubview:self.indicatorImageView];
        [self.contentView addSubview:self.titleLable];
        [self.contentView addSubview:self.sectionButton];
    }
    
    return self;
}

- (UIButton *)sectionButton {

    if (!_sectionButton) {
        
        _sectionButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, W, 44)];
        [_sectionButton addTarget:self action:@selector(clickSection:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _sectionButton;
}

- (UILabel *)titleLable {
    
    if (!_titleLable) {
        
        _titleLable = [[UILabel alloc] initWithFrame:CGRectMake(60, 0, W - 60, 44)];
    }
    
    return _titleLable;
}

- (UIImageView *)indicatorImageView {
    
    if (!_indicatorImageView) {
        
        _indicatorImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 13.5, 10, 17)];
        [_indicatorImageView setImage:[UIImage imageNamed:@"indicator"]];
    }
    
    return _indicatorImageView;
}

- (void)setSecModel:(SectionModel *)secModel {
    
    _secModel = secModel;
    
    if (self.secModel.isExpand) {
        
        self.indicatorImageView.transform = CGAffineTransformMakeRotation(M_PI_2);
    } else {
        
        self.indicatorImageView.transform = CGAffineTransformIdentity;
    }
}

- (void)clickSection:(UIButton *)sectionButton {
    
    self.secModel.isExpand = !self.secModel.isExpand;
    
    if (self.secModel.isExpand) {
        
        self.indicatorImageView.transform = CGAffineTransformMakeRotation(M_PI_2);
    } else {
        
        self.indicatorImageView.transform = CGAffineTransformIdentity;
    }
    
    self.ExpandCallBack(self.secModel.isExpand);
}

@end
