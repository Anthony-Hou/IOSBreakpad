//
//  BPAppDelegate.h
//  IOSBreakpad
//
//  Created by Juan Cruz Ghigliani on 03/06/14.
//  Copyright (c) 2014 Juan Cruz Ghigliani. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BPAppDelegate : UIResponder <UIApplicationDelegate>
- (void)redirectNSLogToDocumentFolder;
@property (strong, nonatomic) UIWindow *window;

@end
