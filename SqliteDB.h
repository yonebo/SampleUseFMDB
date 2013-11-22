//
//  SqliteDB.h
//  SampleUseFMDB
//
//  Created by MacPro01 on 2013/11/20.
//  Copyright (c) 2013年 eyoneya. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <sqlite3.h>
#import "FMDatabase.h"

#define BASEDB @"test777Base.sqlite"
#define DBPATH @"test777.sqlite"
#define DBFLAG @"dbflag"

@interface SqliteDB : NSObject{
    
}

- (void) initializeDatabaseIfNeeded;

+ (NSString*) getDatabaseFilePath;

+ (FMDatabase*) getDB;

@end
