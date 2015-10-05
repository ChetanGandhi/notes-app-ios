//
//  NoteCell.m
//  Notes
//
//  Created by Cheta Gandhi on 02/10/15.
//  Copyright (c) 2015 Tukargiri. All rights reserved.
//

#import "NoteCell.h"

@implementation NoteCell

@synthesize dateFormatter = _dateFormatter;
@synthesize note = _note;

-(void)prepareForReuse
{
    [super prepareForReuse];
    [self setNote:nil];
}

-(void)setDateFormatter:(NSDateFormatter *)formatter
{
    _dateFormatter = formatter;
    [self.createdOn setText:[_dateFormatter stringFromDate:self.note.createdOn]];
}

-(void)setNote:(Note *)note
{
    _note = note;
    [self.details setText:[_note details]];
    [self.createdOn setText:[self.dateFormatter stringFromDate:_note.createdOn]];
}

@end
