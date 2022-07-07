This project serves as a proof of concept for compiling objective c code with root object support(analogous to NSObject) using gcc under msys2 environment. 

Contents:
- README.md this file
- RootObject.h, implements RootObject, naively simulating behavior of NSObject, no thread safety implemented, no quality guarantees.
- build a bash script to build the test program "main.m".
- main.m a fairly comprehensive minimal proof of concept of objective c.
- test2.m tests RootObject.h which is extracted out of main.m with all comments and logging removed.

This specific project is warranted/justified as this is the third time I am remaking this exact proof-of-concept as all the existing online solutions are incomplete, with the closest solution being a flawed response within the question linked below. 

the question: https://stackoverflow.com/questions/10119971/objective-c-compilation-with-gcc-4-6-2

the user Francesco proposes a solution to do this, however: 
1. He does not include `<objc/Object.h>` in his code which his code relies on
2. He does not include `<objc/runtime.h>` in his code without which objc_createInstance appears to return an int instead of id.
3. the `+ (id) alloc` of `RootObject` implementation, class_createInstance's first argument is `[self class]`, whereas it 
    needs to be just `self`.

Using the `main.m` of this project as a conceptional base, it is possible to write your own root objects to use for your mingw/msys2 objective c projects.
