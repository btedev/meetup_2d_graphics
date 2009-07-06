//
//  ImagePickerController.h
//  Demo2D
//
//  Created by Barry Ezell on 7/6/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FirstExampleViewController.h"

@interface ImagePickerViewController : UIImagePickerController <UIImagePickerControllerDelegate, UINavigationControllerDelegate> {
	FirstExampleViewController *parent;
}

@property (nonatomic, retain) FirstExampleViewController *parent;

@end
