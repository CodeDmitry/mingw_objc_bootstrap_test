Summary:

At the time of writing, MinGW supports the compilation of objective C via the `-lobjc` flag, however there is no provided root object to use for creating your own Objective C classes. 

- At the time of writing, MSYS2 supports Objective C via gcc's `-lobjc` flag, gcc however does not offer an NSObject equivalent with fresh installations. 
- NSObject or an equivelent root object is necessary in order to have Objective C do except for calling of class methods(~static methods).
- Figuring out how to make an NSObject/RootObject is not trivial, so this project offers one as an example, namely RootObject implemented in `RootObject.h`.
- In addition to providing `RootObject.h`, this project provides two demonstrations for objective C contained in `test1.m` and `test2.m` (both built with `build` script provided). The first test is more verbose and covers more features of objective C. The second test is minimal and tests whether `RootObject.h` behaves as expected.

Contents:
- README.md this file
- RootObject.h, implements RootObject, simulating minimal behavior of NSObject, no thread safety implemented, no quality guarantees, absolutely minimal.
- build a bash script to build the test programs "test1.m" and "test2.m".
- test1.m a fairly minimal proof of concept of objective c testing some of the main features I wanted to try out.
- test2.m tests RootObject.h which is extracted out of test1.m with all comments and logging removed.

Background:

Installing objective C on MinGW: `pacman -S mingw-w64-x86_64-gcc-objc`

I host this specific project as this is the third time I am re-implementing this exact RootObject as all the existing online solutions are incomplete. 

The closest solution at the time of writing is this non-functional response within the question linked below. 

the question: https://stackoverflow.com/questions/10119971/objective-c-compilation-with-gcc-4-6-2

the user Francesco proposes a solution to do this, however: 
1. The header `<objc/Object.h>` was not included despite depending on it.
2. The header `<objc/runtime.h>` was not included despite depending on it, without which objc_createInstance appears to return an int instead of id.
3. The `+ (id) alloc` of `RootObject` implementation, class_createInstance's first argument is `[self class]`, whereas it 
    appears to only work if used with just `self`.

Using the `test1.m` of this project as a conceptional base, it is possible to write your own root objects to use for your mingw/msys2 objective c projects.
