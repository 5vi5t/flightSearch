//
//  CustomTableViewCell.m
//  lesson2
//
//  Created by 5vi5t on 16.10.2020.
//

#import "CustomTableViewCell.h"

@implementation CustomTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
  self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
  if (self)
  {
    
    UILabel *leftLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, [UIScreen mainScreen].bounds.size.width / 2.0, 44.0)];
    leftLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:leftLabel];
    self.leftLabel = leftLabel;
    
    UILabel *rightLabel = [[UILabel alloc] initWithFrame: CGRectMake([UIScreen mainScreen].bounds.size.width / 2.0, 0.0, [UIScreen mainScreen].bounds.size.width / 2.0, 44.0)];
    rightLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:rightLabel];
    self.rightLabel = rightLabel;
  }
  return self;
}


@end
