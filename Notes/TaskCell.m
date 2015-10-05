//
//  NoteCell.m
//  Notes
//
//  Created by Cheta Gandhi on 02/10/15.
//  Copyright (c) 2015 Tukargiri. All rights reserved.
//

#import "TaskCell.h"
#import <QuartzCore/QuartzCore.h>

@implementation TaskCell

@synthesize task = _task;
@synthesize delegate;

-(void)prepareForReuse
{
    [super prepareForReuse];
    self.delegate = nil;
    self.task = nil;
}

-(void)setTask:(Task *)task
{
    _task = task;
    [self.details setText:[_task details]];
    [self.done setBackgroundColor:_task.done.integerValue == 0 ? [UIColor redColor] : [UIColor greenColor]];
    [self.done.layer setCornerRadius:10.0f];
    [self.done setClipsToBounds:YES];

}

-(void)markAsDone:(id)sender
{
    if ([self delegate])
    {
        [[self delegate] markAsDone:self.task];
    }
}

@end
