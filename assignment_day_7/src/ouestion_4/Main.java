package ouestion_4;

class Node {
    int data;
    Node left, right;
    Node(int d) {
        data = d;
        left = null;
        right = null;
    }
}
class BinaryTree {
    Node root;
    void preOrder(Node node) {
        if (node == null) {
            return;
        }
        System.out.print(node.data + " ");
        preOrder(node.left);
        preOrder(node.right);
    }
    void preOrderTraversal() {
        preOrder(root);
    }
}
public class Main {
    public static void main(String[] args) {
        BinaryTree tree = new BinaryTree();
        tree.root = new Node(1);
        tree.root.right = new Node(2);
        tree.root.right.right = new Node(5);
        tree.root.right.right.left = new Node(3);
        tree.root.right.right.right = new Node(6);
        tree.root.right.right.left.right = new Node(4);
        tree.preOrderTraversal();
    }
}
