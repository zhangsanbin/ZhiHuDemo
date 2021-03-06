//
//  ZHProfileBlacklistStyleCell.m
//  ZHDemo
//
//  Created by Edward on 13-7-20.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import "ZHProfileBlacklistStyleCell.h"

@interface ZHProfileBlacklistStyleCell ()

@property (nonatomic, strong) UILabel *cellTitleLabel;

@end

@implementation ZHProfileBlacklistStyleCell

@synthesize cellTitleLabel = cellTitleLabel_;

- (id)initWithStyle:(UITableViewCellStyle)style
    reuseIdentifier:(NSString *)reuseIdentifier
{
  self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
  if (self) {
    self.cellTitleLabel = [[UILabel alloc] init];
    [cellTitleLabel_ setFont:[UIFont systemFontOfSize:14.0f]];
    [cellTitleLabel_ setBackgroundColor:[UIColor clearColor]];
    [self.contentView addSubview:cellTitleLabel_];
  }
  return self;
}

- (void)prepareForReuse
{
	[super prepareForReuse];
  
  [[self cellTitleLabel] setText:nil];
}

- (void)bindWithObject:(id)object
{
  NSString *cellTitle = (NSString *)object;
  
  [self.cellTitleLabel setText:cellTitle];
}


- (void)layoutSubviews
{
	[super layoutSubviews];
  
  [self.cellTitleLabel sizeToFit];
  CGSize size = self.bounds.size;
  [self.cellTitleLabel setCenter:CGPointMake(size.width / 2, size.height / 2)];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
  [super setSelected:selected animated:animated];
}

@end
