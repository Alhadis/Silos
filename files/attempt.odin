package main
import "core:fmt"

LinkedList :: struct
{
  head: ^Node,
  tail: ^Node,
  len: int,
}

Node :: struct
{
  next: ^Node,
  value: int,
}


flush :: proc(list: ^LinkedList)
{
  current := list.head;
  for i := 0; i <= list.len; i += 1
  {
    next := current.next;
    free(current);
    current = next;
  }
}

append_list :: proc(list: ^LinkedList, value: int)
{
  // Be sure to free!!
  new_node := new(Node);
  new_node.value = value;

  if list.len > 0
  {
    t := list.tail;
    t.next = new_node;
    list.tail = new_node;
  }
  else
  {
    list.head = new_node;
    list.tail = new_node;
  }

  list.len += 1;
}

pop_from :: proc(list: ^LinkedList) -> (value: int, success: bool)
{
  if list.len <= 0 
  {
    return 0, false;
  }

  if list.tail == list.head 
  {
    value := list.head.value;
    free(list.head);
    list.head = nil;
    list.tail = nil;
    list.len = 0;
    return value, true;
  }
  
  result := list.tail.value;
  tail := list.tail;
  new_tail := list.head;
  
  for new_tail.next != tail
  {
    new_tail = new_tail.next;
  }

  free(list.tail);
  new_tail.next = nil;
  list.tail = new_tail;
  list.len -= 1;

  return result, true;
}

main :: proc()
{
  new_list := LinkedList { nil, nil, 0 };
  
  append_list(&new_list, 10); 
  append_list(&new_list, 12); 
  append_list(&new_list, 13); 
  append_list(&new_list, 14); 
  append_list(&new_list, 15); 
  fmt.printf("%d\n", new_list.len);

  current := new_list.head;

  for i := 0; i < new_list.len; i += 1
  {
    fmt.printf("%d\n", current.value);
    current = current.next;
  }
  result: int;
  success: bool;

  result, success = pop_from(&new_list);
  fmt.printf("%d\n", result);
  result, success = pop_from(&new_list);
  fmt.printf("%d\n", result);
  fmt.printf("%d\n", new_list.len);

  flush(&new_list);
}
