//
//  Copyright 2017 Microsoft
//

#import "LogEntry.h"

@implementation LogEntry

static int logEntryNumber = 1;

- (id)initWithTimestamp:(NSString *)timeStampString message:(NSString *)message andNotation:(NSString *)notation
{
    self = [super init];
    
    if (self)
    {
        self.timeStamp = timeStampString;
        self.message = message;
        self.number = [NSNumber numberWithInt:logEntryNumber++];
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

- (id)copyWithZone:(NSZone *)zone {
    LogEntry *entry = [[[self class] allocWithZone:zone] initWithTimestamp:self.timeStamp message:self.message andNotation:self.notation];
    return entry;
}

@end
