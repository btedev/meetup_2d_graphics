//
//  RootViewController.m
//  Demo2D
//
//  Created by Barry Ezell on 7/1/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "RootViewController.h"
#import "FirstExampleViewController.h"
#import "SecondExampleViewController.h"
#import "ThirdExampleViewController.h"
#import "FourthExampleViewController.h"
#import "FifthExampleViewController.h"

@implementation RootViewController


- (void)viewDidLoad {
    [super viewDidLoad];

    UIImage *background = [UIImage imageNamed:@"field2.png"];
	UIImageView *backgroundView = [[UIImageView alloc] initWithImage:background];
	[self.view addSubview:backgroundView];
	[self.view sendSubviewToBack:backgroundView];
	[backgroundView release];
	
	UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Menu" style:UIBarButtonItemStyleBordered target:nil action:nil];
    self.navigationItem.backBarButtonItem = backButton;
    [backButton release];
}

- (void)firstExampleButtonPressed {
	FirstExampleViewController *vc = [[FirstExampleViewController alloc] initWithNibName:@"FirstExampleView" bundle:nil];
	[self pushViewController:vc];
	[vc release];
}

- (void)secondExampleButtonPressed {
	SecondExampleViewController *vc = [[SecondExampleViewController alloc] initWithNibName:@"SecondExampleView" bundle:nil];
	[self pushViewController:vc];
	[vc release];
}

- (void)thirdExampleButtonPressed {
	ThirdExampleViewController *vc = [[ThirdExampleViewController alloc] initWithNibName:@"ThirdExampleView" bundle:nil];
	[self pushViewController:vc];
	[vc release];
}

- (IBAction)fourthExampleButtonPressed {
	FourthExampleViewController *vc = [[FourthExampleViewController alloc] init];
	[self pushViewController:vc];
	[vc release];
}

- (void)fifthExampleButtonPressed {
	FifthExampleViewController *vc = [[FifthExampleViewController alloc] initWithNibName:@"FifthExampleView" bundle:nil];
	[self pushViewController:vc];
	[vc release];
}

- (void)pushViewController:(UIViewController *)vc {
	[self.navigationController pushViewController:vc animated:YES];
}


/*
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
*/
/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/
/*
- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
	[super viewDidDisappear:animated];
}
*/

/*
 // Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations.
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
 */

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release anything that can be recreated in viewDidLoad or on demand.
	// e.g. self.myOutlet = nil;
}

- (void)dealloc {
    [super dealloc];
}


@end

