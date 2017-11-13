//
//  VerticalHorizontalLayout.h
//  CardPack
//
//  Created by dev on 2017/11/11.
//  Copyright © 2017年 dev. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^CollectionViewScrollToIndex)(NSInteger index);

@interface VerticalHorizontalLayout : UICollectionViewFlowLayout

@property (nonatomic, copy) CollectionViewScrollToIndex collectionViewScrollToIndex;

@property (nonatomic, assign) CGFloat itemAlpha; //非第一个item 的alpha

@property (nonatomic, assign) CGFloat threeDimensionalScale; //3D 缩放值

@property (nonatomic, assign) CGFloat cycleIndex;

@end
