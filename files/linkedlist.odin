package LinkedList;

import "core:fmt"

/*
 * Node struct. Contains a pointer to the value and a pointer to the next node.
 */
Node :: struct(T: typeid) {
    value: T,
    next: ^Node(T),
}

/*
 * Linked List struct. Of type T and passes it down to the Nodes. Also contains its length.
 */
LinkedList :: struct(T: typeid) {
    first: ^Node(T),
    last: ^Node(T),
    length: int,
}

/*
 * Possible values that can be gotten from the functions.
 * :value: NOERR No error has occured.
 * :value: OUT_OF_BOUNDS The index supplied is outside the boundaries of the list.
 * :value: EMPTY_LIST The list is empty.
 */
LinkedListError :: enum {
    NOERR,
    OUT_OF_BOUNDS,
    EMPTY_LIST,
}

/*
 * Inserts a value at the end of the list.
 * :param: list The LinkedList to append to.
 * :param: value The value to append as a Node.
 */
insert :: proc(list: ^LinkedList($T), value: T) {
    list, value := list, value;

    // Create the new node
    node := new(Node(T));
    node.value = value;

    // Making sure the first value is initialized when it's empty
    if (list.first == nil) {
        list.first = node;
    }

    // If the last index isn't nil, make sure to set the last node's next pointer to the new node
    if (list.last != nil) {
        list.last.next = node;
    }

    // Setting the last index to the new node
    list.last = node;
    list.length += 1;
}

/*
 * Inserts a value at the the specified index in the list.
 * :param: list The LinkedList to insert into.
 * :param: value The value to insert as a Node.
 * :param: index The index to insert into.
 *
 * :return: Returns one of the three errors.
 */
insertAt :: proc (list: ^LinkedList($T), value: T, index: int) -> LinkedListError {
    list := list;

    // Out-of-bounds check
    if (index >= list.length) {
        return .OUT_OF_BOUNDS;
    }

    previous: ^Node(T);
    node := list.first;

    // Create a new node to insert
    newnode := new(Node(T));
    newnode.value = value;

    // Means the node is being set as the first
    if (index == 0) {
        newnode.next = list.first;
        list.first = newnode;
        return .NOERR;
    }

    // Means the node is being appended
    else if (index == list.length - 1) {
        list.last.next = newnode;
        list.last = newnode;
        return .NOERR;
    }

    // Oh no! The list is empty :( how could you?
    if (list.first == nil) {
        return .EMPTY_LIST;
    }

    // Looping until we get to the specified index
    for i := 0; i < index; i += 1 {
        previous = node;
        node = node.next;
    }

    // The legendary and very uneventful swap
    previous.next = newnode;
    newnode.next = node;
    list.length += 1;

    // Boring! Give me some errors!
    return .NOERR;
}

/*
 * Removes a value at the the specified index from the list.
 * :param: list The LinkedList to remove from to.
 * :param: index The index to remove from the list.
 *
 * :return: Returns one of the three errors.
 */
removeAt :: proc(list: ^LinkedList($T), index: int) -> LinkedListError {
    list := list;

    // Out-of-bounds check
    if (index >= list.length) {
        return .OUT_OF_BOUNDS;
    }

    // We need to store the last node we visited for pointer swapping, hence previous
    node := list.first;
    previous: ^Node(T);

    // Iterate until we reach the end of the list, making sure the list itself is initialized
    for i := 0; i < index; i += 1 {

        // The node will be nil only if the list is empty
        if (node == nil) {
            return .EMPTY_LIST;
        }

        // You've reached your destination!
        if (i == index - 1) {

            // If it's the first node, change the first to the new value
            if (list.first == node) {
                list.first = node.next;
            }

            // If it's the last node, make sure to set the last to the new value
            if (list.last == node) {
                list.last = previous;
            }

            // Move the removed node's next pointer to the previous node's next pointer
            previous.next = node.next;
        }

        // If the value doesn't match, then iterate the node variables
        else {
            previous = node;
            node = node.next;
        }
    }

    // As free as America!
    free(node);

    // The item was successfully removed!
    list.length -= 1;

    // Nothing happened! How uneventful...
    return .NOERR;
}

/*
 * Gets a Node at the the specified index from the list.
 * :param: list The LinkedList to get the Node from.
 * :param: index The index to get from the list.
 *
 * :return: Returns a Node and one of the three errors.
 */
get :: proc(list: ^LinkedList($T), index: int) -> (^Node(T), LinkedListError) {
    list := list;

    // Is it a bird? Is it a plain? No! It's an out-of-bounds check!
    if (index >= list.length) {
        return nil, .OUT_OF_BOUNDS;
    }

    node := list.first;

    // Iterate until we either reach the index we want, or reach the end of the list
    for i := 0; i <= index; i += 1 {

        // You've found the node! Now return it!
        if (i == index) {
            return node, .NOERR;
        }

        // If it hasn't found the note, iterate the variables
        else {
            node = node.next;
        }
    }

    // Empty list. Just like my heart
    return nil, .EMPTY_LIST;
}

/*
 * Gets a value at the the specified index from the list. Shorthand to having to call the actual get procedure.
 * :param: list The LinkedList to get the Node from.
 * :param: index The index to get from the list.
 *
 * :return: Returns a value and one of the three errors.
 */
getval :: proc(list: ^LinkedList($T), index:int) -> (T, LinkedListError) {
    node, err := get(list, index);
    return node.value, err;
}

/*
 * Pretty-prints the list.
 * :param: list The LinkedList to pretty-print
 *
 * :return: One of the three errors.
 */
print :: proc(list: ^LinkedList($T)) -> LinkedListError {
    fmt.print('[');

    // Pretty printing :)
    for i := 0; i < list.length; i += 1 {
        node, err := get(list, i);

        if (err != .NOERR) {
            return err;
        }

        fmt.print(node.value);

        if (i != list.length - 1) {
            fmt.print(", ");
        }
    }

    fmt.println(']');

    return .NOERR;
}

main :: proc() {

    // Creating a new list. Make sure it's initialized as a pointer!
    list := new(LinkedList(int));

    value: int;

    // Looping and inserting 1-5
    for i := 1; i <= 5; i += 1 {
        value = i;
        insert(list, value);
    }

    print(list);

    // Remove index 2, then insert a 5 where the 2 originally was
    removeAt(list, 2);
    insertAt(list, 5, 1);

    print(list);
}