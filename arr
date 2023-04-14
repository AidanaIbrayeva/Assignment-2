public class MyArrayList<E> implements MyList<E> {
    private Object[] elements;
    private int size;
    
    public MyArrayList() {
        elements = new Object[10];
        size = 0;
    }
    
    public boolean add(E element) {
        if (size == elements.length) {
            Object[] newElements = new Object[2 * size];
            for (int i = 0; i < size; i++) {
                newElements[i] = elements[i];
            }
            elements = newElements;
        }
        elements[size++] = element;
        return true;
    }
    
    public E get(int index) {
        if (index < 0 || index >= size) {
            throw new IndexOutOfBoundsException();
        }
        return (E) elements[index];
    }
    
    public E remove(int index) {
        if (index < 0 || index >= size) {
            throw new IndexOutOfBoundsException();
        }
        E removed = (E) elements[index];
        for (int i = index; i < size - 1; i++) {
            elements[i] = elements[i + 1];
        }
        elements[--size] = null;
        return removed;
    }
    
    public int size() {
        return size;
    }


}
//Test
//public static void main(String[] args) {
//    MyList<Integer> list = new MyArrayList<>();
//    System.out.println(list.size()); // Output: 0
//
//    list.add(1);
//    list.add(2);
//    list.add(3);
//    System.out.println(list.size()); // Output: 3
//
//    System.out.println(list.get(1)); // Output: 2
//
//    list.remove(1);
//    System.out.println(list.size()); // Output: 2
//    System.out.println(list.get(1)); // Output: 3
}

//code for MyLinkedList:


public class MyLinkedList<E> implements MyList<E> {

    private Node head;
    private Node tail;
    private int size;

    private class Node {
        private E element;
        private Node next;
        private Node prev;

        public Node(E element) {
            this.element = element;
            this.next = null;
            this.prev = null;
        }
    }

    public MyLinkedList() {
        head = null;
        tail = null;
        size = 0;
    }

    public int size() {
        return size;
    }

    public boolean isEmpty() {
        return size == 0;
    }

    public boolean contains(Object obj) {
        Node current = head;
        while (current != null) {
            if (current.element.equals(obj)) {
                return true;
            }
            current = current.next;
        }
        return false;
    }

    public boolean add(E element) {
        Node newNode = new Node(element);
        if (isEmpty()) {
            head = newNode;
            tail = newNode;
        } else {
            tail.next = newNode;
            newNode.prev = tail;
            tail = newNode;
        }
        size++;
        return true;
    }

    public boolean remove(Object obj) {
        if (isEmpty()) {
            return false;
        }
        Node current = head;
        while (current != null) {
            if (current.element.equals(obj)) {
                if (current == head) {
                    head = head.next;
                } else {
                    current.prev.next = current.next;
                }
                if (current == tail) {
                    tail = tail.prev;
                } else {
                    current.next.prev = current.prev;
                }
                size--;
                return true;
            }
            current = current.next;
        }
        return false;
    }

    public void clear() {
        head = null;
        tail = null;
        size = 0;
    }

    public E get(int index) {
        if (index < 0 || index >= size) {
            throw new IndexOutOfBoundsException();
        }
        Node current = head;
        for (int i = 0; i < index; i++) {
            current = current.next;
        }
        return current.element;
    }

    public E set(int index, E element) {
        if (index < 0 || index >= size) {
            throw new IndexOutOfBoundsException();
        }
        Node current = head;
        for (int i = 0; i < index; i++) {
            current = current.next;
        }
        E oldValue = current.element;
        current.element = element;
        return oldValue;
    }

    public void add(int index, E element) {
        if (index < 0 || index > size) {
            throw new IndexOutOfBoundsException();
        }
        Node newNode = new Node(element);
        if (index == 0) {
            newNode.next = head;
            head.prev = newNode;
            head = newNode;
        } else if (index == size) {
            tail.next = newNode;
            newNode.prev = tail;
            tail = newNode;
        } else {
            Node current = head;
            for (int i = 0; i < index - 1; i++) {
                current = current.next;
            }
            newNode.prev = current;
            newNode.next = current.next;
            current.next.prev = newNode;
            current.next = newNode;
        }
        size++;
    }

    public E remove(int index) {
        if (index < 0 || index >= size) {
            throw new IndexOutOfBoundsException();
        }
        Node current = head;
        for (int i = 0; i < index; i++) {
            current.prev
