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
    private class Node {
        public E data;
        public Node next;
        
        public Node(E data) {
            this.data = data;
            this.next = null;
        }
    }
    
    private Node head;
    private int size;
    
    public MyLinkedList() {
        this.head = null;
        this.size = 0;
    }
    
    public void add(E element) {
        Node newNode = new Node(element);
        if (this.head == null) {
            this.head = newNode;
        } else {
            Node currentNode = this.head;
            while (currentNode.next != null) {
                currentNode = currentNode.next;
            }
            currentNode.next = newNode;
        }
        this.size++;
    }
    
    public E get(int index) {
        Node currentNode = this.head;
        for (int i = 0; i < index; i++) {
            currentNode = currentNode.next;
        }
        return currentNode.data;
    }
    
    public E remove(int index) {
        if (index == 0) {
            E element = this.head.data;
            this.head = this.head.next;
            this.size--;
            return element;
        } else


