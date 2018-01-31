//
//  RBImageManagerProtocol.h
//  RBPhotoBrowserDemo
//
//  Created by robin on 2018/1/31.
//  Copyright © 2018年 RobinChan. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^RBImageManagerProgressBlock)(NSInteger receivedSize, NSInteger expectedSize);

typedef void (^RBImageManagerCompletionBlock)(UIImage * _Nullable image, NSURL * _Nullable url, BOOL success, NSError * _Nullable error);

@protocol RBImageManager <NSObject>

- (void)setImageForImageView:(nullable UIImageView *)imageView
                     withURL:(nullable NSURL *)imageURL
                 placeholder:(nullable UIImage *)placeholder
                    progress:(nullable RBImageManagerProgressBlock)progress
                  completion:(nullable RBImageManagerCompletionBlock)completion;

- (void)cancelImageRequestForImageView:(nullable UIImageView *)imageView;

- (UIImage *_Nullable)imageFromMemoryForURL:(nullable NSURL *)url;

@end
