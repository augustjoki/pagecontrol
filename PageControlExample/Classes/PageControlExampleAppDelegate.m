//
//  PageControlExampleAppDelegate.m
//  PageControlExample
//
//  Created by August Joki on 3/9/10.
//  Copyright Concinnous Software 2010. All rights reserved.
//

#import "PageControlExampleAppDelegate.h"
#import "PageControlExampleViewController.h"

@implementation PageControlExampleAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
