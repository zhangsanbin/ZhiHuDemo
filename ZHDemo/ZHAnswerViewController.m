//
//  ZHAnswerViewController.m
//  ZHDemo
//
//  Created by Edward on 13-7-11.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//


#import <ZHListView/ZHListView.h>
#import <ZHListView/ZHModel.h>
#import <ZHListView/ZHListViewDelegate.h>
#import "ZHParser.h"
#import "ZHAnswerFactory.h"
#import "ZHAnswerHeaderFactory.h"
#import "ZHAnswerHeaderObject.h"
#import "ZHAnswerCell.h"
#import "ZHAnswerHeaderView.h"
#import "UIImage+RounedImage.h"
#import "ZHAnswerViewController.h"

@interface ZHAnswerViewController ()

@end

@implementation ZHAnswerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    [self setTitle:@"回答"];
  }
  return self;
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  
  [self registerCellClass:[ZHAnswerCell class]];
  
  UIImage *shareImage = [UIImage imageNamed:@"ZHNavigationBarActionIcon.png"];
  self.navigationItem.rightBarButtonItem = [ZHBarButtonItem BarButtonItemWithImage:shareImage
                                                                             block:^(){
    [[[UIAlertView alloc] initWithTitle:@"Answer"
                                message:@"Right"
                               delegate:nil
                      cancelButtonTitle:@"OK"
                      otherButtonTitles:nil, nil] show];
  }];
  
  
	// Header View
  ZHAnswerHeaderView *headerView = [[ZHAnswerHeaderView alloc]
                                    initWithFrame:CGRectMake(0, 0, 320, 1)];
  
  UIImage *resizedImage = [[UIImage imageNamed:@"ZHExploreFavTopBase.png"]
                           stretchableImageWithLeftCapWidth:28
                           topCapHeight:28];
  
	UIImageView *imgView = [[UIImageView alloc] initWithImage:resizedImage];
  [headerView addSubview:imgView];
  
  ZHParser *answerHeaderParser = [ZHAnswerHeaderFactory ParserFactory];
  ZHModel *answerHeaderModel = [answerHeaderParser parser];
  [headerView bindHeaderContentWithObject:answerHeaderModel.object];
  imgView.frame = headerView.bounds;
  
  // Cell
  ZHParser *cellContentsParser = [ZHAnswerFactory ParserFactory];
  ZHModel *cellContentsModel = [cellContentsParser parser];
  
  [self modelDidFinishLoading:cellContentsModel];
  [self.listView setTableHeaderView:headerView];
  [self.listView setSeparatorColor:[UIColor clearColor]];
  [headerView sendSubviewToBack:imgView];
  
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
}

@end
