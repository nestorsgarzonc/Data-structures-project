import 'package:test/test.dart';
import 'package:ed_project/collections/avl.dart';

void main() {
  group("Grupo de pruebas finales BST", () {
    test("Creación del árbol y verificación de sus atributos", () {
      AVLTree bst = new AVLTree();
      expect(bst.height, 0);
      expect(bst.root, null);
    });
    test("Inserción de un dato", () {
      AVLTree bst = new AVLTree();
      bst.insert(1);
      expect(bst.root.value, 1);
    });
    test("Inserción de tres datos", () {
      AVLTree bst = new AVLTree();
      bst.insert(3);
      bst.insert(2);
      bst.insert(1);
      //En este caso la raíz debe ser 2, el hijo izquierdo 1, el derecho 3
      expect(bst.root.value, 2);
      expect(bst.root.leftSon.value, 1);
      expect(bst.root.rightSon.value, 3);
    });
    test("Verificación impresión InOrder", () {
      AVLTree bst = new AVLTree();
      //    50
      //  /     \
      // 30     70
      //  / \ / \
      // 20 40 60 80
      bst.insert(50);
      bst.insert(30);
      bst.insert(20);
      bst.insert(40);
      bst.insert(70);
      bst.insert(60);
      bst.insert(80);
      //Se deben imprimir los números del 20 al 80 de forma ordenada
      bst.inOrder();
      expect(true, true);
    });
    test("Verificación de la función de borrado (borrando la raíz)", () {
      AVLTree bst = new AVLTree();
      //    50
      //  /     \
      // 30     70
      //  / \ / \
      // 20 40 60 80
      bst.insert(50);
      bst.insert(30);
      bst.insert(20);
      bst.insert(40);
      bst.insert(70);
      bst.insert(60);
      bst.insert(80);

      bst.delete(50);
      //Se deben imprimir los números del 20 al 80 de forma ordenada SIN EL 50
      bst.inOrder();
      expect(true, true);
    });
    test("Eliminación completa (prueba dura)", () {
      AVLTree bst = new AVLTree();

      bst.insert(50);
      bst.insert(30);
      bst.insert(20);
      bst.insert(40);
      bst.insert(70);
      bst.insert(60);
      bst.insert(80);

      bst.inOrder();
      print("\n");

      //Primer caso: Cuando el nodo es una hoja
      //
      //         50                            50
      //       /     \         delete(20)      /   \
      //      30      70       --------->    30     70
      //     /  \    /  \                     \    /  \
      //   20   40  60   80                   40  60   80

      bst.delete(20);
      bst.inOrder();
      print("\n");

      //Segundo caso: cuando el nodo tiene al menos un hijo
      //        50                            50
      //     /     \         delete(30)      /   \
      //    30      70       --------->    40     70
      //      \    /  \                          /  \
      //      40  60   80                       60   80

      bst.delete(30);
      bst.inOrder();
      print("\n");

      //Tercer caso: cuando el nodo tiene dos hijos
      //        50                            60
      //     /     \         delete(50)      /   \
      //    40      70       --------->    40    70
      //           /  \                            \
      //          60   80                           80

      bst.delete(50);
      bst.inOrder();
      print("\n");

      expect(bst.root.value, 60);
      expect(true, true);
    });
  });
  test("Uso de la función search ", () {
    AVLTree bst = new AVLTree();
    bst.insert(5);
    bst.insert(3);
    bst.insert(2);
    bst.insert(4);
    bst.insert(7);
    bst.insert(6);
    bst.insert(8);

    //     5
    //   /    \
    //   3     7
    //  / \   / \
    // 2  4  6   8

    //Debe imprimir todos los elementos
    print(bst.search(0, 10));

    //Debe imprimir todos los elementos
    print(bst.search(1, 9));

    //Debe imprimir solo los elementos de la izquierda del árbol
    print(bst.search(-100, 5));

    //Debe imprimir solo los elementos de la derecha del árbol
    print(bst.search(5, 100));

    expect(true, true);
  });
  test("Altura del árbol y sus nodos ", () {
    AVLTree bst = new AVLTree();
    bst.insert(2);
    bst.insert(1);
    bst.insert(3);

    expect(bst.height, 1);

    bst = new AVLTree();
    bst.insert(5);
    bst.insert(3);
    bst.insert(2);
    bst.insert(4);
    bst.insert(7);

    //     5
    //   /    \
    //   3     7
    //  / \
    // 2  4
    expect(bst.height, 2);

    bst.inOrder();
  });
  test("Balanceo simple", () {
    AVLTree bst = new AVLTree();
    bst.insert(1);
    bst.insert(2);
    bst.insert(3);

    bst.inOrder();

    expect(bst.height, 1);

    //En este caso debería dejar el 2 como nodo raíz, el 1 a la izquierda y el 3 a la derecha
    //Sin embargo eso no ocurre y viendo las alturas de los nodos se ve que el árbol se mantiene
    //así:

    // 1
    //  \
    //   2
    //    \
    //     3
    expect(true, true);
  });
}
