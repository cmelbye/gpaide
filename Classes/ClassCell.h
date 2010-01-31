//
//  ClassCell.h
//  GPA
//
//  Created by Charlie Melbye on 1/30/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ClassCell : UITableViewCell {
	IBOutlet UILabel *classNameLabel;
	IBOutlet UILabel *letterGradeLabel;
}

@property (nonatomic, retain) IBOutlet UILabel *classNameLabel;
@property (nonatomic, retain) IBOutlet UILabel *letterGradeLabel;

@end
