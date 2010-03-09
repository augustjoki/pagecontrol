//
//  CSPageControl.h
//  CSPageControl
//
//  Created by August Joki on 03/09/09.
//  Copyright 2010 Concinnous Software. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CSPageControl : UIPageControl {
  NSMutableArray *dots;
  UIImageView *activeDot;
  
  UIImage *active, *inactive;
}

@property(nonatomic, retain) UIImage *active, *inactive;

@end
