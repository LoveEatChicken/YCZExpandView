//
//  SectionModel.h
//  FadeTableView
//
//  Created by Crystal on 16/7/8.
//  Copyright © 2016年 crystal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SectionModel : NSObject

@property (nonatomic, copy) NSString *sectionTitle;
@property (nonatomic, assign) BOOL isExpand;
@property (nonatomic, strong) NSMutableArray *cellDataSource;

@end

