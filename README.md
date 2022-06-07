sources:
https://stackoverflow.com/questions/10119971/objective-c-compilation-with-gcc-4-6-2
the user Francesco proposing an answer to do this, but 
1. He does not include <objc/Object.h> which his code relies on
2. He does not include <objc/runtime.h> without which objc_createInstance appears to return an int instead of id.
3. + (id) alloc of RootObject implementation, class_createInstance's first argument is [self class], whereas it 
    needs to be just self.