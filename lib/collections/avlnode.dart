class AVLNode {
  dynamic value;
  AVLNode leftSon;
  AVLNode rightSon;
  int height;

  AVLNode(dynamic value) {
    this.value = value;
    height = 0;
  }

  int compareTo(AVLNode n) {
    if (n == null) {
      return -1;
    } else {
      if (value < n.value) {
        return 1;
      } else if (value > n.value) {
        return -1;
      } else {
        return 0;
      }
    }
  }
}
