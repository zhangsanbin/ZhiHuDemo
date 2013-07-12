//
//  ZHListViewController.h
//  ZHDemo
//
//  Created by Edward on 13-7-12.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZHModel.h"

@class ZHModel;
@class ZHListViewDataSource;
@class ZHListViewDelegate;
@class ZHListView;

@interface ZHListViewController : UIViewController

@property (nonatomic) ZHListView *listView;
@property (nonatomic) ZHListViewDelegate *listViewDelegate;
@property (nonatomic) ZHListViewDataSource *listViewDataSource;
@property (nonatomic) ZHModel *model;

- (void)loadListView;

- (void)registerCellClass:(Class)cellClass;

- (void)createListViewDelegate;

- (void)createListViewDataSource;

- (void)numberOfSectionForListView:(NSInteger)sections;

- (void)modelDidFinishLoading:(id<ZHModel>)model;

@end
