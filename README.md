Summary:
- Objective C is a fun extension to C, however, at the time of writing, MSYS/MinGW does not offer NSObject out of the box. 
- NSObject or an equivelent root object is necessary in order to have Objective C do except for calling of class methods(~static methods).
- Figuring out how to make an NSObject/RootObject is not obvious, so this project offers one for you, namely RootObject implemented in `RootObject.h`.
- In addition to providing `RootObject.h`, this project provides two proof of concept tests for objective C contained in `test1.m` and `test2.m` respectively(both built with `build` script provided), the first test is more verbose and covers more features of objective C. The second test is minimal and mainly tests whether `RootObject.h` behaves as expected.

Contents:
- README.md this file
- RootObject.h, implements RootObject, simulating minimal behavior of NSObject, no thread safety implemented, no quality guarantees, absolutely minimal.
- build a bash script to build the test programs "test1.m" and "test2.m".
- test1.m a fairly minimal proof of concept of objective c testing some of the main features I wanted to try out.
- test2.m tests RootObject.h which is extracted out of test1.m with all comments and logging removed.

Background:

This specific project is warranted/justified as this is the third time I am remaking this exact proof-of-concept as all the existing online solutions are incomplete, with the closest solution being a flawed response within the question linked below. 

the question: https://stackoverflow.com/questions/10119971/objective-c-compilation-with-gcc-4-6-2

the user Francesco proposes a solution to do this, however: 
1. He does not include `<objc/Object.h>` in his code which his code relies on
2. He does not include `<objc/runtime.h>` in his code without which objc_createInstance appears to return an int instead of id.
3. the `+ (id) alloc` of `RootObject` implementation, class_createInstance's first argument is `[self class]`, whereas it 
    needs to be just `self`.

Using the `test1.m` of this project as a conceptional base, it is possible to write your own root objects to use for your mingw/msys2 objective c projects.
