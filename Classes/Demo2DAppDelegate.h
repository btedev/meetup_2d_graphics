//
//  Demo2DAppDelegate.h
//  Demo2D
//
//  Created by Barry Ezell on 7/1/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

@interface Demo2DAppDelegate : NSObject <UIApplicationDelegate> {
    
    UIWindow *window;
    UINavigationController *navigationController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@end

