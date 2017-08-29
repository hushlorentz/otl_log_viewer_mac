//
//  Copyright 2017 Microsoft
//

#import "LogEntry.h"

@interface LogEntry()

@property NSDateFormatter *dateFormatter;

@end

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
        
        [self initDateFormatter];
    }
    
    return self;
}

- (void)initDateFormatter
{
    self.dateFormatter = [[NSDateFormatter alloc] init];

    NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
    [self.dateFormatter setLocale:locale];
    [self.dateFormatter setTimeZone:[NSTimeZone systemTimeZone]];
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

- (NSString *)timeStamp
{
    [self.dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSSSSSS'Z'"];
    NSDate *date  = [self.dateFormatter dateFromString:_timeStamp];
    NSDate *localDateTime = [NSDate dateWithTimeInterval:[[NSTimeZone systemTimeZone] secondsFromGMT] sinceDate:date];
    
    [self.dateFormatter setDateFormat:@"h:mm:ss a"];
    return [self.dateFormatter stringFromDate:localDateTime];
}

@end
