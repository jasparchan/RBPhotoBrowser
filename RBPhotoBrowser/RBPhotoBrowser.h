//
//  RBPhotoBrowser.h
//  RBPhotoBrowserDemo
//
//  Created by robin on 2018/1/31.
//  Copyright © 2018年 RobinChan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RBPhotoItem.h"

@protocol RBImageManager;

@interface RBPhotoBrowser : UIViewController

+ (instancetype)browserWithPhotoItems:(NSArray<RBPhotoItem *> *)photoItems selectedIndex:(NSUInteger)selectedIndex;
- (instancetype)initWithPhotoItems:(NSArray<RBPhotoItem *> *)photoItems selectedIndex:(NSUInteger)selectedIndex;
- (void)showFromViewController:(UIViewController *)vc;

@end


