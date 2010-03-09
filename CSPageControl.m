//
//  CSPageControl.m
//  CSPageControl
//
//  Created by August Joki on 03/09/09.
//  Copyright 2010 Concinnous Software. All rights reserved.
//

#import "CSPageControl.h"

#define kDotSize 16.0f

@implementation CSPageControl

@synthesize active, inactive;

- (id)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  if (self != nil) {
    dots = [[NSMutableArray alloc] init];
  }
  return self;
}

- (id)initWithCoder:(NSCoder *)decoder {
  self = [super initWithCoder:decoder];
  if (self != nil) {
    dots = [[NSMutableArray alloc] init];
  }
  return self;
}

- (void)dealloc {
  [dots release];
  [active release];
  [inactive release];
  [super dealloc];
}

- (void)layoutSubviews {
  [super layoutSubviews];
  
  NSInteger num = self.numberOfPages;
  if (num == 1 && self.hidesForSinglePage) {
    if (dots.count) {
      [dots removeAllObjects];
    }
    return;
  }
  
  CGFloat y = floorf((self.bounds.size.height - kDotSize) / 2.0f);
  CGFloat startX = floorf((self.bounds.size.width - kDotSize * num) / 2.0f);
  
  if (dots.count != (NSUInteger)num) {
    [dots removeAllObjects];
    
    for (NSInteger ii = 0; ii < num; ii++) {
      UIImageView *dot;
      if (ii == self.currentPage) {
        dot = [[UIImageView alloc] initWithImage:active];
        activeDot = dot;
      }
      else {
        dot = [[UIImageView alloc] initWithImage:inactive];
      }
      [self addSubview:dot];
      dot.frame = CGRectMake(startX + ii * kDotSize, y, kDotSize, kDotSize);
      
      [dots addObject:dot];
      [dot release];
    }
  }
  else {
    NSInteger ind = [dots indexOfObject:activeDot];
    [dots exchangeObjectAtIndex:ind withObjectAtIndex:self.currentPage];
    
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

@end
