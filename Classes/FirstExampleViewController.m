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

//This example is from the Erica Sadun book.  Load a current weather map image from weather.com
//into the image view.  In a real-world app, would need error checking.  Long running requests
//should be asynchronous.
- (IBAction)loadFromWebPressed {
	NSURL *url = [NSURL URLWithString:@"http://image.weather.com/images/maps/current/curwx_600x405.jpg"];
	UIImage *img = [UIImage imageWithData:[NSData dataWithContentsOfURL:url]];
	imgView.image = img;
}

- (IBAction)rotateRightButtonPressed {
	if (imgView.image) {
		imgView.image = [self rotateImage90Right:imgView.image];
	}
}

//Demonstration of rotating an image.  Unfortunately, there is no
//image.rotate90Right method built-in.  Get the CG reference
//of the UIImage, use affine transforms to rotate it, then
//save to a second UIImage.
-(UIImage *)rotateImage90Right:(UIImage *)image {
	
    CGImageRef imgRef = image.CGImage;
	
    CGFloat width = CGImageGetWidth(imgRef);
    CGFloat height = CGImageGetHeight(imgRef);
	
    CGAffineTransform transform = CGAffineTransformIdentity;
    CGRect bounds = CGRectMake(0, 0, width, height);
	
    CGFloat scaleRatio = 1.0; 
    CGSize imageSize = CGSizeMake(CGImageGetWidth(imgRef), CGImageGetHeight(imgRef));
    CGFloat boundHeight = bounds.size.height;
	bounds.size.height = bounds.size.width;
	bounds.size.width = boundHeight;
	transform = CGAffineTransformMakeTranslation(imageSize.height, 0.0);
	transform = CGAffineTransformRotate(transform, M_PI / 2.0);
    
	UIImageOrientation orient = image.imageOrientation;	
    UIGraphicsBeginImageContext(bounds.size);
	
    CGContextRef context = UIGraphicsGetCurrentContext();
	
    if (orient == UIImageOrientationUp || orient == UIImageOrientationDown) {
        CGContextScaleCTM(context, -scaleRatio, scaleRatio);
        CGContextTranslateCTM(context, -height, 0);
    }
    else {
        CGContextScaleCTM(context, scaleRatio, -scaleRatio);
        CGContextTranslateCTM(context, 0, -height);
    }
	
    CGContextConcatCTM(context, transform);
	
    CGContextDrawImage(UIGraphicsGetCurrentContext(), CGRectMake(0, 0, width, height), imgRef);
    UIImage *imageCopy = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
	
    return imageCopy;
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
