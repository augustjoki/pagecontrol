//
//  PageControlExampleViewController.h
//  PageControlExample
//
//  Created by August Joki on 3/9/10.
//  Copyright Concinnous Software 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CSPageControl;

@interface PageControlExampleViewController : UIViewController <UIScrollViewDelegate> {
  IBOutlet CSPageControl *pageControlTop;
  IBOutlet UIScrollView *scrollViewTop;
  IBOutlet UIView *pageControlContainer;
  CSPageControl *pageControlBottom;
  IBOutlet UIScrollView *scrollViewBottom;
}

- (IBAction)pageControlChanged:(UIPageControl *)pageControl;

@end

