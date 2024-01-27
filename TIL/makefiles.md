# Makefiles

## THE HELL DO THEY WORK
[See original post](https://stackoverflow.com/questions/77889324/variable-in-makefile-always-evaluates-to-false/77889378?noredirect=1#comment137319939_77889378)
The way make invokes a recipe is that FIRST, all the make constructs in the entire recipe are expanded.
All make variables, all make functions, etc. are all expanded first. Then once that is done and all values
are expanded, make will run a shell and give the resulting expanded output to the shell as a set of commands
to run. Then make waits for the shell to exit and checks its exit code. If it's 0 then the command succeeded
and make continues. If the exit code is not 0 then make considers that the recipe failed.
So, you just can't combine things like $(eval ...), $(error ...), etc. inside recipes because those things
are always expanded first.

Similarly, all make constructs like ifeq etc. are preprocessor statements in makefiles. They are processed
as the makefile is read in, before make decides which targets even need to be rebuilt much less tries to run recipes.
