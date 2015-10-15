//
//  MyUtil.h
//  fixtool
//
//  Created by JAPAN SHOP on 10/15/15.
//  Copyright © 2015 JAPAN SHOP. All rights reserved.
//

#ifndef MyUtil_h
#define MyUtil_h

@interface MyUtil:NSObject
/* method declaration */
- (int)max:(int)num1 andNum2:(int)num2;
- (NSString *)getCacheDirPath;
- (NSMutableArray *)showFiles;
- (void)changeFilePermission;

@end

#endif /* MyUtil_h */
