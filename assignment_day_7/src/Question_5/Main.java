package Question_5;
class Node {
    int data;
    Node next;
    Node(int data) {
        this.data = data;
        this.next = null;
    }
}


class LinkedList {
    Node head;
    public void reverse() {
        Node prev = null;
        Node current = head;
        Node next = null;

        while (current != null) {
            next = current.next;
            current.next = prev;
            prev = current;
            current = next;
        }
        head = prev;
    }
    public void printList() {
        Node current = head;
        while (current != null) {
            System.out.print(current.data + " ");
            current = current.next;
        }
        System.out.println();
    }
}
public class Main {
    public static void main(String[] args) {
        LinkedList list = new LinkedList();
        int[] values = {1, 2, 3, 4, 5};
        for (int value : values) {
            list.insertAtTail(value);
        }
        System.out.println("Original list:");
        list.printList();
        list.reverse();
        System.out.println("Reversed list:");
        list.printList();
    }
}
