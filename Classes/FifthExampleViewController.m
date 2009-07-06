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

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	UIImageView *background = [[UIImageView alloc] initWithFrame:self.view.frame];  
	background.image = [UIImage imageNamed:@"churchyard.png"];
	[self.view addSubview:background];
	[self.view sendSubviewToBack:background];
	
	batImageView = [[UIImageView alloc] initWithFrame:CGRectMake(75, 75, 30.25, 22)]; //121 x 88 
	
	UIImage *bat1 = [UIImage imageNamed:@"bat_up.png"];
	UIImage *bat2 = [UIImage imageNamed:@"bat_down.png"];
	batImageView.animationImages = [NSArray arrayWithObjects:bat1, bat2, nil];
	batImageView.animationDuration = 0.2;
	
	[self.view addSubview:batImageView];
	[batImageView startAnimating];
}

- (void)batsButtonPressed {
	NSLog(@"animating");
	[UIView beginAnimations:@"MoveAndStrech" context:nil];
	[UIView setAnimationDuration:4];
	[UIView setAnimationBeginsFromCurrentState:YES];
	[batImageView setFrame:CGRectMake(75, 75, 121, 88)];
	[UIView commitAnimations];
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
