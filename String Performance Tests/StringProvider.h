//
//  StringProvider.h
//  String Performance
//
//  Created by Brian Nickel on 9/29/14.
//
//

#import <Foundation/Foundation.h>

@interface StringProvider : NSObject
+ (NSString *)stringWithLength:(NSInteger)length unicode:(BOOL)unicode;
@end
