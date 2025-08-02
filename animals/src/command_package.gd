class_name CommandPackage 
extends RefCounted
## This compiles all commands to be issued to the controlled character, each
## frame. Constructed by Controllers.

var jump : bool = false
var interact : bool = false
var fastfall: bool = false
var movement : float = 0.0 # from getaxis
