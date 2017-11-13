//
//  HorizontalCell.m
//  CardPack
//
//  Created by dev on 2017/11/13.
//  Copyright © 2017年 dev. All rights reserved.
//

#import "HorizontalCell.h"

@implementation HorizontalCell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        UIView *view = [UIView new];
        view.backgroundColor = [UIColor randomColor];
        [view setCornerRadius:10];
        [view setBorderWidth:1 andColor:[UIColor lightGrayColor]];
        
        [self addSubview:view];
        
        //layout
        [view makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
        
    }
    return self;
}

@end
