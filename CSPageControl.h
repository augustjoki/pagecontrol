//
//  CSPageControl.h
//  CSPageControl
//
//  Created by August Joki on 3/9/10.
//  Copyright 2010 Concinnous Software. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CSPageControl : UIPageControl {
  NSMutableArray *dots;
  UIImageView *activeDot;
  NSInteger cachedPage;
  
  UIImage *active, *inactive;
}

@property(nonatomic, retain) UIImage *active, *inactive;

@end
