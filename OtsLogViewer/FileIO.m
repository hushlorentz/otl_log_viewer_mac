//
//  FileIO.m
//  OtsLogViewer
//
//  Created by Rich Halliday on 7/20/17.
//  Copyright © 2017 Rich Halliday. All rights reserved.
//

#import "FileIO.h"

@implementation FileIO

+ (TBXML *)parseXMLFile:(NSString *)path
{
    NSError *error = nil;
    NSString *xmlString = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&error];
    TBXML *parsedXML = nil;
    
    if (!xmlString)
    {
        NSLog(@"Error reading file: %@ - %@", path, [error localizedDescription]);
    }
    else
    {
        parsedXML = [TBXML tbxmlWithXMLString:xmlString error:&error];
        
        if (!parsedXML)
        {
            NSLog(@"Error reading xml file: %@", [error localizedDescription]);
        }
    }

    return parsedXML;
}

@end
