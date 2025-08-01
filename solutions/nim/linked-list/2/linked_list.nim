type
  Node[T] = ref object
    next, prev: Node[T]
    data: T

  LinkedList*[T] = object ## A doubly linked list.
    first, last: Node[T]
    length: int

proc len*[T](list: LinkedList[T]): int =
  list.length

proc push*[T](list: var LinkedList[T], val: T) =
  let newNode = Node[T](next: nil, prev: list.last, data: val)
  if list.last != nil:
    list.last.next = newNode
  else:
    list.first = newNode
  list.last = newNode
  list.length.inc()

proc pop*[T](list: var LinkedList[T]): T =
  result = list.last.data
  if list.last.prev != nil:
    list.last = list.last.prev
    list.last.next = nil
  else:
    list.first = nil
    list.last = nil
  list.length.dec()

proc shift*[T](list: var LinkedList[T]): T =
  result = list.first.data
  if list.first.next != nil:
    list.first = list.first.next
    list.first.prev = nil
  else:
    list.first = nil
    list.last = nil
  list.length.dec()

proc unshift*[T](list: var LinkedList[T], val: T) =
  if list.first == nil:
    list.push(val) 
    return
  let newNode = Node[T](prev: nil, next: list.first, data: val)
  list.first = newNode
  list.first.next.prev = list.first
  list.length.inc()

proc delete*[T](list: var LinkedList[T], val: T) =
  var curNode = list.first
  while curNode != nil:
    if curNode.data == val:
      if curNode.prev != nil:
        curNode.prev.next = curNode.next
      else:
        list.first = curNode.next
      if curNode.next != nil:
        curNode.next.prev = curNode.prev
      else:
        list.last = curNode.prev
      list.length.dec()
      return
    curNode = curNode.next
