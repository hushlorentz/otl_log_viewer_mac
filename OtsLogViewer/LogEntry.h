//
//  LogEntry.h
//  OtsLogViewer
//
//  Created by Rich Halliday on 7/20/17.
//  Copyright © 2017 Rich Halliday. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LogEntry : NSObject

@property (nonatomic) NSString *timeStamp;
@property (nonatomic) NSString *message;
@property (nonatomic) NSString *notation;

- (id)initWithTimestamp:(NSString *)timeStampString message:(NSString *)message andNotation:(NSString *)notation;

@end
