//
//  GPAViewController.h
//  GPA
//
//  Created by Charlie Melbye on 1/21/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AdMobDelegateProtocol.h"

@interface GPAViewController : UIViewController <AdMobDelegate> {
	AdMobView *advert;
	
	NSMutableDictionary *courses;
	NSDictionary *gradePointValues;
	
	UILabel *gpaLabel;
	UILabel *infoLabel;
	
	NSTimer *refreshTimer;
}

@property (nonatomic, retain) IBOutlet UILabel *gpaLabel;
@property (nonatomic, retain) IBOutlet UILabel *infoLabel;

- (void)refreshAd:(NSTimer *)timer;
- (void)calculateGPA;
- (void)loadCourses;
- (NSString *)coursesDatabasePath;

@end
