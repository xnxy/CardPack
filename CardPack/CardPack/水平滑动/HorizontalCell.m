//
//  HorizontalCell.m
//  CardPack
//
//  Created by dev on 2017/11/11.
//  Copyright © 2017年 dev. All rights reserved.
//

#import "HorizontalCell.h"

@interface HorizontalCell()

@end;

@implementation HorizontalCell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor randomColor];
        
        UILabel *label  = [UILabel new];
        label.textColor = [UIColor whiteColor];
        label.font      = [UIFont boldSystemFontOfSize:20];
        
    }
    return self;
}

@end
