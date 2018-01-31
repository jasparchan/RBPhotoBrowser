//
//  ViewController.m
//  RBPhotoBrowserDemo
//
//  Created by robin on 2018/1/31.
//  Copyright © 2018年 RobinChan. All rights reserved.
//

#import "ViewController.h"
#import "RBPhotoBrowser.h"
#import <SDWebImage/UIImageView+WebCache.h>
@interface ViewController ()
@property (copy, nonatomic) NSArray *dataArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataArray = @[@"http://ww4.sinaimg.cn/large/a15bd3a5jw1f12r9ku6wjj20u00mhn22.jpg",
                      @"http://ww2.sinaimg.cn/large/a15bd3a5jw1f01hkxyjhej20u00jzacj.jpg",
                      @"http://ww4.sinaimg.cn/large/a15bd3a5jw1f01hhs2omoj20u00jzwh9.jpg",
                      @"http://ww2.sinaimg.cn/large/a15bd3a5jw1ey1oyiyut7j20u00mi0vb.jpg",
                      @"http://ww2.sinaimg.cn/large/a15bd3a5jw1exkkw984e3j20u00miacm.jpg",
                      @"http://ww4.sinaimg.cn/large/a15bd3a5jw1ezvdc5dt1pj20ku0kujt7.jpg",
                      @"http://ww3.sinaimg.cn/large/a15bd3a5jw1ew68tajal7j20u011iacr.jpg",
                      @"http://ww2.sinaimg.cn/large/a15bd3a5jw1eupveeuzajj20hs0hs75d.jpg",
                      @"http://ww2.sinaimg.cn/large/d8937438gw1fb69b0hf5fj20hu13fjxj.jpg"];

    
    // Do any additional setup after loading the view, typically from a nib.
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    UIImageView *imageView = [cell viewWithTag:1];
    
    [imageView sd_setImageWithURL:[NSURL URLWithString:self.dataArray[indexPath.row]]];

    return cell;
}

// MARK: - CollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSMutableArray *items = @[].mutableCopy;
    for (int i = 0; i < self.dataArray.count; i++) {
        UICollectionViewCell *cell = (UICollectionViewCell *)[collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
        UIImageView *imageView = [cell viewWithTag:1];
        RBPhotoItem *item = [RBPhotoItem itemWithSourceView:imageView imageUrl:[NSURL URLWithString:self.dataArray[i]]];
        [items addObject:item];
    }
    RBPhotoBrowser *browser = [RBPhotoBrowser browserWithPhotoItems:items selectedIndex:indexPath.row];
    [browser showFromViewController:self];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
