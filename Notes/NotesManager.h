//
//  NotesManager.h
//  Notes
//
//  Created by Demo on 02/10/15.
//  Copyright (c) 2015 Tukargiri. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Note.h"

@interface NotesManager : NSObject

-(NSArray *)allNotes;
-(Note *)addNote:(NSString *)data;

@end
