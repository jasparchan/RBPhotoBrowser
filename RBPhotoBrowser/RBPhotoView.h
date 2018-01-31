//
//  RBPhotoView.h
//  RBPhotoBrowserDemo
//
//  Created by robin on 2018/1/31.
//  Copyright © 2018年 RobinChan. All rights reserved.
//

#import <UIKit/UIKit.h>


extern const CGFloat kRBPhotoViewPadding;

@protocol RBImageManager;
@class RBPhotoItem;

@interface RBPhotoView : UIScrollView

@property (nonatomic, strong, readonly) UIImageView *imageView;
@property (nonatomic, strong, readonly) RBPhotoItem *item;

- (instancetype)initWithFrame:(CGRect)frame imageManager:(id<RBImageManager>)imageManager;
- (void)setItem:(RBPhotoItem *)item determinate:(BOOL)determinate;
- (void)resizeImageView;
- (void)cancelCurrentImageLoad;


@end
