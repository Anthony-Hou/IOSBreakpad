//
//  MyLog.m
//  IOSBreakpad
//
//  Created by dev on 2018/12/20.
//  Copyright © 2018 Juan Cruz Ghigliani. All rights reserved.
//

//#import <Foundation/Foundation.h>
#import "MyLog.h"

@implementation MyLog
//#pragma mark - 保存日志文件-
- (void)redirectNSLogToDocumentFolder
{
    //如果已经连接Xcode调试则不输出到文件
    if(isatty(STDOUT_FILENO))
    {
        return;
        
    }
    
    UIDevice *device = [UIDevice currentDevice];
    if([[device model] hasSuffix:@"Simulator"]){
        //在模拟器不保存到文件中
        return; }
    //获取Document目录下的Log文件夹,若没有则新建
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *logDirectory = [[paths objectAtIndex:0] stringByAppendingPathComponent:@"Log"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL fileExists = [fileManager fileExistsAtPath:logDirectory];
    if (!fileExists) {
        [fileManager createDirectoryAtPath:logDirectory withIntermediateDirectories:YES attributes:nil error:nil];
        
    }
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"]];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    //每次启动后都保存一个新的日志文件中
    NSString *dateStr = [formatter stringFromDate:[NSDate date]];
    NSString *logFilePath = [logDirectory stringByAppendingFormat:@"/%@.txt",dateStr];
    
    // freopen 重定向输出输出流,将log输入到文件
    freopen([logFilePath cStringUsingEncoding:NSASCIIStringEncoding], "a+", stdout);
    freopen([logFilePath cStringUsingEncoding:NSASCIIStringEncoding], "a+", stderr);
    
}

@end
