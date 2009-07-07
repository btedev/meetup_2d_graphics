//
//  FifthExampleViewController.m
//  Demo2D
//
//  Created by Barry Ezell on 7/5/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "FifthExampleViewController.h"

@implementation FifthExampleViewController

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
	UIView *aview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 460)];
	self.view = aview;
	[aview release];
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	UIImageView *background = [[UIImageView alloc] initWithFrame:self.view.frame];  
	background.image = [UIImage imageNamed:@"churchyard.png"];
	[self.view addSubview:background];
	[self.view sendSubviewToBack:background];
	
	//Create Feast button
	UIButton *feastButton = [UIButton buttonWithType:UIButtonTypeCustom];
	[feastButton setImage:[UIImage imageNamed:@"feast_normal.png"] forState:UIControlStateNormal];
	[feastButton setFrame:CGRectMake(30, 350, 87.5, 50)];
	[feastButton addTarget:self action:@selector(feastButtonPressed) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:feastButton];
	
	//Add our favorite bunny
	UIImageView *rabbitViewLayer = [[UIImageView alloc] initWithFrame:CGRectMake(75,210,269,246)];
	rabbitViewLayer.contentMode = UIViewContentModeScaleAspectFit;
	rabbitViewLayer.image = [UIImage imageNamed:@"rabbit_cutout.png"];
	[self.view addSubview:rabbitViewLayer];
	[rabbitViewLayer release];
	
	//Add "meanace" ImageView with fangs and red eye over the rabbit image but set alpha at 0
	//for now.  Pressing Feast button will cause animation to set alpha to 1.0.
	menaceViewLayer = [[UIImageView alloc] initWithFrame:CGRectMake(75,210,269,246)];
	menaceViewLayer.contentMode = UIViewContentModeScaleAspectFit;
	menaceViewLayer.image = [UIImage imageNamed:@"menace_layer.png"];
	menaceViewLayer.alpha = 0.0;
	[self.view addSubview:menaceViewLayer];

	//Create a UIImageView with an array of two images that will simulate bat wings flapping
	batImageView = [[UIImageView alloc] initWithFrame:CGRectMake(75, 75, 1, 1)]; //base image 276x170 	
	UIImage *bat1 = [UIImage imageNamed:@"bat_up.png"];
	UIImage *bat2 = [UIImage imageNamed:@"bat_down.png"];
	batImageView.animationImages = [NSArray arrayWithObjects:bat1, bat2, nil];
	batImageView.animationDuration = 0.2;
	[batImageView startAnimating];	
	[self.view addSubview:batImageView];
	
	//set timer for bats
	[self animateBats];
	[NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(animateBats) userInfo:nil repeats:YES];
}

//Use Core Animation to set the size and frame of the bats which
//will give the effect of the bats flying toward the user.
//The wing flapping is handled by the UIImageView (see batImageView contruction
//in viewDidLoad).  Randomizer will determine whether to show animation or not,
//and ending position will be randomly selected.
- (void)animateBats {
	
	//peform animation approx. 1 in 5 invocations
	if (random() % 5) return;
	
	//set up pre-animation state	
	[batImageView setHidden:NO];	
		
	//start animation transaction and set up post-animation state
	[UIView beginAnimations:@"batty" context:nil];	
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDuration:1.5];
	[UIView setAnimationBeginsFromCurrentState:YES];
	
	int x = random() % 200;
	int y = random() % 200;
	
	[batImageView setFrame:CGRectMake(x, y, 414, 255)];
	[UIView setAnimationDidStopSelector:@selector(animateBatsHasFinished:finished:context:)];
	
	//begin animation
	[UIView commitAnimations];
}

//hide bat view after animation and reset frame to nearly invisible
- (void)animateBatsHasFinished:(NSString *)animationID finished:(BOOL)finished context:(void *)context {
	[batImageView setHidden:YES];
	[batImageView setFrame:CGRectMake(75, 75, 1, 1)];	
}

//use animation to set alpha on "menace layer" to 1.0, then reverse
- (void)feastButtonPressed {
	[UIView beginAnimations:@"feast" context:nil];
	[UIView setAnimationDuration:3.0];
	[UIView setAnimationBeginsFromCurrentState:YES];
	[UIView setAnimationRepeatAutoreverses:YES];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDidStopSelector:@selector(feastHasFinished:finished:context:)];
	menaceViewLayer.alpha = 1.0;
	[UIView commitAnimations];
}

- (void)feastHasFinished:(NSString *)animationID finished:(BOOL)finished context:(void *)context { 
	menaceViewLayer.alpha = 0.0;
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
