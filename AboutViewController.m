//
//  AboutViewController.m
//  GPA
//
//  Created by Charlie Melbye on 1/28/10.
//  Copyright 2010 Apple Inc. All rights reserved.
//

#import "AboutViewController.h"
#import "AdMobView.h"

@implementation AboutViewController

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

- (void)viewDidLoad {
    [super viewDidLoad];
	
	
}

- (NSString *)publisherId {
	return kPublisherId; // this should be prefilled; if not, get it from www.admob.com
}

- (IBAction)openWebsite:(id)sender {
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://charliemelbye.com/iphone-apps/gpaide/"]];
}

- (IBAction)openSupport:(id)sender {
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://charliemelbye.com/support/"]];
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
