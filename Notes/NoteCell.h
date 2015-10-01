//
//  NoteCell.h
//  Notes
//
//  Created by Demo on 02/10/15.
//  Copyright (c) 2015 Tukargiri. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Note.h"

@interface NoteCell : UITableViewCell

@property (nonatomic, strong) Note *note;
@property (nonatomic, strong) NSString *dateFormat;

@property (nonatomic, weak) IBOutlet UITextView *data;
@property (nonatomic, weak) IBOutlet UILabel *createdOn;

@end
