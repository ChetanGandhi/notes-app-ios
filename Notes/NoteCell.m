//
//  NoteCell.m
//  Notes
//
//  Created by Demo on 02/10/15.
//  Copyright (c) 2015 Tukargiri. All rights reserved.
//

#import "NoteCell.h"

@interface NoteCell ()
{
    NSDateFormatter *dateFormatter;
}

@end

@implementation NoteCell

@synthesize dateFormat = _dateFormat;
@synthesize note = _note;

-(void)prepareForReuse
{
    [super prepareForReuse];
    if (!dateFormatter)
    {
        dateFormatter = [[NSDateFormatter alloc] init];
    }
    [self setNote:nil];
    
}

-(void)setDateFormat:(NSString *)format
{
    if(_dateFormat != format)
    {
        _dateFormat = format;
        if (!dateFormatter)
        {
            dateFormatter = [[NSDateFormatter alloc] init];
        }
        
        [dateFormatter setDateFormat:_dateFormat];
        [self.createdOn setText:[dateFormatter stringFromDate:self.note.createdOn]];
    }
}

-(void)setNote:(Note *)note
{
    _note = note;
    [self.data setText:[_note data]];
    [self.createdOn setText:[dateFormatter stringFromDate:_note.createdOn]];
}

@end
