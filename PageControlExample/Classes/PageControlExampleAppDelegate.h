//
//  PageControlExampleAppDelegate.h
//  PageControlExample
//
//  Created by August Joki on 3/9/10.
//  Copyright Concinnous Software 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PageControlExampleViewController;

@interface PageControlExampleAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    PageControlExampleViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet PageControlExampleViewController *viewController;

@end

