//
//  NoteCell.h
//  Notes
//
//  Created by Cheta Gandhi on 02/10/15.
//  Copyright (c) 2015 Tukargiri. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Task.h"

@protocol TaskDelegate <NSObject>

-(void)markAsDone:(Task *)task;

@end

@interface TaskCell : UITableViewCell

@property (nonatomic, unsafe_unretained) id<TaskDelegate> delegate;

@property (nonatomic, strong) Task *task;

@property (nonatomic, weak) IBOutlet UILabel *details;
@property (nonatomic, weak) IBOutlet UIButton *done;

-(IBAction)markAsDone:(id)sender;

@end
