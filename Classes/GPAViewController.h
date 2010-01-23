//
//  GPAViewController.h
//  GPA
//
//  Created by Charlie Melbye on 1/21/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface GPAViewController : UIViewController {
	NSMutableDictionary *courses;
	NSDictionary *gradePointValues;
	
	UILabel *gpaLabel;
}

@property (nonatomic, retain) IBOutlet UILabel *gpaLabel;

- (void)calculateGPA;
- (void)loadCourses;
- (NSString *)coursesDatabasePath;

@end
