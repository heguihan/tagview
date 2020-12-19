//
//  SelectedTableViewCell.m
//  testDHFunction
//
//  Created by admin on 2020/12/15.
//

#import "SelectedTableViewCell.h"

@implementation SelectedTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self configSunViews];
    }
    return self;
}

-(void)configSunViews
{
    self.lab = [[UILabel alloc]initWithFrame:CGRectMake(20, 5, 150, 20)];
    [self.contentView addSubview:self.lab];
    
    self.imageV = [[UIImageView alloc]initWithFrame:CGRectMake(300, 5, 20, 20)];
    [self.contentView addSubview:self.imageV];
    self.imageV.image = [UIImage imageNamed:@"gou.png"];
    
}

@end
