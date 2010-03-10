//
//  PageControlExampleViewController.m
//  PageControlExample
//
//  Created by August Joki on 3/9/10.
//  Copyright Concinnous Software 2010. All rights reserved.
//

#import "PageControlExampleViewController.h"
#import "CSPageControl.h"

@interface PageControlExampleViewController ()

- (void)calculatePageFor:(UIScrollView *)scrollView;

@end


@implementation PageControlExampleViewController

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
  [super viewDidLoad];
  
  pageControlTop.active = [UIImage imageNamed:@"black.png"];
  pageControlTop.inactive = [UIImage imageNamed:@"gray.png"];
  
  pageControlBottom = [[CSPageControl alloc] init];
  pageControlBottom.frame = pageControlContainer.bounds;
  pageControlBottom.numberOfPages = 3;
  [pageControlBottom addTarget:self action:@selector(pageControlChanged:) forControlEvents:UIControlEventValueChanged];
  
  pageControlBottom.active = [UIImage imageNamed:@"blue.png"];
  pageControlBottom.inactive = [UIImage imageNamed:@"green.png"];
  
  [pageControlContainer addSubview:pageControlBottom];
  [pageControlBottom release];
  
  UIView *subview = [[UIView alloc] initWithFrame:scrollViewTop.bounds];
  subview.backgroundColor = [UIColor redColor];
  [scrollViewTop addSubview:subview];
  [subview release];
  
  subview = [[UIView alloc] initWithFrame:CGRectMake(scrollViewTop.bounds.size.width, 0.0f, scrollViewTop.bounds.size.width, scrollViewTop.bounds.size.height)];
  subview.backgroundColor = [UIColor greenColor];
  [scrollViewTop addSubview:subview];
  [subview release];
  
  subview = [[UIView alloc] initWithFrame:CGRectMake(scrollViewTop.bounds.size.width * 2.0f, 0.0f, scrollViewTop.bounds.size.width, scrollViewTop.bounds.size.height)];
  subview.backgroundColor = [UIColor blueColor];
  [scrollViewTop addSubview:subview];
  [subview release];
  
  scrollViewTop.contentSize = CGSizeMake(scrollViewTop.bounds.size.width * 3.0f, scrollViewTop.bounds.size.height);
  
  subview = [[UIView alloc] initWithFrame:scrollViewBottom.bounds];
  subview.backgroundColor = [UIColor yellowColor];
  [scrollViewBottom addSubview:subview];
  [subview release];
  
  subview = [[UIView alloc] initWithFrame:CGRectMake(scrollViewBottom.bounds.size.width, 0.0f, scrollViewBottom.bounds.size.width, scrollViewBottom.bounds.size.height)];
  subview.backgroundColor = [UIColor magentaColor];
  [scrollViewBottom addSubview:subview];
  [subview release];
  
  subview = [[UIView alloc] initWithFrame:CGRectMake(scrollViewBottom.bounds.size.width * 2.0f, 0.0f, scrollViewBottom.bounds.size.width, scrollViewBottom.bounds.size.height)];
  subview.backgroundColor = [UIColor cyanColor];
  [scrollViewBottom addSubview:subview];
  [subview release];
  
  scrollViewBottom.contentSize = CGSizeMake(scrollViewBottom.bounds.size.width * 3.0f, scrollViewBottom.bounds.size.height);
}

#pragma mark -
#pragma mark Actions

- (void)pageControlChanged:(UIPageControl *)pageControl {
  UIScrollView *scrollView;
  if (pageControl == pageControlTop) {
    scrollView = scrollViewTop;
  }
  else {
    scrollView = scrollViewBottom;
  }
  
  [scrollView setContentOffset:CGPointMake(pageControl.currentPage * scrollView.bounds.size.width, 0.0f) animated:YES];
}

#pragma mark -
#pragma mark Scroll View Delegate

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
  if (decelerate) {
    return;
  }
  
  [self calculatePageFor:scrollView];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
  [self calculatePageFor:scrollView];
}

- (void)calculatePageFor:(UIScrollView *)scrollView {
  CSPageControl *pageControl;
  if (scrollView == scrollViewTop){
    pageControl = pageControlTop;
  }
  else {
    pageControl = pageControlBottom;
  }
  
  NSInteger page = (int)scrollView.contentOffset.x / (int)scrollView.bounds.size.width;
  if (pageControl.currentPage != page) {
    pageControl.currentPage = page;
  }
}


@end
