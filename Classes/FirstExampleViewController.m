//
//  FirstExampleViewController.m
//  Demo2D
//
//  Created by Barry Ezell on 7/2/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "FirstExampleViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "ImagePickerViewController.h"

@implementation FirstExampleViewController

//the simplest way to programatically load an image
- (IBAction)loadFromBundleButtonPressed {
	UIImage *image = [UIImage imageNamed:@"rabbit.png"];
	imgView.image = image;
}

//Save the current view to file, then load that image from file into the UIImageView.
//This is a contrived example because we needed something to save as a file.
//In real app, may have saved image from web or from creative process (like virtual postcard).
- (IBAction)loadFromFileButtonPressed {
	
	//render view to UIImage
	UIGraphicsBeginImageContext(self.view.bounds.size);
	[self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
	UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	
	//save to /Documents/screen_capture.png
	NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/screen_capture.png"];
	NSData *imgData = UIImagePNGRepresentation(viewImage);	
	[imgData writeToFile:path atomically:NO];	
	
	//load into new UIImage and then load UIImageView
	UIImage *secondImage = [UIImage imageWithContentsOfFile:path];
	imgView.image = secondImage;
}

- (IBAction)pickerButtonPressed {
	ImagePickerViewController *picker = [[[ImagePickerViewController alloc] init] autorelease];
	picker.parent = self;
	[self presentModalViewController:picker animated:YES];
}

//load image chosen by user from ImagePickerController
- (void)displayPickedImage:(UIImage *)image {
	imgView.image = image;
}

- (IBAction)loadFromWebPressed {
	
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
