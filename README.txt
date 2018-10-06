Project 1 Giraffe Cover

Written by:
    Team NLP
    Cristopher Hernandez

Contact: 
    cristopherh@csu.fullerton.edu

Class: 
    CPSC-481-03

Introduction:
  This project is to write a Lisp program to find a sequence of moves for a chess giraffe that “covers” (visits all the squares) minimally on a 7x7 chess board. 
  A square can be visited only once in a minimal “cover”.

  A "giraffe" is a special chess piece which can:
    - Move like a knight
    - Move like a rook (with the limitation that 'rook' style moves are 1 space at a time max).
  
  The goal is to print out a sequence of coordinates (as a list) which the giraffe could use to perform the minimal cover.

External Requirements: 
  None, aside from Lisp

Build:
  Executable from the command line without compilation. 
  However, a compiled version can be created using:

  (COMPILE-FILE "project_1.lisp")

  In a Common Lisp REPL

Installation:
  files list:
    project_1.lisp

Setup:
  This solution was written and tested with GNU Common Lisp for Windows.
  CLISP for windows can be downloaded and installed here: https://sourceforge.net/projects/clisp/files/

Usage:
  run on command line:

  clisp project_1.lisp

  load compiled .fas in REPL:

  (LOAD "project_1.fas")

Extra Features:
  None

Bugs:
  No known bugs at this time.
