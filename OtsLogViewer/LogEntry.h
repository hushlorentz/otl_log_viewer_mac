//
//  LogEntry.h
//  OtsLogViewer
//
//  Created by Rich Halliday on 7/20/17.
//  Copyright © 2017 Rich Halliday. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LogEntry : NSObject <NSCopying>

@property (nonatomic) NSString *message;
@property (nonatomic) NSString *notation;
@property (nonatomic) NSNumber *number;
@property (nonatomic) NSString *source;
@property (nonatomic) NSString *timeStamp;

- (id)initWithTimestamp:(NSString *)timeStampString message:(NSString *)message andNotation:(NSString *)notation;

@end
