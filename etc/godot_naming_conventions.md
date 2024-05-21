# Godot Naming Conventions

Summarized from Docs (https://www.reddit.com/r/godot/comments/yngda3/gdstyle_naming_convention_and_code_order_cheat)

## Naming Conventions
| Type         | Convention    | Info                               |
| ------------ | ------------- | ---------------------------------- |
| File names   | snake_case    | yaml_parsed.gd                     |
| class_name   | PascalCase    | YAMLParser                         |
| Node names   | PascalCase    |
| Functions    | snake_case    |
| Variables    | snake_case    |
| Signals      | snake_case    | always in past tense "door_opened" |
| Constants    | CONSTANT_CASE |
| enum names   | PascalCase    |
| enum members | CONSTANT_CASE |

Prepend a single underscore (_) to virtual methods functions the user must override, private functions, and private variables:

## Code Order

01. tool
02. class_name
03. extends
04. # docstring

05. signals
06. enums
07. constants
08. exported variables
09. public variables
10. private variables
11. onready variables

12. optional built-in virtual _init method
13. built-in virtual _ready method
14. remaining built-in virtual methods
15. public methods
16. private methods

