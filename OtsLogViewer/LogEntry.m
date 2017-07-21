//
//  Copyright 2017 Microsoft
//

#import "LogEntry.h"

@implementation LogEntry

- (id)initWithTimestamp:(NSString *)timeStampString message:(NSString *)message andNotation:(NSString *)notation
{
    self = [super init];
    
    if (self)
    {
        self.timeStamp = timeStampString;
        self.message = message;
        self.notation = notation;
    }
    
    return self;
}

- (BOOL)isEqual:(id)object
{
    return [[self message] isEqualToString:[object message]] &&
    [[self timeStamp] isEqualToString:[object timeStamp]] &&
    [[self notation] isEqualToString:[object notation]];
}

@end
