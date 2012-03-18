//
//  GPAViewController.h
//  GPA
//
//  Created by Charlie Melbye on 1/21/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GPAAppDelegate.h"

@interface GPAViewController : UIViewController <BannerViewContainer> {
	NSMutableDictionary *courses;
	NSDictionary *gradePointValues;
	
	UILabel *gpaLabel;
	UILabel *infoLabel;
    
    ADBannerView *_bannerView;
}

@property (nonatomic, strong) IBOutlet UIImageView *postItImageView;
@property (nonatomic, strong) IBOutlet UILabel *gpaLabel;
@property (nonatomic, strong) IBOutlet UILabel *infoLabel;

@property (nonatomic) BOOL initialAppear;

- (void)calculateGPA;
- (void)loadCourses;
- (NSString *)coursesDatabasePath;

@end
