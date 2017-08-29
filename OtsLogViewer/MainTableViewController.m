//
//  MainTableViewController.m
//  OtsLogViewer
//
//  Created by Rich Halliday on 8/28/17.
//  Copyright © 2017 Rich Halliday. All rights reserved.
//

#import "MainTableViewController.h"
#import "LogEntry.h"
#import "XMLConverter.h"

@interface MainTableViewController ()

@property (nonatomic) IBOutlet NSTableView *tableView;
@property (nonatomic) IBOutlet NSMutableArray *logEntries;

@end

@implementation MainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.logEntries = [[NSMutableArray alloc] init];
    [self testLoadOTLFile];
}

- (void)testLoadOTLFile {
    
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    NSString *path = [bundle pathForResource:@"results" ofType:@"otl"];
    self.logEntries = [XMLConverter getEntriesFromXMLFileAtPath:path];
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return [self.logEntries count];
}

- (id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    return self.logEntries[row];
}

@end
