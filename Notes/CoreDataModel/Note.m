//
//  Note.m
//  Notes
//
//  Created by Demo on 02/10/15.
//  Copyright (c) 2015 Tukargiri. All rights reserved.
//

#import "Note.h"

@implementation Note

@dynamic data;
@dynamic createdOn;

+(instancetype)noteWithData:(NSString *)data
{
    Note *note = [[Note alloc] init];
    note.data = data;
    note.createdOn = [NSDate date];
    return note;
}

@end
