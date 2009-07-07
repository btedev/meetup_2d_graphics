//
//  FifthExampleViewController.h
//  Demo2D
//
//  Created by Barry Ezell on 7/5/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface FifthExampleViewController : UIViewController {
	UIImageView *batImageView;
	UIImageView *menaceViewLayer;
}

- (void)feastButtonPressed;
- (void)animateBats;
- (void)animateBatsHasFinished:(NSString *)animationID finished:(BOOL)finished context:(void *)context;

@end
