//
//  ListItemCell.m
//  Facebook-POP-Animation
//
//  Created by YouXianMing on 15/11/16.
//  Copyright © 2015年 ZiPeiYi. All rights reserved.
//

#import "ListItemCell.h"
#import "UIColor+CustomColors.h"
#import "POP.h"
#import "Item.h"

@interface ListItemCell ()

@property (nonatomic, strong) UILabel  *titlelabel;
@property (nonatomic, strong) UILabel  *subTitleLabel;

@end

@implementation ListItemCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {

    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.accessoryType       = UITableViewCellAccessoryDisclosureIndicator;
        self.selectionStyle      = UITableViewCellSelectionStyleNone;
        
        [self setup];
    }
    
    return self;
}

- (void)setup {

    self.titlelabel      = [[UILabel alloc] initWithFrame:CGRectMake(10, 8, 290, 25)];
    self.titlelabel.font = Font_HYQiHei(20);
    [self addSubview:self.titlelabel];
    
    self.subTitleLabel           = [[UILabel alloc] initWithFrame:CGRectMake(10, 35, 290, 10)];
    self.subTitleLabel.font      = Font_Avenir_Light(8);
    self.subTitleLabel.textColor = [UIColor blackColor];
    [self addSubview:self.subTitleLabel];

}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {

    [super setHighlighted:highlighted animated:animated];
    
    if (self.highlighted) {
        
        POPBasicAnimation *scaleAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPViewScaleXY];
        scaleAnimation.duration           = 0.1f;
        scaleAnimation.toValue            = [NSValue valueWithCGPoint:CGPointMake(0.95, 0.95)];
        [self.titlelabel pop_addAnimation:scaleAnimation forKey:@"scaleAnimation"];
        
    } else {
        
        POPSpringAnimation *scaleAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewScaleXY];
        scaleAnimation.toValue             = [NSValue valueWithCGPoint:CGPointMake(1, 1)];
        scaleAnimation.velocity            = [NSValue valueWithCGPoint:CGPointMake(2, 2)];
        scaleAnimation.springBounciness    = 20.f;
        [self.titlelabel pop_addAnimation:scaleAnimation forKey:@"scaleAnimation"];
    }
}

- (void)loadContent {

    if (_data) {
        
        Item *item              = _data;
        self.titlelabel.text    = item.name;
        self.subTitleLabel.text = [NSString stringWithFormat:@"%@", item.object];
    }
}

@end