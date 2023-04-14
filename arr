public class MyArrayList<E> implements List<E> {

    private Object[] elements;
    private int size;

    public MyArrayList() {
        elements = new Object[10]; // initialize with default size of 10
        size = 0;
    }

    @Override
    public boolean add(E element) {
        if (size == elements.length) {
            Object[] newElements = new Object[2 * size];
            System.arraycopy(elements, 0, newElements, 0, size);
            elements = newElements;
        }
        elements[size++] = element;
        return true;
    }

    @Override
    public E get(int index) {
        if (index < 0 || index >= size) {
            throw new IndexOutOfBoundsException();
        }
        return (E) elements[index];
    }

    @Override
    public E remove(int index) {
        if (index < 0 || index >= size) {
            throw new IndexOutOfBoundsException();
        }
        E removedElement = (E) elements[index];
        System.arraycopy(elements, index + 1, elements, index, size - index - 1);
        elements[--size] = null; // to prevent memory leak
        return removedElement;
    }

    // other methods of List interface can be implemented here

}
