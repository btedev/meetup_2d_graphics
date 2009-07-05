//
//  Demo2DAppDelegate.m
//  Demo2D
//
//  Created by Barry Ezell on 7/1/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "Demo2DAppDelegate.h"
#import "RootViewController.h"


@implementation Demo2DAppDelegate

@synthesize window;
@synthesize navigationController;


#pragma mark -
#pragma mark Application lifecycle

- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
	
	[window addSubview:[navigationController view]];
    [window makeKeyAndVisible];
}


- (void)applicationWillTerminate:(UIApplication *)application {
	// Save data if appropriate
}


#pragma mark -
#pragma mark Memory management

- (void)dealloc {
	[navigationController release];
	[window release];
	[super dealloc];
}


@end

