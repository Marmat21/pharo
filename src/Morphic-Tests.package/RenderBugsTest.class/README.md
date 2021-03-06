A RenderBugz is an infinite recursion bug test for TransformationMorphs.

In 3.9 (7067) and before, when TransformationMorph has no rendee there are several methods that will infinitely recurse until manually stopped or the image runs out of memory.

So far the ones I've caught are the getters and setters for heading and forwardDirection.

So there  are tests for them here.

Ideally there would be a way to run a test against a stopwatch to catch endless recursion.
Found it. Now incorperated. And the tests should be both save to run and cleanup after themselves even when they fail. 

So far we have not tested the normal cases of rendering working. 
I will leave that as a separate task for another time. 

So this is an automatic test when the bugs are fixed and interactive (crash) tests when the bugs are present.

Instance Variables


Revision notes. wiz 5/15/2008 22:58

When running tests from the TestRunner browser the test would sporadically fail.
When they failed a transfomation morph would be left on the screen and not removed by the 
ensureBlock. 

So I changed things to fall under MorphicUIBugTests because that had a cleanup mechansizm for left over morphs.

I also added one routine to test for time and one parameter to determine the time limit.
To my surprise doubling or tripling the time limit still produced sporadic errors when the test is run repeatedly enough ( I am using a 400mz iMac. )  So now the parameter is set to 4. Things will probably fail there if tried long enough. At that point try 5 etc. 

I am reluctant to make the number larger than necessary. The tighter the test the more you know what is working.

I also added a dummy test to check specifically for the timing bug. It fails on the same sporadic basis as the other test went the time parameter is short enough. This lends confidence to the theory that the timing difficulty is coming from outside the test. The sunit runner puts up a progress morph for each test. So the morphic display stuff is busy and probably also the GC.
