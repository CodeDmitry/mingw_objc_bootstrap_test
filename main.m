#include <stdio.h>
#include <assert.h>
#include <objc/Object.h>
#include <objc/runtime.h>

// test if class methods work.
@interface ClassMethodTest {}
+ (void) greet;
@end
@implementation ClassMethodTest
+ (void) greet
{
    puts("[ClassMethodTest:greet] Hello, World!");
}
@end

// a ref counted object
@interface RootObject : Object {
    unsigned int retainCount;
}
+ (id) alloc;
- (id) init;
- (id) retain;
- (void) release;
@end

@implementation RootObject
+ (id) alloc {
    // let us assure ourselves that these two are equivelent in terms of general behavior.
    assert([self class] == object_getClass(self));
    // class_createInstance will appear to return int unless <objc/runtime.h> is included.
    // took forever to realize to use "self" instead of [self class] as first argument.
    id myObj = (id)class_createInstance(self, 0);  
    assert(myObj && "class_createInstance failed");
    return myObj;
}
- (id) init {
    retainCount = 1;
    puts("initialized");
    return self;
}
- (id) retain {
    ++retainCount;
    return self;
}
- (void) release {
    --retainCount;
    // reachability test.
    printf("[RootObject:release] retain is %d.\n", retainCount);
    if (retainCount == 0) {
        // reachability test.
        puts("[RootObject:release] retain is 0, disposing.");
        object_dispose(self);
        puts("[RootObject:release] disposal complete.");
    }
}
@end

@interface Greeter : RootObject {}
- (void) greet;
@end
@implementation Greeter 
- (void) greet {
    puts("[Greeter:greet] Hello, World!");
}
@end

int main(int argc, char **argv)
{
    // test if id type exists.
    //id idtypetest;
    
    // test if class methods work.
    // [ClassMethodTest greet];
    
    id greeter = [[Greeter alloc] init];
    [greeter greet];    
    [greeter release];

    return 0;
}   