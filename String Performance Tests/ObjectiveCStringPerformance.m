//
//  ObjectiveCStringPerformance.m
//  String Performance
//
//  Created by Brian Nickel on 9/29/14.
//
//

#import <Foundation/Foundation.h>
#import <XCTest/XCTest.h>
#import "StringProvider.h"

@interface ObjectiveCStringPerformance : XCTestCase
@end

@implementation ObjectiveCStringPerformance

- (void)testAsciiIteration {
    NSString *text = [StringProvider stringWithLength:100000 unicode:NO];
    
    sleep(2);
    
    [self measureBlock:^{
        for (NSInteger i = 0; i < text.length; i ++) {
            unichar c = [text characterAtIndex:i];
            if (c == '~') {
                NSLog(@"%d", c);
            }
        }
    }];
}

- (void)testUnicodeIteration {
    NSString *text = [StringProvider stringWithLength:100000 unicode:YES];
    
    sleep(2);
    
    [self measureBlock:^{
        for (NSInteger i = 0; i < text.length; i ++) {
            unichar c = [text characterAtIndex:i];
            if (c == '~') {
                NSLog(@"%d", c);
            }
        }
    }];
}

- (void)XtestIteration {
    
    NSString *text = [StringProvider stringWithLength:4 unicode:YES];
    
    for (NSInteger i = 0; i < text.length; i ++) {
        unichar c = [text characterAtIndex:i];
        NSLog(@"%d", c);
    }
}

@end
