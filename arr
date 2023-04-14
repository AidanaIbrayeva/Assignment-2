public class MyArrayList<E> implements List<E> {
    
    private Object[] elements;
    private int size;
    
    public MyArrayList() {
        this.elements = new Object[10];
        this.size = 0;
    }

    private void resize() {
        Object[] newElements = new Object[elements.length * 2];
        System.arraycopy(elements, 0, newElements, 0, size);
        elements = newElements;
    }

    @Override
    public boolean add(E element) {
        if (size == elements.length) {
            resize();
        }
        elements[size] = element;
        size++;
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
        for (int i = index; i < size - 1; i++) {
            elements[i] = elements[i+1];
        }
        elements[size-1] = null;
        size--;
        return removedElement;
    }

    @Override
    public int size() {
        return size;
    }

}
