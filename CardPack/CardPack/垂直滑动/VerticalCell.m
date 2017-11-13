//
//  VerticalCell.m
//  CardPack
//
//  Created by dev on 2017/11/11.
//  Copyright © 2017年 dev. All rights reserved.
//

#import "VerticalCell.h"

@interface VerticalCell()

@property(nonatomic, strong) UIImageView *imgV;

@end

@implementation VerticalCell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor randomColor];
    }
    return self;
}

@end
