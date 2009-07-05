//
//  ThirdExampleViewController.h
//  Demo2D
//
//  Created by Barry Ezell on 7/2/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ThirdExampleViewController : UIViewController {
	IBOutlet UISegmentedControl *segmentCtrl;
	IBOutlet UILabel *positionLabel;
	UIImageView *rabbitView;
	UIImageView *snorkelView;	
	UIView *jellyfishView;
}

- (IBAction)segmentCtrlPressed;

- (void)drawRabbit;
- (void)drawBackground;
- (void)outfitMammalForEnvironment;
- (void)adjustSnorkel;
- (void)updateSnorkelPositionLabel;
- (void)addJellyfish;
- (void)adjustJellyfishAlpha;

@end
