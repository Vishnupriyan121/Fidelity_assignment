package ouestion_2;
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


    public void insertAtHead(int data) {

        Node newNode = new Node(data);


        newNode.next = head;


        head = newNode;
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


public class Deletion {
    public static void main(String[] args) {
        LinkedList list = new LinkedList();


        int[] values = {383, 484, 392, 975, 321};


        for (int value : values) {
            list.insertAtHead(value);
        }


        list.printList();
    }
}
