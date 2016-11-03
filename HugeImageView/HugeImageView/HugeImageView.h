//
//  HugeImageView.h
//  HugeImageLoader
//
//  Created by Jakey on 2016/11/3.
//  Copyright © 2016年 Jakey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HugeImageView : UIView
@property(nonatomic,assign) CGFloat imageScale;

@property(nonatomic,assign) CGFloat imageWidth;
@property(nonatomic,assign) CGFloat imageHeith;


- (void)loadImageData:(NSData*)imageData;
- (void)loadImagePath:(NSURL*)imagePath;
- (void)loadImageNamed:(NSString*)imageName;
- (void)loadImageNamed:(NSString*)imageName ofType:(NSString *)ext;

@end
