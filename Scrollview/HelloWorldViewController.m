//
//  HelloWorldViewController.m
//  Scrollview
//
//  Created by Karthik on 15/05/13.
//  Copyright (c) 2013 Karthik. All rights reserved.
//

#import "HelloWorldViewController.h"

@interface HelloWorldViewController ()

@end

@implementation HelloWorldViewController
@synthesize  myScroll;

const CGFloat kScrollObjHeight = 600.0;
const CGFloat kScrollObjWidth = 600.0;
const NSUInteger kNumImages = 5;

- (void)layoutScrollImages
{
    UIImageView *view = nil;
    NSArray *subviews = [myScroll subviews];
    // reposition all image subviews in a horizontal serial fashion
    CGFloat curXLoc = 0;
    for (view in subviews)
    {
        if ([view isKindOfClass:[UIImageView class]] && view.tag > 0)
        {
            CGRect frame = view.frame;
            frame.origin = CGPointMake(curXLoc, 0);
            view.frame = frame;
            curXLoc += (kScrollObjWidth);
        }
    }
    // set the content size so it can be scrollable
    [myScroll setContentSize:CGSizeMake((kNumImages * kScrollObjWidth), [myScroll bounds].size.height)];
}
- (void)viewDidLoad
{
    self.view.backgroundColor = [UIColor viewFlipsideBackgroundColor];
    [myScroll setBackgroundColor:[UIColor blackColor]];
    [myScroll setCanCancelContentTouches:NO];
    myScroll.indicatorStyle = UIScrollViewIndicatorStyleWhite;
    myScroll.clipsToBounds = YES;
    myScroll.scrollEnabled = YES;
    myScroll.pagingEnabled = YES;
    NSUInteger i;
    for (i = 1; i <= kNumImages; i++)
    {
        NSString *imageName = [NSString stringWithFormat:@"img%d.jpg", i];
        UIImage *image = [UIImage imageNamed:imageName];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        CGRect rect = imageView.frame;
        rect.size.height = kScrollObjHeight;
        rect.size.width = kScrollObjWidth;
        imageView.frame = rect;
        imageView.tag = i;
        [myScroll addSubview:imageView];
    }
    [self layoutScrollImages];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
