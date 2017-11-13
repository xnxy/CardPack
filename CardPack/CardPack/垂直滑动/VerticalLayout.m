//
//  VerticalLayout.m
//  CardPack
//
//  Created by dev on 2017/11/11.
//  Copyright © 2017年 dev. All rights reserved.
//

#import "VerticalLayout.h"

@implementation VerticalLayout

- (instancetype)init{
    self = [super init];
    if (self) {
        
        self.scrollDirection    = UICollectionViewScrollDirectionVertical; //设置为垂直显示
        self.itemSize           = CGSizeMake(kSCREEN_WIDTH/2, kSCREEN_WIDTH/2); //设置每个Item 的大小
        self.minimumLineSpacing           = 20.f; //item行与行之间的距离
        self.minimumInteritemSpacing      = 0.f;//item 列与列之间的距离
        
    }
    return self;
}

- (void)prepareLayout{
    [super prepareLayout];
    
}

#pragma mark ---
#pragma mark ---  返回可见区域的的内容尺寸  ---

- (CGSize)collectionViewContentSize
{
    return [super collectionViewContentSize];
}

#pragma mark ---
#pragma mark --- 所以元素的布局属性 重载方法2 ----
//为每个item设置Attributes
- (nullable NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{

    //获取系统布局
    NSArray<UICollectionViewLayoutAttributes *> *oldAttributesAry = [super layoutAttributesForElementsInRect:rect];
    NSMutableArray *tempAry = [NSMutableArray array];
    
    //遍历集合 修改属性
    //让靠近中心线的item 放大 离开的缩小
    [oldAttributesAry enumerateObjectsUsingBlock:^(UICollectionViewLayoutAttributes * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        // --- 垂直 ---
        
        UICollectionViewLayoutAttributes *newAttributes = obj.copy;
        
        //获取每个item 距离可见区域上方的距离 有正负
//        CGFloat topMargin = newAttributes.center.y - self.collectionView.contentOffset.y;
//        //获取collectionView中心位置
//        CGFloat screenCenterY = CGRectGetHeight(self.collectionView.frame)/2;
        //获取每个item 距离中心点的偏移量
    
        
        //        //获取每个item的中心位置
//        CGFloat itemCenterY = newAttributes.center.y;
//        //计算每个item 到中心的距离
//        CGFloat distance = screenCenterY - itemCenterY;
//        //将距离转换成缩放比
//        CGFloat scale = (1 - ABS(distance)) / CGRectGetWidth(self.collectionView.frame);
//
//        //
//        CATransform3D transform3D = CATransform3DIdentity;
//        //缩放
//        transform3D = CATransform3DScale(transform3D, scale, scale, 1);
//        //赋值
//        newAttributes.transform3D = transform3D;
        
        DLog(@"-------newAttributes:%@-------",newAttributes);
        
        [tempAry addObject:newAttributes];
        
    }];
    

    return tempAry;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity {
    CGFloat index = roundf((proposedContentOffset.y + self.collectionView.bounds.size.height / 2 - self.itemSize.height / 2) / self.itemSize.height);
    if (self.scrollDirection == UICollectionViewScrollDirectionVertical) {
        proposedContentOffset.y = self.itemSize.height * index + self.itemSize.height / 2 - self.collectionView.bounds.size.height / 2;
    } else {
        proposedContentOffset.x = self.itemSize.height * index + self.itemSize.height / 2 - self.collectionView.bounds.size.height / 2;
    }
    return proposedContentOffset;
}

#pragma mark ---
#pragma mark --- 滚动的时候会一直调用 ---
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    [super shouldInvalidateLayoutForBoundsChange:newBounds];
    return YES;
}

@end
