//
//  ViewController.m
//  NSPredicate-Demo
//
//  Created by apple on 2017/12/29.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "ViewController.h"
#import "Student.h"
#import <FMDB/FMDB.h>

@interface ViewController ()
{
    FMDatabase *dataBase;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self timeLocal];

}
- (void)timeLocal{
    
}
-(void)debase{
    NSString *docsPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *dbPath   = [docsPath stringByAppendingPathComponent:@"test.db"];
    NSLog(@"path=%@",dbPath);
    //    FMDatabase *db     = [FMDatabase databaseWithPath:dbPath];
    //    First, make your queue.
    
    FMDatabaseQueue *queue = [FMDatabaseQueue databaseQueueWithPath:dbPath];
    
    //    Then use it like so:
    
    //    [queue inDatabase:^(FMDatabase *db) {
    //        [db executeUpdate:@"INSERT INTO myTable VALUES (?)", [NSNumber numberWithInt:1]];
    //        [db executeUpdate:@"INSERT INTO myTable VALUES (?)", [NSNumber numberWithInt:2]];
    //        [db executeUpdate:@"INSERT INTO myTable VALUES (?)", [NSNumber numberWithInt:3]];
    //
    //        FMResultSet *rs = [db executeQuery:@"select * from foo"];
    //        while ([rs next]) {
    //            //…
    //        }
    //    }];
    
    //    An easy way to wrap things up in a transaction can be done like this:
    NSLog(@"begin:%@",[NSDate date]);
    
    [queue inTransaction:^(FMDatabase *db, BOOL *rollback) {
        
        [db executeUpdate:@"creat table ftest (foo text)"];
        for (NSInteger i = 0; i<1000; i++) {
            [db executeUpdate:@"INSERT INTO ftest VALUES ('?')",[NSString stringWithFormat:@"%ld",i+1]];
            NSLog(@"=%@",[NSDate date]);
        }
        
        //        [db executeUpdate:@"INSERT INTO myTable VALUES (?)", [NSNumber numberWithInt:1]];
        //        [db executeUpdate:@"INSERT INTO myTable VALUES (?)", [NSNumber numberWithInt:2]];
        //        [db executeUpdate:@"INSERT INTO myTable VALUES (?)", [NSNumber numberWithInt:3]];
        
        //        if (whoopsSomethingWrongHappened) {
        //            *rollback = YES;
        //            return;
        //        }
        // etc…
        //        [db executeUpdate:@"INSERT INTO myTable VALUES (?)", [NSNumber numberWithInt:4]];
    }];
    NSLog(@"end=%@",[NSDate date]);
}
- (void)demo3{
    
    //    Student *st1 = [Student init:@"a1" age:22];
    //    Student *st2 = [Student init:@"a2" age:23];
    //    Student *st3 = [Student init:@"a3" age:24];
    //    Student *st4 = [Student init:@"a4" age:25];
    //    NSArray *values = @[st1,st2,st3,st4];
    //    NSArray *keys = @[@"st1",@"st2",@"st3",@"st4"];
    //    NSDictionary *dict = [NSDictionary dictionaryWithObjects:values forKeys:keys];
    //    NSString *path = @"/Users/apple/Desktop/cer/dict.xml";
    //
    //    if ([dict writeToFile:path atomically:YES]) {
    //        NSLog(@"yes");
    //    }else{
    //        NSLog(@"no");
    //    }
    //    NSArray *array1 = @[@"1",@"2",@"3"];
    //    NSArray *array2 = @[@"4",@"5",@"6"];
    //    NSArray *array3 = @[@"7",@"8",@"9"];
    //    NSArray *array4 = @[@"10",@"11",@"12"];
    //
    //  NSArray *array5 = [[array1 arrayByAddingObjectsFromArray:array2] arrayByAddingObjectsFromArray:array3];
    //
    //    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    //    [dic setObject:@"1" forKey:@"name"];
    //    [dic setObject:@"2" forKey:@"age"];
    //
    //  NSDictionary *dict3 = [dic dictionaryWithValuesForKeys:@[@"name",@"age"]];
    
    //    [self demo2];
}
-(void)demo2{
    NSString * firstName = @"Ben";
    
    NSArray * array = @[
                @{@"lastName":@"Turner"},
                @{@"firstName":@"Ben",
                  @"lastName":@"Ballard"}];
    
    NSPredicate *predicate=[NSPredicate predicateWithFormat:@"firstName like %@",firstName];
    NSArray * filteredArray = [array filteredArrayUsingPredicate:predicate];
    
    NSLog(@"filteredArray:%@",filteredArray);
}
- (void)predicate1{
    
    NSExpression *pression = [NSExpression expressionForKeyPath:@"revenue"];
    
    NSExpression *pression2 = [NSExpression expressionForConstantValue:[NSNumber numberWithInt:100000]];
    NSPredicate *GreaterThanpredicate = [NSComparisonPredicate predicateWithLeftExpression:pression rightExpression:pression2 modifier:NSDirectPredicateModifier type:NSNotEqualToPredicateOperatorType options:0];
    
    
    NSExpression *pression3 = [NSExpression expressionForConstantValue:[NSNumber numberWithInt:10000000]];
    NSPredicate *LessThanpredicate = [NSComparisonPredicate predicateWithLeftExpression:pression rightExpression:pression3 modifier:NSDirectPredicateModifier type:NSEqualToPredicateOperatorType options:0];
    
    NSCompoundPredicate * predicate3 =[NSCompoundPredicate andPredicateWithSubpredicates:@[GreaterThanpredicate,LessThanpredicate]];
}

@end
