//
//  CSPageControl.m
//  CSPageControl
//
//  Created by August Joki on 3/9/10.
//  Copyright 2010 Concinnous Software. All rights reserved.
//

#import "CSPageControl.h"

#define kDotSize 16.0f

@implementation CSPageControl

@synthesize active, inactive;

- (void)dealloc {
  [dots release];
  [active release];
  [inactive release];
  [super dealloc];
}

- (void)layoutSubviews {
  [super layoutSubviews];
  
  if (active == nil && inactive == nil) {
    [dots removeAllObjects];
    return;
  }
  
  if (dots == nil) {
    dots = [[NSMutableArray alloc] init];
  }
  
  NSInteger num = self.numberOfPages;
  if (num == 1 && self.hidesForSinglePage) {
    if (dots.count) {
      [dots removeAllObjects];
    }
    return;
  }
  
  CGFloat y = floorf((self.bounds.size.height - kDotSize) / 2.0f);
  CGFloat startX = floorf((self.bounds.size.width - kDotSize * num) / 2.0f);
  
  cachedPage = self.currentPage;
  
  if (dots.count != (NSUInteger)num) {
    [dots removeAllObjects];
    
    for (NSInteger ii = 0; ii < num; ii++) {
      UIImageView *dot;
      if (ii == cachedPage) {
        dot = [[UIImageView alloc] initWithImage:active];
        if (dot == nil) {
          dot = [[UIView alloc] initWithFrame:CGRectZero];
          dot.backgroundColor = [UIColor clearColor];
          dot.userInteractionEnabled = NO;
        }
        activeDot = dot;
      }
      else {
        dot = [[UIImageView alloc] initWithImage:inactive];
        if (dot == nil) {
          dot = [[UIView alloc] initWithFrame:CGRectZero];
          dot.backgroundColor = [UIColor clearColor];
          dot.userInteractionEnabled = NO;
        }
      }
      dot.frame = CGRectMake(startX + ii * kDotSize, y, kDotSize, kDotSize);
      
      [self addSubview:dot];
      [dots addObject:dot];
      [dot release];
    }
  }
  else {
    NSInteger ind = [dots indexOfObject:activeDot];
    [dots exchangeObjectAtIndex:ind withObjectAtIndex:cachedPage];
    
    for (NSInteger ii = 0; ii < self.numberOfPages; ii++) {
      UIImageView *dot = [dots objectAtIndex:ii];
      dot.frame = CGRectMake(startX + ii * kDotSize, y, kDotSize, kDotSize);
    }
  }
}

- (void)setCurrentPage:(NSInteger)page {
  [super setCurrentPage:page];
  [self setNeedsLayout];
}

- (void)sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
  [super sendAction:action to:target forEvent:event];
  if (!self.defersCurrentPageDisplay) {
    [self setNeedsLayout];
  }
}

- (void)updateCurrentPageDisplay {
  [super updateCurrentPageDisplay];
  [self setNeedsLayout];
}

- (void)endTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
  [super endTrackingWithTouch:touch withEvent:event];
  if (cachedPage != self.currentPage) {
    [self setNeedsLayout];
  }
}

@end
