//
//  Note.h
//  Notes
//
//  Created by Cheta Gandhi on 02/10/15.
//  Copyright (c) 2015 Tukargiri. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface Note : NSManagedObject

@property (nonatomic, retain) NSDate * createdOn;
@property (nonatomic, retain) NSString * details;

@end
