//
//  Copyright 2017 Microsoft
//

#import <XCTest/XCTest.h>
#import "LogEntry.h"
#import "XMLConverter.h"
#import "TBXML.h"

@interface OtsLogViewerTests : XCTestCase

@end

@implementation OtsLogViewerTests

static NSString *oneEntryFile = @"one_entry";
static NSString *emptyFile = @"empty";
static NSString *getTestPath(NSString *fileName)
{
    NSBundle *bundle = [NSBundle bundleForClass:[OtsLogViewerTests class]];
    NSString *path = [bundle pathForResource:fileName ofType:@"xml"];
    return path;
}

- (void)testOpeningAnEmptyFileProducesAnEmptyArrayOfLogEntries
{
    NSMutableArray *logEntries = [XMLConverter getEntriesFromXMLFileAtPath:getTestPath(emptyFile)];
    
    XCTAssertEqual([logEntries count], 0);
}

- (void)testOpeningAFileWithOneEntryProducesAnArrayOfOneLogEntry
{
    NSMutableArray *logEntries = [XMLConverter getEntriesFromXMLFileAtPath:getTestPath(oneEntryFile)];
    
    XCTAssertEqual([logEntries count], 1);
}

- (void)testOpeningAFileWithOneEntryProducesAnArrayOfOneLogEntryWithCorrectInformation
{
    LogEntry *entry = [[LogEntry alloc] initWithTimestamp:@"2017-07-20T17:56:41.4594805Z" message:@"Hello, World!" andNotation:@"3"];
    NSMutableArray *logEntries = [XMLConverter getEntriesFromXMLFileAtPath:getTestPath(oneEntryFile)];
    
    XCTAssertEqualObjects(entry, logEntries[0]);
}

@end
