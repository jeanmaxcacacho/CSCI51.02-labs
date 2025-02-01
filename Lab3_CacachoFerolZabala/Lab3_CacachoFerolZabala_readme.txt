Our group's implementation of a stack data structure builds on top
of a singly linked list. Our stack's top is the head of a linked list,
this is so that pop() and peek() will not require traversal thus only
having a time complexity of O(1).

The implementation of the fundamental stack operations: push(), pop(), and
peek() were relatively simple. This is because our stack struct keeps a pointer
to the current topmost element. Implementing the data structure's operations
mostly just revolved around managing the node next to this node.

Pushing an element to the stack is just instantiating a new node and making
it the new top, the old top is stored in the new top's next pointer. Popping
on the otherhand is working in reverse, the current top node is stored in a
temporary pointer along with its data. The node it is linked to is made the
new top and the temporary pointer is released from memory. Since a pointer is
kept to reference the current topmost element, peek just returns the data stored
in this pointer.

Another property our implementation has is that being based off a linked
list, the size is dynamic. This means that it can grow or shrink as needed,
the only limitation to its size is the amount of memory available to
the program.

For the sake of simplicity the IntStack struct is instantiated to be empty.