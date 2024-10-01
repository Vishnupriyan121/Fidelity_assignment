package Question_1;
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


    public void insertAtTail(int data) {

        Node newNode = new Node(data);


        if (head == null) {
            head = newNode;
        } else {

            Node current = head;
            while (current.next != null) {
                current = current.next;
            }

            current.next = newNode;
        }
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


        int[] values = {141, 302, 164, 530, 474};


        for (int value : values) {
            list.insertAtTail(value);
        }


        list.printList();
    }
}

