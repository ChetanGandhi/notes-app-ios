//
//  NoteCell.h
//  Notes
//
//  Created by Cheta Gandhi on 02/10/15.
//  Copyright (c) 2015 Tukargiri. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Note.h"

@interface NoteCell : UITableViewCell

@property (nonatomic, strong) Note *note;
@property (nonatomic, strong) NSDateFormatter *dateFormatter;

@property (nonatomic, weak) IBOutlet UILabel *details;
@property (nonatomic, weak) IBOutlet UILabel *createdOn;

@end
