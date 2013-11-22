//
//  SqliteDB.m
//  SampleUseFMDB
//
//  Created by MacPro01 on 2013/11/20.
//  Copyright (c) 2013年 eyoneya. All rights reserved.
//

#import "SqliteDB.h"

@implementation SqliteDB

// イニシャライズ：アプリ起動時に実行する
- (void) initializeDatabaseIfNeeded{
    /*
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;

    // - DBファイルのパス
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectoy = [paths objectAtIndex:0];
    NSString *flagPath = [documentDirectoy stringByAppendingPathComponent:DBFLAG];
    
    // dbflag file check
    //if (![fileManager fileExistsAtPath:flagPath isDirectory:NO]) {
    if (![fileManager fileExistsAtPath:flagPath]) {
        NSString *dbPath = [SqliteDB getDatabaseFilePath];
        NSLog(@"★DBのパス：%@", dbPath);
        NSString *templateDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:BASEDB];
        
        // remove database file
        if ([fileManager fileExistsAtPath:dbPath isDirectory:NO] == YES){
            [fileManager removeItemAtPath:dbPath error:NULL];
        }

        if ([fileManager fileExistsAtPath:templateDBPath] == YES){
            NSLog(@"★%@　あったよ", templateDBPath);
        }

        // copy database file
        NSLog(@"★%@　を　%@　にコピる", templateDBPath, dbPath);
        if (![fileManager copyItemAtPath:templateDBPath toPath:dbPath error:&error]){
            NSLog(@"err : %@", [error localizedDescription]);
            return;
        }
        
        // dbflag file create
        [fileManager createFileAtPath:flagPath contents:nil attributes:nil];
        
        NSLog(@"database path:%@", dbPath);
        NSLog(@"flag path:%@", flagPath);
    }
     */
    
    
    
    
    
    
}

+ (NSString*) getDatabaseFilePath{
    
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES);
    NSString * documentsDir = [paths objectAtIndex:0];
    return [documentsDir stringByAppendingPathComponent:DBPATH];
    
}

+ (FMDatabase*) getDB{
    NSString *dbPath = [self getDatabaseFilePath];
    FMDatabase *ret = [FMDatabase databaseWithPath:dbPath];
    return ret;
}

@end
