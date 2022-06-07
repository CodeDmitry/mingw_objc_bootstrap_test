This project serves as a proof of concept for compiling objective c code with root object support(analogous to NSObject) using gcc under msys2 environment. 

This specific project is warranted/justified as this is the third time I am remaking this exact proof-of-concept as all the existing online solutions are incomplete, with the closest solution being a flawed response within the question linked below. 

the question: https://stackoverflow.com/questions/10119971/objective-c-compilation-with-gcc-4-6-2

the user Francesco proposes a solution to do this, however: 
1. He does not include `<objc/Object.h>` in his code which his code relies on
2. He does not include `<objc/runtime.h>` in his code without which objc_createInstance appears to return an int instead of id.
3. the `+ (id) alloc` of `RootObject` implementation, class_createInstance's first argument is `[self class]`, whereas it 
    needs to be just `self`.
