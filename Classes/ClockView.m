//
//  ClockView.m
//  Demo2D
//
//  Created by Barry Ezell on 7/5/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "ClockView.h"

@implementation ClockView

/*
- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
    }
    return self;
}*/

//Draw the time using Core Graphics over a square
//colored green for even numbers and blue for odd numbers
//of ms since 1970.  Note that we mix CG and UIKit methods.
//That's possible because UIKit is based on CG.
- (void)drawRect:(CGRect)rect {
	
	//get the CG reference to the UIKit-created context 	
	CGContextRef context = UIGraphicsGetCurrentContext();
	CGContextFillRect(context, rect);
	
	//create smaller rectangle for clock
	CGRect clockRect = CGRectMake(10, 150, 300, 80);
	
	//fill rectangle with green or blue depending on time inveral
	NSDate *now = [[NSDate alloc] init];
	int interval = now.timeIntervalSince1970;
	if (interval % 2) {
		CGContextSetRGBFillColor(context, 0.0, 1.0, 0.0, 1.0);  //RGBA
	} else {
		CGContextSetRGBFillColor(context, 0.0, 0.0, 1.0, 1.0);
	}
	CGContextFillRect(context, clockRect);
	
	//create the time string
	NSDateFormatter *timeFormat = [[NSDateFormatter alloc] init];
	[timeFormat setDateFormat:@"HH:mm:ss"];	
	NSString *theTime = [timeFormat stringFromDate:now];
		
	//prepare the (UIKit) color and font
	UIColor *white = [UIColor whiteColor];
	[white set];
	UIFont *font = [UIFont fontWithName:@"AmericanTypewriter-Bold" size:63];
	
	//draw the time
	[theTime drawInRect:clockRect withFont:font];
			
	[timeFormat release];
	[now release];
}


- (void)dealloc {
    [super dealloc];
}


@end
