import 'dart:io';

class Product {
  String name;
  int price;

  Product(this.name, this.price);
}

class ShoppingMall {
  List<Product> products = [
    Product("셔츠", 45000),
    Product("원피스", 30000),
    Product("반팔티", 35000),
    Product("반바지", 38000),
    Product("양말", 5000)
  ];
  int totalPrice = 0;

  void showProducts() {
    print("\n판매 상품 목록:");
    for (var product in products) {
      print("${product.name} / ${product.price}원");
    }
  }

  void addToCart() {
    print("\n장바구니에 담을 상품의 이름을 입력하세요:");
    String? productName = stdin.readLineSync();
    
    Product? selectedProduct = products.firstWhere(
      (p) => p.name == productName,
      orElse: () => Product("", 0),
    );
    
    if (selectedProduct.name.isEmpty) {
      print("입력값이 올바르지 않아요 !");
      return;
    }
    
    print("장바구니에 담을 상품의 개수를 입력하세요:");
    String? quantityInput = stdin.readLineSync();
    int quantity;
    
    try {
      quantity = int.parse(quantityInput!);
      if (quantity <= 0) {
        print("0개보다 많은 개수의 상품만 담을 수 있어요 !");
        return;
      }
    } catch (e) {
      print("입력값이 올바르지 않아요 !");
      return;
    }
    
    totalPrice += selectedProduct.price * quantity;
    print("장바구니에 상품이 담겼어요 !");
  }

  void showTotal() {
    print("\n장바구니에 ${totalPrice}원 어치를 담으셨네요 !");
  }
}

void main() {
  ShoppingMall mall = ShoppingMall();
  bool running = true;

  while (running) {
    print("\n1: 상품 목록 보기 / 2: 장바구니에 상품 담기 / 3: 장바구니 총 가격 확인 / 4: 쇼핑몰 종료");
    print("선택: ");

    String? choice = stdin.readLineSync();

    switch (choice) {
      case "1":
        mall.showProducts();
        break;
      case "2":
        mall.addToCart();
        break;
      case "3":
        mall.showTotal();
        break;
      case "4":
        print("이용해 주셔서 감사합니다 ~ 안녕히 가세요 !");
        running = false;
        break;
      default:
        print("지원하지 않는 기능입니다 ! 다시 시도해 주세요 ..");
    }
  }
}
