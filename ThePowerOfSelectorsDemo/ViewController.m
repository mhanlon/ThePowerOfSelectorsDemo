//
//  ViewController.m
//  ThePowerOfSelectorsDemo
//
//  Created by Matthew Hanlon on 3/11/15.
//  Copyright (c) 2015 Q.I. Software. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) id ninja;

@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Create and store a ninja property. Note that we know nothing about ninjas, at this stage, we haven't imported the Ninja.h header.
    // So what we do is create our class from the handy NSClassFromString() function because we *can't* do this:
    // [[Ninja alloc] init] because, as mentioned, we know nothing about it.
    self.ninja = [[NSClassFromString(@"Ninja") alloc] init];
}

- (IBAction)leap:(id)sender
{
    // Now, this will generate a compiler warning, trying to prevent you from doing something maybe you didn't intend.
    // We'll see, in the next method, how to get rid of that warning. Because you don't really want to run the compiler with the -Wundeclared-selector flag to ignore these sorts of errors.
    if ( [self.ninja respondsToSelector:@selector(leap)] )
    {
        // Because we don't have access to the signature from a compiler point of view we need to stuff the
        // result in an `id`, which we can then inspect to see if it's an NSString and use it accordingly.
        id result = [self.ninja performSelector:@selector(leap)];
        if ( result && [result isKindOfClass:[NSString class]] )
        {
            self.textField.text = result;
        }
    }
    else
    {
        NSLog(@"Our ninja doesn't respond to the `leap` method.");
        // Clear our textfield
        self.textField.text = @"Our ninja doesn't leap.";
    }
}

- (IBAction)sneak:(id)sender
{
    SEL sneakSelector = NSSelectorFromString(@"sneak");
    if ( [self.ninja respondsToSelector:sneakSelector] )
    {
        id result = [self.ninja performSelector:sneakSelector]; // We still get a warning here because the runtime needs to know what to do with this result
        if ( result && [result isKindOfClass:[NSString class]] )
        {
            self.textField.text = result;
        }
    }
    else
    {
        NSLog(@"Our ninja doesn't respond to the `sneak` method.");
        self.textField.text = @"Our ninja doesn't sneak.";
   }
}

- (IBAction)clunkAround:(id)sender
{
    if ( [self.ninja respondsToSelector:@selector(clunk)] )
    {
        id result = [self.ninja performSelector:@selector(clunk)];
        if ( result && [result isKindOfClass:[NSString class]] )
        {
            self.textField.text = result;
        }
    }
    else
    {
        NSLog(@"Our ninja doesn't respond to the `clunk` method.");
        self.textField.text = @"Our ninja doesn't clunk.";
    }
}

- (IBAction)checkForNinjas:(id)sender
{
    if ( [self.ninja respondsToSelector:@selector(didSeeNinja)] )
    {
        // You can't use performSelector to return primitive values, objects only
        // This method may return as expected, but that's luck. See our next example, which will crash the app...
        id result = [self.ninja performSelector:@selector(didSeeNinja)];
        
        if ( result )
        {
            NSLog(@"We saw a ninja?");
        }
        else
        {
            NSLog(@"We didn't see a ninja.");
        }
        
        // The value we return is YES... which will cause a crash
        id secondResult = [self.ninja performSelector:@selector(didNotSeeNinja)];
    
        if ( secondResult )
        {
            NSLog(@"We didn't see a ninja?");
        }
        else
        {
            NSLog(@"We didn't NOT see a ninja.");
        }

    }
    else
    {
        NSLog(@"Our ninja doesn't respond to the `didNotSeeNinja` method.");
    }
}


@end
