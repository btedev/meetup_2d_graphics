//
//  FirstExampleViewController.h
//  Demo2D
//
//  Created by Barry Ezell on 7/2/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface FirstExampleViewController : UIViewController {
	IBOutlet UIImageView *imgView;
}

- (IBAction)loadFromBundleButtonPressed;
- (IBAction)loadFromFileButtonPressed;
- (IBAction)pickerButtonPressed;
- (IBAction)loadFromWebPressed;
- (IBAction)rotateRightButtonPressed;

- (void)displayPickedImage:(UIImage *)image;
- (UIImage *)rotateImage90Right:(UIImage *)image;

@end
