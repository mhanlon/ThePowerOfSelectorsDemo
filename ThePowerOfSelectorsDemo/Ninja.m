//
//  Ninja.m
//  ThePowerOfSelectorsDemo
//
//  Created by Matthew Hanlon on 3/11/15.
//  Copyright (c) 2015 Q.I. Software. All rights reserved.
//

#import "Ninja.h"

@implementation Ninja

- (NSString*)sneak
{
    NSLog(@"The ninja sneaks around.");
    return @"The ninja sneaks around.";
}

- (NSString*)leap
{
    NSLog(@"The ninja leaps.");
    return @"The ninja leaps.";
}

- (BOOL)didSeeNinja
{
    return NO;
}

- (BOOL)didNotSeeNinja
{
    return YES;
}

@end
