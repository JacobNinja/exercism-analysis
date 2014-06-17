Exercism Analysis Library
=================

What?
====
The goal of this library is to provide a platform for running static analysis across different programming languages for [exercism.io](http://www.exercism.io)

Why?
====
Static analysis is a cheap way of finding obvious structural issues with code. 
By combining strategies of linting and workflow analysis, this library provides suggestive feedback for improving code.

What's currently here?
====
Exercism-analysis provides a bridge to the following libraries:
  * Javascript
    * JSHint
  * Ruby
    * Roodi
  * Python
    * Pylint

What is an analyzer?
====
An analyzer is a ruby object that responds to ```call```, and returns an array of ```Exercism::Analyzer::Result``` objects.
It has one argument ```adapter``` that can parse code and execute commands in the programming language's environment.

