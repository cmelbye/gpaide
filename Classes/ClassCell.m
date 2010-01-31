//
//  ClassCell.m
//  GPA
//
//  Created by Charlie Melbye on 1/30/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ClassCell.h"


@implementation ClassCell

@synthesize classNameLabel;
@synthesize letterGradeLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        // Initialization code
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {

    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)layoutSubviews {
	CGRect frame = [letterGradeLabel frame];
	if (self.editing) {
		if (self.showingDeleteConfirmation) {
			if (frame.origin.x == 278) {
				frame.origin.x = 278 - 60;
			} else {
				frame.origin.x = 278 - 90;
			}
		} else {
			frame.origin.x = 278 - 30;
		}
	} else {
		frame.origin.x = 278;
	}
	
	[letterGradeLabel setFrame:frame];
	
	[super layoutSubviews];
}

- (void)dealloc {
    [super dealloc];
}


@end
