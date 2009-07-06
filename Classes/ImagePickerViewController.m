//
//  ImagePickerController.m
//  Demo2D
//
//  Created by Barry Ezell on 7/6/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "ImagePickerViewController.h"


@implementation ImagePickerViewController

@synthesize parent;

- (id)init {
	if (self = [super init]) {
		self.title = @"Choose Photo";
		self.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
		self.allowsImageEditing = YES;
		self.delegate = self;
	}	
	return self;
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo {
	[parent displayPickedImage:image];
	
	//pop after saving
	[[self parentViewController] dismissModalViewControllerAnimated:YES];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
	NSLog(@"canceled");
	[[self parentViewController] dismissModalViewControllerAnimated:YES];
}


- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)dealloc {
	[parent release];
    [super dealloc];
}


@end
