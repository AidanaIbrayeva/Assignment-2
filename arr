public class MyArrayList<E> implements List<E> {
    private Object[] elements;
    private int size;

    public MyArrayList() {
        this.elements = new Object[10];
        this.size = 0;
    }

    @Override
    public boolean add(E element) {
        if (this.size == this.elements.length) {
            // create a new array with double the size of the original array
            Object[] newElements = new Object[this.size * 2];
            // copy over the elements from the original array
            for (int i = 0; i < this.size; i++) {
                newElements[i] = this.elements[i];
            }
            this.elements = newElements;
        }
        this.elements[this.size] = element;
        this.size++;
        return true;
    }

    @Override
    public E get(int index) {
        if (index < 0 || index >= this.size) {
            throw new IndexOutOfBoundsException("Index: " + index + ", Size: " + this.size);
        }
        return (E) this.elements[index];
    }

    // Other methods of the List interface
}
