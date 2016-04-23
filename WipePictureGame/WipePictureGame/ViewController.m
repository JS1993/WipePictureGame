//
//  ViewController.m
//  WipePictureGame
//
//  Created by  江苏 on 16/4/23.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIPanGestureRecognizer* pan=[[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(pan:)];
    
    [self.view addGestureRecognizer:pan];
}

-(void)pan:(UIPanGestureRecognizer*)pan{
    
    CGPoint currentP=[pan locationInView:self.view];
    
    //擦除范围的宽高
    CGFloat currentWH=30;
    
    //擦除的范围
    CGRect rect=CGRectMake(currentP.x-currentWH*0.5, currentP.y-currentWH*0.5, currentWH, currentWH);
    
    //开启图形上下文
    UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, NO, 0.0);
    
    //取得当前图片上下文
    CGContextRef ctx=UIGraphicsGetCurrentContext();
    
    //把控件的layer渲染上去
    [_imageView.layer renderInContext:ctx];
    
    //擦除图片
    CGContextClearRect(ctx, rect);
    
    //取得图片
    _imageView.image=UIGraphicsGetImageFromCurrentImageContext();
    
    //关闭上下文
    UIGraphicsEndImageContext();
}

@end
