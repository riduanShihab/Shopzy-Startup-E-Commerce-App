import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductProvider with ChangeNotifier {
  final List<Product> _products = [
    Product(
      id: 'p1',
      title: 'Neon Cyber Hoodie',
      description:
          'Hand-stitched heavy cotton with reflective violet piping. The ultimate piece for the digital generation.',
      price: 129.00,
      imageUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuD0NQH1dhKmdVr5FnSrco8JsIJ2uviabMdKBK8JWSlEYTcrO1BBOTFRVgBpjd9GRAVdSJ9yMKnQn_6fpvhk8pzUNmGnXEU9U7o5oMKU39aXWu_9XD2FHfEO_YK9u4AAc93zxI-drntKAFr7cpndbF3opyLReJ3rzLa5MMCsR1pXpzmgSoVEJE6pZNSlfZjg-b85q9Zn48pArGSnzzLZn-koblZQ3hydV2kkXspLC59iCbqRy3ARy2tmGZfqZ2cWsEKWcbyu1LTs5yI',
      tags: ['New In', 'Limited Drop'],
      likes: '2.4k',
      comments: '128',
    ),
    Product(
      id: 'p2',
      title: 'Holo-Graphic Tee',
      description:
          'Organic bamboo fabric with light-reactive heat press graphics. Breathable, durable, and future-proof.',
      price: 55.00,
      imageUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuDjinFz9jgGwKYxDUJf2bOWrRtWjjeW_kkY8802sTdMr_m3J0ab_hTVYHrrHChncwmC23LUKl38lQmFF9-jtIYN0HsKCJ2i3WEKx6o20w0ttsRTiH52vQq3QUynEx6z-YW1zMsrPvQPn7Q2Ir0GdaM2Yu6Lj4TxUCSEJN71Ct7af_ys0SOyL-SrXmdHEgyE_LdBMU50oO6YnMrBPz0KbA0kX0RxkGa8mSDZEzr1S9hm-DYOcFsvQ1Ze78J6xtRS5p4FwXe_EB6aK5w',
      tags: ['Eco-Conscious'],
      likes: '1.8k',
      comments: '42',
    ),
    Product(
      id: 'p3',
      title: 'Noir Wool Overcoat',
      description:
          'The weight of this wool is incredible. Feels much more expensive than the price point suggests. Perfect fit.',
      price: 495.00,
      imageUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuBICmDNnuHWZ7mh7sFprs-vFkrIF-j5CPG0nT3Pp6zspct02OMVw7yxfOLivNIviLlFMns78skPBxu_EDy-Tg3ulORddz_j9KOvMMQ4JT_1He5GItKQ1-qVwYYAVBxBbiebEdNXfC9_Kn79b-nWUcdlMYuSmHfZLG2rSVhC0DXEFTgWuP7IHblp8zKuF8w6VRmgdz_kQD2kmF15FY8QsIEXLG0r9B1DImGtcV-c0WovgALUe4Z1wOZeIjnx30V9k8Mm6073rY3YzXY',
      tags: ['Classic', 'Winter'],
      likes: '5.1k',
      comments: '341',
    ),
  ];

  List<Product> get products => [..._products];

  Product findById(String id) {
    return _products.firstWhere((prod) => prod.id == id);
  }
}
