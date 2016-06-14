//
//  FISSentence.m
//  objc-fissentence
//
//  Created by Rebecca Bartels on 6/13/16.
//  Copyright © 2016 The Flatiron School. All rights reserved.
//

#import "FISSentence.h"

@interface FISSentence ()

@property (strong, nonatomic, readwrite) NSString *sentence;

@end

@implementation FISSentence


- (void)addWord:(NSString*)word {
    if ([self validWord: word]) {       //IF self validWord is Yes, then it will execute self.words addObject:word. If no, it won't.
        [self.words addObject:word];
    
    }
    
    
    
    [self assembleSentence];
    
}

- (void)assembleSentence {                     //curly brackets contain the definition of the method
    self.sentence =                            // Set the sentence property of FISSentence equal to the return of this method call (componentsJoinedbystring:)
    [self.words componentsJoinedByString:@" "];  //we have an array of words and are turning it into a string by joining each element of the array with a space (@" ")
    self.sentence =
    [self.sentence stringByAppendingString: self.punctuation];
    
    
    //setter getter method.
    
}

- (BOOL)validWord: (NSString *)word
{
                                                //Refactor: take some aspect of the method, put it into its own seperate method, and call it on self to use it in the original method.
    if (![word isEqualToString:@" "] && ![word isEqualToString:@""] && !(word == nil)) {
        return YES;
    }
    else {
        return NO;
    }
}

- (BOOL)validPunctuation: (NSString *)punctuation
{
    
    // hard coding
    if (([punctuation isEqualToString:@"."] || [punctuation isEqualToString:@"?"] || [punctuation isEqualToString:@"!"] || [punctuation isEqualToString: @","] || [punctuation isEqualToString:@":"] || [punctuation isEqualToString:@"-"] || [punctuation isEqualToString:@";"] )&& punctuation != nil) {

        return YES;
    }
    return NO;
    
}

- (void)addWords:(NSArray *)words
 withPunctuation:(NSString *)punctuation {
    
    
    NSArray *newArray = @[@".",@"?",@"!",@",",@":",@"-",@";"];
    

    if (words != nil && [words count] != 0) {                   // == equals ; != not equals. Checking if the array is legit.
        
        for (NSString *elements in words) {        //If it's a valid array, then for each of the elements in words (the strings in the *newArray)
            if ([self validWord:(elements)]) {
                [self.words addObject:(elements)];
            
            }
        }
        
        
                                                                //we added the argument NSArray words to the words property. [self.words addObjectsFromArray:(words)];
    }
    else {
        return ;
    }
    

    if ([newArray containsObject:punctuation])  //if the punctuation is actually punctuation
    {
        self.punctuation = punctuation;      // I am putting punctuation NSString into the property.
    }
    else {
        return ;
    }
    
    [self assembleSentence];       //call this method at the end of these methods. This means to run the other method. 
    
    
    
    
//    if ([self validWord: punctuation]) {
//        self.punctuation = punctuation;
//    }
//    
    
}
- (BOOL)validIndex:( NSUInteger)index {

    if ([self.words count] > index) {   //whole method itself is the helper method
        return YES;
    }
    
    
    return NO;
}
- (void)removeWordAtIndex:(NSUInteger)index{
    if ([self validIndex:index])  {
        [self.words removeObjectAtIndex:index];
    }
[self assembleSentence];
    
}

- (void)insertWord:(NSString *)word
           atIndex:(NSUInteger)index{
    if ([self validIndex:index] && [self validWord:word]) {
        [self.words insertObject:word atIndex:index];
    }
      [self assembleSentence];
}

- (void)replacePunctuationWithPunctuation:(NSString *)punctuation{
    
    
    if ([self validPunctuation:punctuation]) {
        self.punctuation=punctuation;
        
    }
    
    [self assembleSentence];
    

}


- (void)replaceWordAtIndex:(NSUInteger)index
                  withWord:(NSString *)word{
    if ([self validIndex:index] && [self validWord:word]) {
        self.words[index]=word;
        
    }
      [self assembleSentence];
}

    

@end
