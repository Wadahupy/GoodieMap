import 'package:equatable/equatable.dart' show Equatable;
import 'package:hive/hive.dart';

part 'product_model.g.dart';

@HiveType(typeId: 0)
class Product extends Equatable {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String category;
  @HiveField(3)
  final String imgUrl;
  @HiveField(4)
  final double price;
  @HiveField(5)
  final String description;
  @HiveField(6)
  final double barcode;
  @HiveField(7)
  final String location;
  @HiveField(8)
  final bool isPopular;
  @HiveField(9)
  final bool isRecommended;

  const Product(
      {required this.id,
      required this.name,
      required this.category,
      required this.imgUrl,
      required this.price,
      required this.description,
      required this.barcode,
      required this.location,
      required this.isPopular,
      required this.isRecommended});

  @override
  List<Object?> get props => [
        id,
        name,
        category,
        imgUrl,
        price,
        description,
        barcode,
        location,
        isPopular,
        isRecommended
      ];

  static List<Product> products = [
    const Product(
      id: 1,
      name: 'Eden Singles 208g',
      category: 'Condiments Sauces & Dress',
      imgUrl: 'https://pgmobile.puregold.com.ph/images/7622210641311.jpg?v=25',
      price: 100.05,
      description: 'EDEN SINGLES 208G 10 X SLICES',
      barcode: 123456789,
      location:
          'https://firebasestorage.googleapis.com/v0/b/goodiemap.appspot.com/o/sections%2FSection%201.jpg?alt=media&token=198dbb2b-a709-4446-96ec-fac490c3ba77',
      isPopular: false,
      isRecommended: true,
    ),
    const Product(
      id: 2,
      name: 'Cheez Whiz Plain 210g',
      category: 'Condiments Sauces & Dress',
      imgUrl:
          'https://firebasestorage.googleapis.com/v0/b/goodiemap.appspot.com/o/products%2FCHEEZ%20WHIZ%20PLAIN%20210G.jpg?alt=media&token=02dd1aae-4ecf-4273-a446-35f43320db66',
      price: 81.00,
      description: 'CHEEZ WHIZ PLAIN ORIGINAL JAR 210G',
      barcode: 12345678910,
      location:
          'https://firebasestorage.googleapis.com/v0/b/goodiemap.appspot.com/o/sections%2FSection%201.jpg?alt=media&token=198dbb2b-a709-4446-96ec-fac490c3ba77',
      isPopular: true,
      isRecommended: false,
    ),
    const Product(
      id: 3,
      name: 'Eden filled cheese 160g',
      category: 'Condiments Sauces & Dress',
      imgUrl:
          'https://firebasestorage.googleapis.com/v0/b/goodiemap.appspot.com/o/products%2FEDEN%20FILLED%20CHEESE%20160G%20BUY%202%20PCS%20%2C%20SAVE%2013%25%20OFF.jpg?alt=media&token=37ff6b88-0efa-40de-90ad-0ca8e548f86d',
      price: 99.00,
      description: 'EDEN FILLED CHEESE 160G ORIGINAL',
      barcode: 12345678910,
      location:
          'https://firebasestorage.googleapis.com/v0/b/goodiemap.appspot.com/o/sections%2FSection%201.jpg?alt=media&token=198dbb2b-a709-4446-96ec-fac490c3ba77',
      isPopular: true,
      isRecommended: false,
    ),
    const Product(
      id: 4,
      name: 'Maggi Magic Sarap 8GX16S',
      category: 'Condiments Sauces & Dress',
      imgUrl:
          'https://firebasestorage.googleapis.com/v0/b/goodiemap.appspot.com/o/products%2FMAGGI%20MAGIC%20SARAP%208GX16S%20BUY%203%20GET%20FREE%201.jpg?alt=media&token=c1b68e4a-69c5-4a00-baed-e398935b9526',
      price: 193.95,
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
      barcode: 12345678910,
      location:
          'https://firebasestorage.googleapis.com/v0/b/goodiemap.appspot.com/o/sections%2FSection%201.jpg?alt=media&token=198dbb2b-a709-4446-96ec-fac490c3ba77',
      isPopular: false,
      isRecommended: true,
    ),
    const Product(
      id: 5,
      name: 'Knorr sinigang sampalok gabi mix',
      category: 'Condiments Sauces & Dress',
      imgUrl:
          'https://www.shoppersmart.com.ph/cdn/shop/products/Knorr_Sinigang_Mix_W_gabi_44g_1024x.jpg?v=1603363175',
      price: 14.85,
      description: 'KNORR SINIGANG SA SAMPALOK NA MAY GABI MIX 22G',
      barcode: 4808680652146,
      location:
          'https://firebasestorage.googleapis.com/v0/b/goodiemap.appspot.com/o/sections%2FSection%201.jpg?alt=media&token=198dbb2b-a709-4446-96ec-fac490c3ba77',
      isPopular: true,
      isRecommended: false,
    ),
    const Product(
      id: 6,
      name: 'Knorr sinigang miso mix',
      category: 'Condiments Sauces & Dress',
      imgUrl:
          'https://down-ph.img.susercontent.com/file/67ccaf550f6ca176d07654d514ebb2d4',
      price: 15.35,
      description: 'KNORR SINIGANG SA SAMPALOK NA MAY MISO MIX 23G',
      barcode: 4800888600219,
      location:
          'https://firebasestorage.googleapis.com/v0/b/goodiemap.appspot.com/o/sections%2FSection%201.jpg?alt=media&token=198dbb2b-a709-4446-96ec-fac490c3ba77',
      isPopular: false,
      isRecommended: false,
    ),
    const Product(
      id: 7,
      name: 'Knorr Pork Broth Cube',
      category: 'Condiments Sauces & Dress',
      imgUrl:
          'https://boholgrocery.com/wp-content/uploads/2020/09/Knorr-Cubes-Pork-Broth-10g-x-6pcs-Bundle.jpg',
      price: 33.85,
      description: 'KNORR PORK BROTH CUBES 60G (6 CUBES X10G)',
      barcode: 4800888601070,
      location:
          'https://firebasestorage.googleapis.com/v0/b/goodiemap.appspot.com/o/sections%2FSection%201.jpg?alt=media&token=198dbb2b-a709-4446-96ec-fac490c3ba77',
      isPopular: false,
      isRecommended: false,
    ),
    const Product(
      id: 8,
      name: 'Datu Puti Vinegar',
      category: 'Condiments Sauces & Dress',
      imgUrl:
          'https://shoppe24.ph/cdn/shop/products/21810_500x.jpg?v=1588928185',
      price: 18.25,
      description: 'DATU PUTI VINEGAR 385ML',
      barcode: 4801668500293,
      location:
          'https://firebasestorage.googleapis.com/v0/b/goodiemap.appspot.com/o/sections%2FSection%201.jpg?alt=media&token=198dbb2b-a709-4446-96ec-fac490c3ba77',
      isPopular: false,
      isRecommended: false,
    ),
    const Product(
      id: 9,
      name: 'Mama Sitas Oyster Sauce',
      category: 'Condiments Sauces & Dress',
      imgUrl:
          'https://d2t3trus7wwxyy.cloudfront.net/catalog/product/m/a/mama-sita-oyster-sauce-405g_1.jpg',
      price: 61.40,
      description: 'MAMA SIITA’S OYSTER SAUCE 156G',
      barcode: 4804888804233,
      location:
          'https://firebasestorage.googleapis.com/v0/b/goodiemap.appspot.com/o/sections%2FSection%201.jpg?alt=media&token=198dbb2b-a709-4446-96ec-fac490c3ba77',
      isPopular: false,
      isRecommended: true,
    ),
    const Product(
      id: 10,
      name: 'Jufran sweet chili',
      category: 'Condiments Sauces & Dress',
      imgUrl:
          'https://shopgaisano.com/cdn/shop/products/4801668300039_grande.jpg?v=1645497425',
      price: 52.30,
      description: 'JUFRAN SWEET CHILI SAUCE 330G',
      barcode: 4801668300039,
      location:
          'https://firebasestorage.googleapis.com/v0/b/goodiemap.appspot.com/o/sections%2FSection%201.jpg?alt=media&token=198dbb2b-a709-4446-96ec-fac490c3ba77',
      isPopular: true,
      isRecommended: false,
    ),
    const Product(
      id: 11,
      name: 'Mang Thomas Siga Hot spicy',
      category: 'Condiments Sauces & Dress',
      imgUrl:
          'https://d2t3trus7wwxyy.cloudfront.net/catalog/product/m/a/mang-tomas-lechon-sauce-siga-12oz_1.jpg',
      price: 61.40,
      description: 'MANG TOMAS SIGA HOT & SPICY 325G',
      barcode: 4801668100288,
      location:
          'https://firebasestorage.googleapis.com/v0/b/goodiemap.appspot.com/o/sections%2FSection%201.jpg?alt=media&token=198dbb2b-a709-4446-96ec-fac490c3ba77',
      isPopular: false,
      isRecommended: true,
    ),
    const Product(
      id: 12,
      name: 'ufc Hot&Spicy Banana ketchup',
      category: 'Condiments Sauces & Dress',
      imgUrl:
          'https://shopmetro.ph/banilad-supermarket/wp-content/uploads/2021/03/SM2069227-10.jpg',
      price: 61.40,
      description: 'UFC HOT & SPICY BANANA KETCHUP 320G',
      barcode: 014285000051,
      location:
          'https://firebasestorage.googleapis.com/v0/b/goodiemap.appspot.com/o/sections%2FSection%201.jpg?alt=media&token=198dbb2b-a709-4446-96ec-fac490c3ba77',
      isPopular: false,
      isRecommended: true,
    ),
    const Product(
      id: 13,
      name: 'Mega Sardines in Tomato',
      category: 'Drinks & Canned Goods',
      imgUrl:
          'https://www.megamart.ph/cdn/shop/products/051320-Order-Form-TSC_700x700.jpg?v=1651653710',
      price: 24.50,
      description:
          'MEGA SARDINES IN TOMATO SAUCE WITH CHILI EASY OPEN CAN 155G',
      barcode: 4806504710126,
      location:
          'https://firebasestorage.googleapis.com/v0/b/goodiemap.appspot.com/o/sections%2FSection%202.jpg?alt=media&token=8d8e502b-6f0b-45a7-adbe-c694805f6489',
      isPopular: true,
      isRecommended: false,
    ),
    const Product(
      id: 14,
      name: 'Blue Cool Cucumber Lime',
      category: 'Drinks & Canned Goods',
      imgUrl:
          'https://d2t3trus7wwxyy.cloudfront.net/catalog/product/1/0/10281021_blue_cucumber_lime_500ml.png',
      price: 35.75,
      description: 'Cucumber Lime 500ML',
      barcode: 4800016074417,
      location:
          'https://firebasestorage.googleapis.com/v0/b/goodiemap.appspot.com/o/sections%2FSection%202.jpg?alt=media&token=8d8e502b-6f0b-45a7-adbe-c694805f6489',
      isPopular: true,
      isRecommended: false,
    ),
    const Product(
      id: 15,
      name: 'Wet Water',
      category: 'Drinks & Canned Goods',
      imgUrl:
          'https://shopsuki.ph/cdn/shop/products/Untitleddesign-2021-02-23T172515.003_800x.png?v=1690880185',
      price: 6.50,
      description: 'Wet Drinking Water 330 ml',
      barcode: 4800049720183,
      location:
          'https://firebasestorage.googleapis.com/v0/b/goodiemap.appspot.com/o/sections%2FSection%202.jpg?alt=media&token=8d8e502b-6f0b-45a7-adbe-c694805f6489',
      isPopular: false,
      isRecommended: false,
    ),
    const Product(
      id: 16,
      name: 'Vita Coco Coconut Water',
      category: 'Drinks & Canned Goods',
      imgUrl:
          'https://sdcglobalchoice.com/wp-content/uploads/2021/07/9769-0w600h600_Vita_Coco_100_Pure_Coconut_Water_1_litre.jpg',
      price: 44.75,
      description: 'Vita Coco Coconut Water The original 330ML',
      barcode: 0898999000022,
      location:
          'https://firebasestorage.googleapis.com/v0/b/goodiemap.appspot.com/o/sections%2FSection%202.jpg?alt=media&token=8d8e502b-6f0b-45a7-adbe-c694805f6489',
      isPopular: false,
      isRecommended: false,
    ),
    const Product(
      id: 17,
      name: 'Sunkist Apple',
      category: 'Beverages & Treats',
      imgUrl:
          'https://media.pickaroo.com/media/thumb/variant_photos/2021/8/1/AgSmB7oaafVhjEBXQchrvd_watermark_400.jpg',
      price: 9.45,
      description: 'SUNKIST QCP APPLE 185ML',
      barcode: 4800110080475,
      location:
          'https://firebasestorage.googleapis.com/v0/b/goodiemap.appspot.com/o/sections%2FSection%203.jpg?alt=media&token=6a238428-3018-4cef-a205-6324377816e6',
      isPopular: false,
      isRecommended: false,
    ),
    const Product(
      id: 17,
      name: 'Koolers Grapes',
      category: 'Beverages & Treats',
      imgUrl:
          'https://marilenminimart.com/cdn/shop/products/Screenshot_26.png?v=1621499544',
      price: 35.40,
      description: 'KOOLERS FUN DRINK GRAPES 220ML',
      barcode: 4809014280653,
      location:
          'https://firebasestorage.googleapis.com/v0/b/goodiemap.appspot.com/o/sections%2FSection%203.jpg?alt=media&token=6a238428-3018-4cef-a205-6324377816e6',
      isPopular: false,
      isRecommended: false,
    ),
    const Product(
      id: 18,
      name: 'Tipco Kiwi Juice',
      category: 'Beverages & Treats',
      imgUrl:
          'https://images.freshop.com/1564405684711651941/2f8c70f6ad9a69fbcc0589b7ce1ee58b_large.png',
      price: 140.80,
      description: 'TIPCO KIWI AND GRAPE JUICE 1LL',
      barcode: 8851013775490,
      location:
          'https://firebasestorage.googleapis.com/v0/b/goodiemap.appspot.com/o/sections%2FSection%203.jpg?alt=media&token=6a238428-3018-4cef-a205-6324377816e6',
      isPopular: false,
      isRecommended: false,
    ),
    const Product(
      id: 19,
      name: 'Ferrero collections T15',
      category: 'Biscuits & Sweets',
      imgUrl:
          'https://images.freshop.com/1564405684711651941/2f8c70f6ad9a69fbcc0589b7ce1ee58b_large.png',
      price: 482.00,
      description: 'FERRERO COLLECTION T15 CHOCOLATE SNACK 162G',
      barcode: 8000500227671,
      location:
          'https://firebasestorage.googleapis.com/v0/b/goodiemap.appspot.com/o/sections%2FSection%204.jpg?alt=media&token=9772d44e-b85a-4e62-80eb-1c6b9538f362',
      isPopular: false,
      isRecommended: false,
    ),
    const Product(
      id: 20,
      name: 'Hersheys kisses classic',
      category: 'Biscuits & Sweets',
      imgUrl:
          'https://images.freshop.com/1564405684702555916/29d079e17faf244399abf108615b2f06_large.png',
      price: 58.00,
      description: 'HERSHEYS KISSES CLASSIC MILK CHOCOLATE 36G',
      barcode: 6942836704117,
      location:
          'https://firebasestorage.googleapis.com/v0/b/goodiemap.appspot.com/o/sections%2FSection%204.jpg?alt=media&token=9772d44e-b85a-4e62-80eb-1c6b9538f362',
      isPopular: false,
      isRecommended: false,
    ),
    const Product(
      id: 21,
      name: 'XO choco shake candy',
      category: 'Biscuits & Sweets',
      imgUrl:
          'https://d2t3trus7wwxyy.cloudfront.net/catalog/product/cache/d166c7ea81ddc4172de536322110c911/x/o/xo-choco-shake-candy-35g_2.jpg',
      price: 41.90,
      description: 'JNJ XO CHOCO SHAKE CANDY 50S',
      barcode: 4800016476099,
      location:
          'https://firebasestorage.googleapis.com/v0/b/goodiemap.appspot.com/o/sections%2FSection%204.jpg?alt=media&token=9772d44e-b85a-4e62-80eb-1c6b9538f362',
      isPopular: false,
      isRecommended: false,
    ),
    const Product(
      id: 22,
      name: 'Assorted Marshmallows',
      category: 'Biscuits & Sweets',
      imgUrl:
          'https://shopsuki.ph/cdn/shop/products/4800519187065_800x.jpg?v=1670547245',
      price: 62.95,
      description: 'PURE BASICS ASSRT MALLOWS 250G',
      barcode: 4800029017494,
      location:
          'https://firebasestorage.googleapis.com/v0/b/goodiemap.appspot.com/o/sections%2FSection%204.jpg?alt=media&token=9772d44e-b85a-4e62-80eb-1c6b9538f362',
      isPopular: false,
      isRecommended: false,
    ),
    const Product(
      id: 23,
      name: 'Nivea Men Acne oil Clear',
      category: 'Babycare & Beauty',
      imgUrl:
          'https://www.snrshopping.com/upload/product/Nivea%20Men%20Facial%20Anti%20Acne%20Oil%20Clear%20Foam%20100g-9/Nivea%20Men%20Facial%20Anti%20Acne%20Oil%20Clear%20Foam%20100g-jGuivRESVh.jpg',
      price: 268.00,
      description: 'Nivea Men Acne oil Clear 100g',
      barcode: 4005808845330,
      location:
          'https://firebasestorage.googleapis.com/v0/b/goodiemap.appspot.com/o/sections%2FSection%205.jpg?alt=media&token=81c61f2f-8be7-4966-bcaa-bb5055ca6f0b',
      isPopular: false,
      isRecommended: false,
    ),
    const Product(
      id: 24,
      name: 'Cetaphil Baby Gentle',
      category: 'Bath & Hygiene',
      imgUrl:
          'https://babycompany.ph/cdn/shop/products/Cetaphil---_BABY_-Gentle-Wash-_-Shampoo-Pump.jpg?v=1671420972',
      price: 523,
      description: 'Cetaphil Baby Gentle Wash & Shampoo 400mL',
      barcode: 9318637044009,
      location:
          'https://firebasestorage.googleapis.com/v0/b/goodiemap.appspot.com/o/sections%2FSection%206.jpg?alt=media&token=ad6cf2b5-c003-4466-9286-2d986a7272d2',
      isPopular: false,
      isRecommended: false,
    ),
    const Product(
      id: 25,
      name: 'Sunsilk Green shampoo',
      category: 'Bath & Hygiene',
      imgUrl:
          'https://lalascosmetics.eu/cdn/shop/products/GREEN_75d4cca2-9898-411f-bbd0-d1719794820e_1200x1200.jpg?v=1640723138',
      price: 523,
      description: 'Sunsilk Green shampoo 15 ML',
      barcode: 4800888169709,
      location:
          'https://firebasestorage.googleapis.com/v0/b/goodiemap.appspot.com/o/sections%2FSection%206.jpg?alt=media&token=ad6cf2b5-c003-4466-9286-2d986a7272d2',
      isPopular: false,
      isRecommended: false,
    ),
    const Product(
      id: 26,
      name: 'Oishi in Water Orange',
      category: 'Drinks & Canned Goods',
      imgUrl:
          'https://d2j6dbq0eux0bg.cloudfront.net/images/17197054/3579603248.jpg',
      price: 21.85,
      description: 'OISHI IN WATER ORANGE',
      barcode: 4800194112796,
      location:
          'https://firebasestorage.googleapis.com/v0/b/goodiemap.appspot.com/o/sections%2FSection%202.jpg?alt=media&token=8d8e502b-6f0b-45a7-adbe-c694805f6489',
      isPopular: false,
      isRecommended: false,
    ),
  ];
}
