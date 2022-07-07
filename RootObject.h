#ifndef ROOTOBJECT_H_ba393259_3c11_40a6_b2e0_6e8729bc365b
#define ROOTOBJECT_H_ba393259_3c11_40a6_b2e0_6e8729bc365b 

#include <objc/Object.h>
#include <objc/runtime.h>

@interface RootObject : Object {
    unsigned long retainCount;
}
+ (id) alloc;
- (id) init;
- (id) retain;
- (void) release;
@end
@implementation RootObject
+ (id) alloc {
    id myObj = (id)class_createInstance(self, 0);  
    return myObj;
}
- (id) init {
    retainCount = 1;
    return self;
}
- (id) retain {
    ++retainCount;
    return self;
}
- (void) release {
    --retainCount;
    if (retainCount == 0) {
        object_dispose(self);
    }
}
@end

#endif /* ROOTOBJECT_H_ba393259_3c11_40a6_b2e0_6e8729bc365b */