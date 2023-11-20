// Last modified: November 20, 2023, Monday, 7:34AM EST
// Demonstrates instantiation and subclassing of RootObject, 
// as well as catching messages and forwarding them to the
// superclass.
#import "RootObject.h"
#import <stdio.h>

// The interface.
@interface Greeter : RootObject {}
- (void) greet;
- (id) greetWithMessage:(const char *)theMessage;
@end

// The implementation.
@implementation Greeter 
- (void) greet {
    puts("[Greeter:greet] Hello, World!");
}
- (id) greetWithMessage:(const char *)theMessage {
    printf("[Greeter:greetWithMessage] %s\n", theMessage);
    return self;
}
// Trap the release message before forwarding it over to our superclass(RootObject).
- (void) release {
    puts("[Greeter:release] Goodbye!");
    [super release];
}
@end

int main(int argc, char **argv)
{
    id greeter = [[Greeter alloc] init];
    [greeter greet];
    [greeter greetWithMessage: "Hello there!"];
    [greeter release];

    return 0;
}
