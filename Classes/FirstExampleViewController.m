//
//  FirstExampleViewController.m
//  Demo2D
//
//  Created by Barry Ezell on 7/2/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "FirstExampleViewController.h"
#import <QuartzCore/QuartzCore.h>

@implementation FirstExampleViewController

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

//simplest way to programatically load an image
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
	
}

- (IBAction)loadFromWebPressed {
	
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

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
