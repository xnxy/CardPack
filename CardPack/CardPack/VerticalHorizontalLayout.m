//
//  VerticalHorizontalLayout.m
//  CardPack
//
//  Created by dev on 2017/11/11.
//  Copyright © 2017年 dev. All rights reserved.
//

#import "VerticalHorizontalLayout.h"

@interface VerticalHorizontalLayout()

@end

@implementation VerticalHorizontalLayout

- (instancetype)init{
    self = [super init];
    if (self) {
        
    }
    return self;
}

// 该方法会自动重载
- (void)prepareLayout
{
    [super prepareLayout];
}

////以下三个方法必须一起重载  分别是返回可见区域尺寸    获取可见区域内可见的item数组    当滚动的时候一直重绘collectionView
#pragma mark 重载方法1
// 返回可见区域的的内容尺寸
- (CGSize)collectionViewContentSize
{
    return [super collectionViewContentSize];
}

@end
