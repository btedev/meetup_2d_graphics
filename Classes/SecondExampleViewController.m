//
//  SecondExampleViewController.m
//  Demo2D
//
//  Created by Barry Ezell on 7/2/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "SecondExampleViewController.h"


@implementation SecondExampleViewController


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];

	//create array of content mode strings with indices matching the UIViewContentMode enum
	/*
	 typedef enum {
	 UIViewContentModeScaleToFill,
	 UIViewContentModeScaleAspectFit,      // contents scaled to fit with fixed aspect. remainder is transparent
	 UIViewContentModeScaleAspectFill,     // contents scaled to fill with fixed aspect. some portion of content may be clipped.
	 UIViewContentModeRedraw,              // redraw on bounds change (calls -setNeedsDisplay)
	 UIViewContentModeCenter,              // contents remain same size. positioned adjusted.
	 UIViewContentModeTop,
	 UIViewContentModeBottom,
	 UIViewContentModeLeft,
	 UIViewContentModeRight,
	 UIViewContentModeTopLeft,
	 UIViewContentModeTopRight,
	 UIViewContentModeBottomLeft,
	 UIViewContentModeBottomRight,
	 } UIViewContentMode;
	 */
	
	modes = [NSArray arrayWithObjects:@"Scale To Fill",
										@"Scale Aspect Fit",
										@"Scale Aspect Fill",
										@"Redraw",
										@"Center",
										@"Top",
										@"Bottom",
										@"Left",
										@"Right",
										@"Top Left",
										@"Top Right",
										@"Bottom Left",
										@"Bottom Right",nil];
	[modes retain];
}


#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [modes count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView2 cellForRowAtIndexPath:(NSIndexPath *)indexPath {    
    static NSString *CellIdentifier = @"ModeCell";
    
    UITableViewCell *cell = [tableView2 dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
	}
	
	NSString *desc = [modes objectAtIndex:indexPath.row];
	cell.textLabel.text = desc;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    imageView.contentMode = indexPath.row;
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
	[modes release];
    [super dealloc];
}


@end
