//
//  ThirdExampleViewController.m
//  Demo2D
//
//  Created by Barry Ezell on 7/2/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "ThirdExampleViewController.h"


@implementation ThirdExampleViewController

- (IBAction)segmentCtrlPressed {
	
	int idx = segmentCtrl.selectedSegmentIndex;
	switch (idx) {
		case 0:
			[self drawRabbit];
			break;
		case 1:
			[self drawBackground];
			break;
		case 2:
			[self outfitMammalForEnvironment];
			break;
		case 3:
			[self adjustSnorkel];
			break;
		case 4:
			[self addJellyfish];
			break;
		default:
			break;
	} 
	
}

//draw rabbit centered in view
- (void)drawRabbit {
	if (rabbitView) return; //don't redraw if exists
	
	UIImage *rabbit = [UIImage imageNamed:@"rabbit_cutout.png"];
	rabbitView = [[UIImageView alloc] initWithImage:rabbit];
	[rabbitView setCenter:CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2)]; //more to the point would 
																										//be (160.0, 240.0)
	
	[self.view addSubview:rabbitView];	
	[rabbitView release];
}

- (void)drawBackground {
	UIImage *background = [UIImage imageNamed:@"coral.png"];
	UIImageView *imageView = [[UIImageView alloc] initWithImage:background];
	[self.view addSubview:imageView];	
	[self.view sendSubviewToBack:imageView];
	[imageView release];
}

- (void)outfitMammalForEnvironment {
	UIImage *snorkel = [UIImage imageNamed:@"snorkel.png"];
	snorkelView = [[UIImageView alloc] initWithImage:snorkel];
	[snorkelView setFrame:CGRectMake(120.0, 245.0, snorkel.size.width, snorkel.size.height)];
	[self.view addSubview:snorkelView];	
	[snorkelView release];
}

//move snorkelView by altering the origin of its frame
- (void)adjustSnorkel {
	CGRect myFrame = snorkelView.frame;
	myFrame.origin.x -= 15.0;
	myFrame.origin.y -= 15.0;
	[snorkelView setFrame:myFrame];
	
	[self updateSnorkelPositionLabel];
}

//display the current snorkel frame position
- (void)updateSnorkelPositionLabel {
	int x = snorkelView.frame.origin.x;
	int y = snorkelView.frame.origin.y;
	
	NSString *msg = [NSString stringWithFormat:@"snorkelView's origin x=%d, y=%d",x,y];
	positionLabel.text = msg;
}

//1. create view for jellyfish images unless view exists
//2. insert behind rabbit view so jellyfish aren't obscuring the star
//3. add image of jellyfish in random position in top half of view
- (void)addJellyfish {	
	if (!rabbitView) return;
	
	if (jellyfishView == nil) {		
		jellyfishView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320.0f, 320.0f)];
		jellyfishView.alpha = 0.6f;
		[self.view insertSubview:jellyfishView belowSubview:rabbitView];
		
		//make alpha slider visible
		alphaSlider.value = jellyfishView.alpha;
		[alphaSlider setHidden:NO];
		[jellyfishView release];
	}
			
	//add jellyfish image
	UIImage *jellyfishImage = [UIImage imageNamed:@"jellyfish.png"];
	int x = random() % 320;
	int y = random() % 320;
	UIImageView *jellyfishImageView = [[UIImageView alloc] initWithImage:jellyfishImage];
	[jellyfishImageView setCenter:CGPointMake(x,y)];
	[jellyfishView addSubview:jellyfishImageView];
	[jellyfishImageView release];
}

//change alpha transparency of jellyfish view based on slider value
- (void)jellyfishAlphaSliderDidChange {
	float val = alphaSlider.value;
	jellyfishView.alpha = val;
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
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
