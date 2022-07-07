#include "RootObject.h"
#include <stdio.h>

// proof of concept to demonstrate instantiation/subclassing of RootObject
@interface Greeter : RootObject {}
- (void) greet;
- (id) greetWithMessage:(const char *)theMessage;
@end
@implementation Greeter 
- (void) greet {
    puts("[Greeter:greet] Hello, World!");
}
- (id) greetWithMessage:(const char *)theMessage {
    printf("[Greeter:greetWithMessage] %s\n", theMessage);
    return self;
}
@end

int main(int argc, char **argv)
{
    id greeter = [[Greeter alloc] init];
    [greeter greet];
    [greeter greetWithMessage: "Hello there!"];

    return 0;
}