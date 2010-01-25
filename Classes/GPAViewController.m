//
//  GPAViewController.m
//  GPA
//
//  Created by Charlie Melbye on 1/21/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "GPAViewController.h"
#import "AdMobView.h"
#define FOBJ(x) [NSNumber numberWithFloat:x]

@implementation GPAViewController

@synthesize gpaLabel;
@synthesize infoLabel;

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)loadView {
	[super loadView];
	
	advert = [[AdMobView requestAdWithDelegate:self] retain];
	advert.frame = CGRectMake(0, 0, 320, 48);
	[self.view addSubview:advert];
}

- (void)viewDidLoad {
	[super viewDidLoad];
	
	// Setup Grade Point Values
	NSArray *keys = [NSArray arrayWithObjects:@"A", @"A-", @"B+", @"B", @"B-", @"C+", @"C", @"C-", @"D+", @"D", @"D-", @"F", nil];
	NSArray *values = [NSArray arrayWithObjects:FOBJ(4.00), FOBJ(3.67), FOBJ(3.33), FOBJ(3.00), FOBJ(2.67), FOBJ(2.33), FOBJ(2.00), FOBJ(1.67), FOBJ(1.33), FOBJ(1.00), FOBJ(0.67), FOBJ(0.00), nil];
	gradePointValues = [[NSDictionary dictionaryWithObjects:values forKeys:keys] retain];
	
	NSLog(@"Loaded courses and calculated GPA.");
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}

- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
	[self calculateGPA];
	[advert requestFreshAd];
}

- (void)dealloc {
    [super dealloc];
	[advert release];
	[courses release];
	[gradePointValues release];
}

- (NSString *)publisherId {
	return @"a14b590c10d480d";
}

- (void)calculateGPA {
	[self loadCourses];
	
	if([courses count] > 0) {
		float gpa = 0.00;
		
		for (id courseName in courses) {
			gpa = gpa + [[gradePointValues objectForKey:[courses objectForKey:courseName]] floatValue];
		}
		
		gpa = gpa / [courses count];
		
		NSLog(@"%f", gpa);
		
		if(gpa > 3) {
			infoLabel.text = @"Keep up the good work!";
		} else {
			infoLabel.text = @"Keep trying!";
		}
		
		gpaLabel.text = [NSString stringWithFormat:@"%0.2f", gpa];
	} else {
		infoLabel.text = @"Insert your courses to calculate your GPA.";
		gpaLabel.text = @"0.00";
	}
}

- (void)loadCourses {
	NSFileManager *fileManager = [NSFileManager defaultManager];
	
	[courses release];
	
	// Load courses
	if([fileManager fileExistsAtPath:[self coursesDatabasePath]]) {
		NSLog(@"Course file exists, loading.");
		courses = [[NSMutableDictionary alloc] initWithContentsOfFile:[self coursesDatabasePath]];
	} else {
		NSLog(@"Course file does not exist, using an empty dict.");
		courses = [[NSMutableDictionary alloc] init];
	}
	
	[fileManager release];	
}

- (NSString *)coursesDatabasePath {
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	
	return [[paths objectAtIndex:0] stringByAppendingPathComponent:@"courses.plist"];
}

@end
