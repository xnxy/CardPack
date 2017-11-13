//
//  HorizontalLayout.m
//  CardPack
//
//  Created by dev on 2017/11/11.
//  Copyright © 2017年 dev. All rights reserved.
//

#import "HorizontalLayout.h"

@implementation HorizontalLayout

- (instancetype)init{
    self = [super init];
    if (self) {
        
        self.scrollDirection    = UICollectionViewScrollDirectionHorizontal; //设置为垂直显示
        self.itemSize           = CGSizeMake(kSCREEN_WIDTH - 20, kSCREEN_WIDTH - 20); //设置每个Item 的大小
        self.sectionInset       = UIEdgeInsetsMake(0.f, 0.f, 0.f, 0.f); //item 距离四周的位置
        self.minimumLineSpacing           = 0.f; //item行与行之间的距离
        self.minimumInteritemSpacing      = 0.f;//item 列与列之间的距离
        
    }
    return self;
}


@end
