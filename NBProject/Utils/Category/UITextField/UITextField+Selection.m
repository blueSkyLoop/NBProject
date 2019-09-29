//
//  UITextField+Selection.m
//  NBProject
//
//  Created by Lucas on 2019/9/2.
//  Copyright © 2019年 com.cn. All rights reserved.
//

#import "UITextField+Selection.h"

@implementation UITextField (Selection)

- (NSRange)lo_selectedRange {
     
    UITextPosition* beginning = self.beginningOfDocument;
     
    UITextRange* selectedRange = self.selectedTextRange;
     
    UITextPosition* selectionStart = selectedRange.start;
     
    UITextPosition* selectionEnd = selectedRange.end;
     
    const NSInteger location = [self offsetFromPosition:beginning toPosition:selectionStart];
     
    const NSInteger length = [self offsetFromPosition:selectionStart toPosition:selectionEnd];
     
    return NSMakeRange(location, length);
}


- (void)lo_setSelectedRange:(NSRange) range {
     
    UITextPosition* beginning = self.beginningOfDocument;
     
    UITextPosition* startPosition = [self positionFromPosition:beginning offset:range.location];
     
    UITextPosition* endPosition = [self positionFromPosition:beginning offset:range.location + range.length];
     
    UITextRange* selectionRange = [self textRangeFromPosition:startPosition toPosition:endPosition];
     
    [self setSelectedTextRange:selectionRange];
    
}


@end
