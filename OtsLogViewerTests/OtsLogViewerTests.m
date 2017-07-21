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

static NSString *oneEntryPath = @"/Volumes/Source/rich/OtsLogViewer/OtsLogViewerTests/one_entry.xml";
static NSString *emptyFilePath = @"/Volumes/Source/rich/OtsLogViewer/OtsLogViewerTests/empty.xml";

- (void)testOpeningAnEmptyFileProducesAnEmptyArrayOfLogEntries
{

    NSMutableArray *logEntries = [XMLConverter getEntriesFromXMLFileAtPath:emptyFilePath];
    
    XCTAssertEqual([logEntries count], 0);
}

- (void)testOpeningAFileWithOneEntryProducesAnArrayOfOneLogEntry
{
    NSMutableArray *logEntries = [XMLConverter getEntriesFromXMLFileAtPath:oneEntryPath];
    
    XCTAssertEqual([logEntries count], 1);
}

- (void)testOpeningAFileWithOneEntryProducesAnArrayOfOneLogEntryWithCorrectInformation
{
    LogEntry *entry = [[LogEntry alloc] initWithTimestamp:@"2017-07-20T17:56:41.4594805Z" message:@"Hello, World!" andNotation:@"3"];
    NSMutableArray *logEntries = [XMLConverter getEntriesFromXMLFileAtPath:oneEntryPath];
    
    XCTAssertEqualObjects(entry, logEntries[0]);
}

@end
