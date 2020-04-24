#!/cygdrive/c/Ruby24-x64/bin/ruby -w
#
# @ Javier Felipe Toribio 2020-04-21
#
# Clase representando el lenguaje ruby
#

require_relative 'lenguaje'

class Ruby < Lenguaje

  # Reserved word => Description
  PALABRAS_RESERVADAS = {
    'BEGIN'         => 'Code, enclosed in { and }, to run before the program runs.',
    'END'           => 'Code, enclosed in { and }, to run when the program ends.',
    'alias'         => 'Creates an alias for an existing method, operator, or global variable.',
    'and'           => 'Logical operator; same as && except and has lower precedence.',
    'begin'         => 'Begins a code block or group of statements; closes with end.',
    'break'         => 'Terminates a while or until loop or a method inside a block.',
    '\case'         => 'Compares an expression with a matching when clause; closes with end.',
    'class'         => 'Defines a class; closes with end.',
    'def'           => 'Defines a method; closes with end.',
    'defined?'      => 'Determines if a variable, method, super method, or block exists.',
    'do'            => 'Begins a block and executes code in that block; closes with end.',
    'else'          => 'Executes if previous conditional, in if, elsif, unless, or when, is not true.',
    'elsif'         => 'Executes if previous conditional, in if or elsif, is not true.',
    'end'           => 'Ends a code block (group of statements) starting with begin, def, do, if, etc.',
    'ensure'        => 'Always executes at block termination; use after last rescue.',
    'false'         => 'Logical or Boolean false, instance of FalseClass. (See true.)',
    'for'           => 'Begins a for loop; used with in.',
    'if'            => 'Executes code block if true. Closes with end. ',
    'module'        => 'Defines a module; closes with end.',
    'next'          => 'Jumps before a loop\'s conditional.',
    'nil'           => 'Empty, uninitialized variable, or invalid, but not the same as zero; object of NilClass.',
    'not'           => 'Logical operator; same as !.',
    'or'            => 'Logical operator; same as || except or has lower precedence.',
    'redo'          => 'Jumps after a loop\'s conditional.',
    'rescue'        => 'Evaluates an expression after an exception is raised; used before ensure.',
    'retry'         => 'Repeats a method call outside of rescue; jumps to top of block (begin) if inside rescue.',
    'return'        => 'Returns a value from a method or block. May be omitted.',
    'self'          => 'Current object (invoked by a method).',
    'super'         => 'Calls method of the same name in the superclass. The superclass is the parent of this class.',
    'then'          => 'A continuation for if, unless, and when. May be omitted.',
    'true'          => 'Logical or Boolean true, instance of TrueClass.',
    'undef'         => 'Makes a method in current class undefined.',
    'unless'        => 'Executes code block if conditional statement is false.',
    'until'         => 'Executes code block while conditional statement is false.',
    'when'          => 'Starts a clause (one or more) under case.',
    'while'         => 'Executes code while the conditional statement is true.',
    'yield'         => 'Executes the block passed to the method.',
    '__FILE__'      => 'Name of current source file.',
    '__LINE__'      => 'Number of current line in the current source file.' }

  def initialize
     @tipo                = :ruby
     @nombre              = "ruby"
     @palabras_reservadas = PALABRAS_RESERVADAS.keys()
  end

end

# vim: tw=79:ts=2:
