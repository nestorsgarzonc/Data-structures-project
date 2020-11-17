class AVLNode {
  dynamic value;
  AVLNode leftSon;
  AVLNode rightSon;
  int height;

  AVLNode(dynamic v) {
    this.value = v;
    this.height = 0;
  }

  int compareTo(AVLNode n) {
    if (value < n.value)
      return 1;
    else if (value > n.value)
      return -1;
    else
      return 0;
  }
}
