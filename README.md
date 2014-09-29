Simple Swift.String Performance Test
====================================

This is an initial performance test comparing iteration through a string in
Swift and Objective-C.  With regards to complex Unicode characters, one would
not expect a perfect apples-to-apples comparison since Objective-C returns
`unichar` elements and Swift returns composed characters with possible heap
usage in complex cases.  That said, ASCII representable characters should have
a similar footprint.

The results are staggering though.

![Screenshot from Instruments](screenshot.png)

*Testing in Xcode 6.1β*

Iterating over 100,000 ASCII-representable characters and comparing to an
ASCII-representable character:

|       |Swift [-O0] | Swift [-Os] | Objective-C [-O0] |
|-------|------------|-------------|-------------------|
| Time  | 0.727s     | 0.479s      | 0.002s            |
| STDEV | 3%         | 2%          | 13%               |

Iterating over 100,000 composite characters and comparing to a single
ASCII-representable character has an interesting result:

|       |Swift [-O0] | Swift [-Os] | Objective-C [-O0] |
|-------|------------|-------------|-------------------|
| Time  | 1.053s     | 0.726s      | 0.008s            |
| STDEV | 3%         | 3%          | 14%               |

The Objective-C result is expected as I went from 100,000 to 425,000 unichars
but Swift's costs did not scale nearly as much, meaning the internal work of
composing characters (and even heap allocating 25% of them) offloaded some of
the other costs.

Profile is included but some highlights (just from looking in the middle of the
ASCII Swift peak):

- Lots (15.4%) of retaining and releasing of CFStrings even in ASCII case
  (resulting in a lot of atomic testing).
- Lots (9.8%) of message sending.  In `Character.init`, in
  `<Character,Character>==`
- Lots (10.4%) of Swift retaining and releasing.
- Many other things.  In my inverted call tree over a partial range, there are
  over a 100 functions whose individual running times exceed the Objective-C
  version.
