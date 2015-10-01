//
//  Note.h
//  Notes
//
//  Created by Demo on 02/10/15.
//  Copyright (c) 2015 Tukargiri. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Note : NSObject

@property(nonatomic, strong) NSString *data;
@property(nonatomic, strong) NSDate *createdOn;

+(instancetype)noteWithData:(NSString *)data;

@end
