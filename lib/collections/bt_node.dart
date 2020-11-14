class BT_Node {
  dynamic value;
  BT_Node leftChild;
  BT_Node rightChild;
  BT_Node parent;
  int height;

  BT_Node(dynamic val,
      {BT_Node left = null,
      BT_Node right = null,
      BT_Node par = null,
      int h = 1}) {
    value = val;
    leftChild = left;
    rightChild = right;
    parent = par;
    height = h;
  }
}
