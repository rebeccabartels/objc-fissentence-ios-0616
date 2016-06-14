//
//  FISSentence.h
//  objc-fissentence
//
//  Created by Rebecca Bartels on 6/13/16.
//  Copyright © 2016 The Flatiron School. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FISSentence : NSObject

@property (strong, nonatomic, readonly) NSString *sentence;  //if primitive, it would just be nonatomic.

@property (strong, nonatomic) NSMutableArray *words;

@property (strong, nonatomic) NSString *punctuation;

//Declaring Methods Below
//SYNTAX for declaring methods: (return type)method name:(argumentType *)argument name;
//addWord: which takes one argument, an NSString called word,

- (void)addWord:(NSString*)word;

- (void)addWords:(NSArray *)words
 withPunctuation:(NSString *)punctuation;

- (void)removeWordAtIndex:(NSUInteger *)index;

- (void)insertWord:(NSString *)word
           atIndex:(NSUInteger *)index;
- (void)replacePunctuationWithPunctuation:(NSString *)punctuation;

- (void)replaceWordAtIndex:(NSUInteger *)index
                  withWord:(NSString *)word;








@end
