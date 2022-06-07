This project serves as a proof of concept for compiling objective c code with root object support(analogous to NSObject) using gcc under msys2 environment. 

This specific project is warranted/justified as this is the third time I am remaking this exact proof-of-concept, due to all online solutions being incomplete,
with closest one being the question linked below, having specific problems I need to solve each time I want to use objective c in mingw.

the question:
https://stackoverflow.com/questions/10119971/objective-c-compilation-with-gcc-4-6-2
the user Francesco proposing an answer to do this, however: 
1. He does not include `<objc/Object.h>` which his code relies on
2. He does not include `<objc/runtime.h>` without which objc_createInstance appears to return an int instead of id.
3. the `+ (id) alloc` of `RootObject` implementation, class_createInstance's first argument is `[self class]`, whereas it 
    needs to be just `self`.
