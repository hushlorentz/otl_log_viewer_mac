//
//  FileIO.h
//  OtsLogViewer
//
//  Created by Rich Halliday on 7/20/17.
//  Copyright © 2017 Rich Halliday. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TBXML.h"

@interface FileIO : NSObject

+ (TBXML *)parseXMLFile:(NSString *)path;

@end
