//
//  FirstViewController.h
//  GPA
//
//  Created by Charlie Melbye on 1/21/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CoursesViewController : UITableViewController <UIPickerViewDataSource, UIPickerViewDelegate, UIActionSheetDelegate, UITextFieldDelegate> {
	NSMutableDictionary *courses;	
	UIBarButtonItem *addButton;
	NSArray *letterGradeArray;
	UIAlertView *addCourseAlert;
	UITextField *addCourseField;
	NSInteger letterGradeSelection;
	NSIndexPath *editingIndex;
    UIActionSheet *editCourseSheet;
}

@property (nonatomic, strong) NSMutableDictionary *courses;
@property (nonatomic, strong) UIBarButtonItem *addButton;

- (NSString *)coursesDatabasePath;
- (void)saveCourseList;
- (void)showCourseAlert;
- (void)addCourse:(NSString *)courseName;
- (void)dismissActionSheet:(id)sender;

@end
