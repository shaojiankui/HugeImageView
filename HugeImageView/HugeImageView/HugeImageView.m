//
//  HugeImageView.m
//  HugeImageLoader
//
//  Created by Jakey on 2016/11/3.
//  Copyright © 2016年 Jakey. All rights reserved.
//

#import "HugeImageView.h"
@interface HugeImageView(){
    CGRect _drawingRect;
    CGImageRef _imageRef;
    CGPoint _preLocation;
}
@end

@implementation HugeImageView

- (void)loadImageData:(NSData*)imageData{
    [self loadImageData:imageData ofType:nil];
}
- (void)loadImageData:(NSData*)imageData ofType:(NSString *)ext{
    CFDataRef cfData = CFBridgingRetain(imageData);
    CGDataProviderRef provider = CGDataProviderCreateWithCFData(cfData);
    CFRelease(cfData);
    
    if ([ext isEqualToString:@"png"] && ext) {
        _imageRef = CGImageCreateWithPNGDataProvider(provider,NULL, true,kCGRenderingIntentDefault);
    }else{
        _imageRef = CGImageCreateWithJPEGDataProvider(provider,NULL, true,kCGRenderingIntentDefault);
    }
    _imageWidth = CGImageGetWidth(_imageRef);
    _imageHeith = CGImageGetHeight(_imageRef);
    
    CGDataProviderRelease (provider);
    _drawingRect = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    _imageScale = 1;
    [self setNeedsDisplay];
}

- (void)loadImagePath:(NSURL*)imagePath{
    NSData *data = [NSData dataWithContentsOfURL:imagePath];
    [self loadImageData:data ofType:imagePath.pathExtension];
}

- (void)loadImageNamed:(NSString*)imageName ofType:(NSString *)ext;
{
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:imageName ofType:ext]];
    NSData *data = [NSData dataWithContentsOfURL:url];
    [self loadImageData:data ofType:ext];
}

- (void)loadImageNamed:(NSString*)imageName{
    if ([[NSFileManager defaultManager] fileExistsAtPath:[[NSBundle mainBundle] pathForResource:imageName ofType:@"png"]]) {
        [self loadImageNamed:imageName ofType:@"png"];
    }else if([[NSFileManager defaultManager] fileExistsAtPath:[[NSBundle mainBundle] pathForResource:imageName ofType:@"jpg"]]){
        [self loadImageNamed:imageName ofType:@"jpg"];
    }
}

- (void)drawRect:(CGRect)rect{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGImageRef imagePartRef = CGImageCreateWithImageInRect(_imageRef, _drawingRect);
    CGContextTranslateCTM(context, 0, self.frame.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextDrawImage(context, CGRectMake(0, 0, self.frame.size.width, self.frame.size.height), imagePartRef);
    CGImageRelease(imagePartRef);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    __unused UITouch *touch = [touches anyObject];
    _preLocation = [touch locationInView:self];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint touchPoint = [touch locationInView:self];
    
    int moveX = touchPoint.x-_preLocation.x;
    int moveY = touchPoint.y-_preLocation.y;
    
    if (_imageWidth > self.frame.size.width)
    {
        _drawingRect = CGRectOffset(_drawingRect, -moveX/_imageScale, 0);
        [self edgeDetectWidth];
    }
    if (_imageHeith > self.frame.size.height)
    {
        _drawingRect = CGRectOffset(_drawingRect, 0, -moveY/_imageScale);
        [self edgeDetectHeight];
    }
    [self setNeedsDisplay];
}

- (void)edgeDetectWidth
{
    if (CGRectGetMaxX(_drawingRect) > _imageWidth)
    {
        _drawingRect.origin.x = _imageWidth - self.frame.size.width/_imageScale;
    }
    
    if (CGRectGetMinX(_drawingRect) < 0)
    {
        _drawingRect.origin.x = 0;
    }
}

- (void)edgeDetectHeight
{
    if (CGRectGetMaxY(_drawingRect) > _imageHeith)
    {
        _drawingRect.origin.y = _imageHeith - self.frame.size.height/_imageScale;
    }
    
    if (CGRectGetMinY(_drawingRect) < 0)
    {
        _drawingRect.origin.y = 0;
    }
}

- (void)setImageScale:(CGFloat)imageScale{
    _imageScale = MAX(imageScale, self.frame.size.width/ _imageWidth);
    _drawingRect = CGRectMake(0, 0, self.frame.size.width/_imageScale, self.frame.size.height/_imageScale);
    [self setNeedsDisplay];
}

@end
