//
//  CardPackCell.h
//  CardPack
//
//  Created by dev on 2017/11/13.
//  Copyright © 2017年 dev. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^HorizontalCollectionViewDelegateWithIndexPath)(id<UICollectionViewDataSource, UICollectionViewDelegate> delegate, NSIndexPath *indexPath);

//水平方向的UICollectionView
@interface HorizontalCollectionView: UICollectionView

@property (nonatomic, strong) NSIndexPath *indexPath;

@end


static NSString *HorizontalCollectionViewCellIdentifier = @"HorizontalCollectionViewCellIdentifier";

@interface CardPackCell : UICollectionViewCell

@property (nonatomic, copy) HorizontalCollectionViewDelegateWithIndexPath horizontalCollectionViewDelegateWithIndexPath;
@property (nonatomic, strong) HorizontalCollectionView *horizontalCollectionView;

@end
