//
//  Copyright 2017 Microsoft
//

#import "XMLConverter.h"
#import "FileIO.h"
#import "LogEntry.h"
#import "TBXML.h"

@implementation XMLConverter

+ (NSMutableArray *)getEntriesFromXMLFileAtPath:(NSString *)path
{
    NSMutableArray *entries = [[NSMutableArray alloc] init];
    TBXML *xml = [FileIO parseXMLFile:path];
    TBXMLElement *root = xml.rootXMLElement;
    
    if (root)
    {
        TBXMLElement *entry = [TBXML childElementNamed:@"E" parentElement:root];
        
        while (entry)
        {
            NSString *timeStampString = [TBXML valueOfAttributeNamed:@"T" forElement:entry];
            NSString *message = [TBXML valueOfAttributeNamed:@"C" forElement:entry];
            NSString *notation = [TBXML valueOfAttributeNamed:@"N" forElement:entry];

            [entries addObject:[[LogEntry alloc] initWithTimestamp:timeStampString
                                                           message:message
                                                       andNotation:notation]];
             
            entry = [TBXML nextSiblingNamed:@"E" searchFromElement:entry];
        }
    }
    
    return entries;
}

@end
