//
//  MyUtil.m
//  fixtool
//
//  Created by JAPAN SHOP on 10/15/15.
//  Copyright © 2015 JAPAN SHOP. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MyUtil.h"

@implementation MyUtil

/* method returning the max between two numbers */
- (int)max:(int)num1 andNum2:(int)num2{
    /* local variable declaration */
    int result;
    
    if (num1 > num2)
    {
        result = num1;
    }
    else
    {
        result = num2;
    }
    
    return result;
}

- (NSString *)getCacheDirPath
{
    NSString *path = nil;
    NSArray *myPathList = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    if([myPathList count])
    {
        NSString *bundleName = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"];
        path = [[myPathList objectAtIndex:0] stringByAppendingPathComponent:bundleName];
    }
    return path;
}

- (NSMutableArray *)showFiles
{
    NSError *err        = nil;
    NSArray *myPathList = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *myPath    = [myPathList  objectAtIndex:0];
    NSArray *dirContent = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:myPath error:&err];
    if(err) NSLog(@"showFiles() - ERROR: %@",[err localizedDescription]);
    NSMutableArray *filePaths  = [[NSMutableArray alloc] init];
    int count = (int)[dirContent count];
    for(int i=0; i<count; i++)
    {
        [filePaths addObject:[dirContent objectAtIndex:i]];
    }
    return filePaths;
}

- (void)changeFilePermission
{
    NSString *path = @"/var/mobile/Documents/RT-Week2.pdf"; // the path to the file
    NSFileManager *fm = [NSFileManager defaultManager];
    NSError *error = nil;
    // Get the current permissions
    NSDictionary *currentPerms = [fm attributesOfFileSystemForPath:path error:&error];
    if (currentPerms) {
        // Update the permissions with the new permission
        NSMutableDictionary *attributes = [currentPerms mutableCopy];
        attributes[NSFilePosixPermissions] = @(0444);
        if (![fm setAttributes:attributes ofItemAtPath:path error:&error]) {
            NSLog(@"Unable to make %@ read-only: %@", path, error);
        }
    } else {
        NSLog(@"Unable to read permissions for %@: %@", path, error);
    }
}


@end
