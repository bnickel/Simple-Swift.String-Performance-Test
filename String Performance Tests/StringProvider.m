//
//  StringProvider.m
//  String Performance
//
//  Created by Brian Nickel on 9/29/14.
//
//

#import "StringProvider.h"

@implementation StringProvider

+ (NSString *)stringWithLength:(NSInteger)length unicode:(BOOL)unicode
{
    static NSMutableDictionary *dictionary;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dictionary = [NSMutableDictionary dictionary];
    });
    
    NSUInteger indexes[] = {length, !!unicode};
    NSIndexPath *indexPath = [NSIndexPath indexPathWithIndexes:indexes length:2];
    
    NSString *existingText = dictionary[indexPath];
    if (existingText) {
        return existingText;
    }
    
    static NSString *const text = @"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque nunc turpis, pretium sit amet pellentesque nec, iaculis ac felis. Proin at consectetur ipsum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer aliquet posuere purus. Morbi at velit sollicitudin, vestibulum leo a, tincidunt urna. Proin maximus purus ut felis molestie hendrerit. Sed eu porttitor dui, a iaculis nulla. Nam porta metus sit amet purus auctor, sit amet sagittis nibh faucibus. Donec feugiat sodales imperdiet. Sed semper tellus id porta gravida. Vivamus eget est velit. Maecenas quis posuere nisl. Integer turpis urna, dignissim gravida maximus eget, rhoncus eu nisl. Nullam vulputate libero vitae nulla convallis, eu commodo elit lobortis. Ut sit amet est sem. Nulla vehicula varius quam, non consequat sem mattis quis. Nulla commodo hendrerit laoreet. Pellentesque nec laoreet velit, a hendrerit nisl. Morbi cursus, dui non aliquam aliquet, nibh magna euismod lacus, ut volutpat dui ligula a volutpat.";
    
    NSArray *unicodeCharacters = @[@"🐕", @"β̅", @"⬇️", @"M̲̖͊̒ͪͩͬ̚̚͜"];
    
    NSMutableString *output = [NSMutableString string];
    
    while (length > 0) {
        if (unicode) {
            [output appendString:unicodeCharacters[length % unicodeCharacters.count]];
            length --;
        } else if (length >= text.length) {
            [output appendString:text];
            length -= text.length;
        } else {
            [output appendString:[text substringToIndex:length]];
            length = 0;
        }
    }
    
    NSString *immutableOutput = [output copy];
    dictionary[indexPath] = immutableOutput;
    return immutableOutput;
}

@end
