//
//  ClockView.m
//  Demo2D
//
//  Created by Barry Ezell on 7/5/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "ClockView.h"


@implementation ClockView


- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
    }
    return self;
}

//Draw the time using Core Graphics over three squares, one for each of HH MM SS.
//The squares will be colored green for even numbers and blue for odd.
- (void)drawRect:(CGRect)rect {
	[super drawRect:rect];
	
	//create (but don't draw yet) the time string
	NSDateFormatter *timeFormat = [[NSDateFormatter alloc] init];
	[timeFormat setDateFormat:@"HH mm ss"];	
	NSDate *now = [[NSDate alloc] init];	
	NSString *theTime = [timeFormat stringFromDate:now];
	
	//get the CG reference to the UIKit-created context 	
	CGContextRef context = UIGraphicsGetCurrentContext();
	CGContextFillRect(context, rect);
	
	//create smaller rectangle for clock
	CGRect clockRect = CGRectMake(10, 150, 300, 150);
	
	//prepare the color and font
	UIColor *white = [UIColor whiteColor];
	[white set];
	UIFont *font = [UIFont fontWithName:@"AmericanTypewriter-Bold" size:66];
	
	//draw the time
	[theTime drawInRect:clockRect withFont:font];
			
	[timeFormat release];
	[now release];
}


- (void)dealloc {
    [super dealloc];
}


@end
