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
      imgUrl: 'https://firebasestorage.googleapis.com/v0/b/goodiemap.appspot.com/o/products%2FEDEN%20SINGLESS.jpg?alt=media&token=55fa1faf-f987-4d1d-86fd-0c84b08a5427',
      price: 100.05,
      description: 'EDEN SINGLES 208G 10 X SLICES',
      barcode: 7622210892126,
      location:
          'https://firebasestorage.googleapis.com/v0/b/goodiemap.appspot.com/o/sections%2FSection%201.jpg?alt=media&token=198dbb2b-a709-4446-96ec-fac490c3ba77',
      isPopular: false,
      isRecommended: true,
    ),
    const Product(
      id: 2,
      name: 'Cheez Whiz Plain 210g',
      category: 'Condiments Sauces & Dress',
      imgUrl: 'https://firebasestorage.googleapis.com/v0/b/goodiemap.appspot.com/o/products%2FCHEEZ%20WHIZ%20PLAIN%20210G.jpg?alt=media&token=02dd1aae-4ecf-4273-a446-35f43320db66',
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
      imgUrl: 'https://firebasestorage.googleapis.com/v0/b/goodiemap.appspot.com/o/products%2FEDEN%20FILLED%20CHEESE%20160G%20BUY%202%20PCS%20%2C%20SAVE%2013%25%20OFF.jpg?alt=media&token=37ff6b88-0efa-40de-90ad-0ca8e548f86d',
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
      description: 'MAGGI MAGIC SARAP 8G AND 16S',
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
          'https://firebasestorage.googleapis.com/v0/b/goodiemap.appspot.com/o/products%2FKnorr_Sinigang_Mix_W_gabi_44g_1024x.webp?alt=media&token=ab56a9c9-fa0b-49ff-9a2d-cfa5b94a0051',
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
          'https://firebasestorage.googleapis.com/v0/b/goodiemap.appspot.com/o/products%2Fknor%20miso.jpg?alt=media&token=b8b76878-ce8c-4767-89f8-1631cb07ac14',
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
          'https://firebasestorage.googleapis.com/v0/b/goodiemap.appspot.com/o/products%2FKnorr-Cubes-Pork-Broth-10g-x-6pcs-Bundle.jpg?alt=media&token=aa8eb615-c082-4615-ae6c-910b6b970000',
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
          'https://firebasestorage.googleapis.com/v0/b/goodiemap.appspot.com/o/products%2Fdatu-puti.webp?alt=media&token=d2087b98-3f20-41a2-85f3-73f3ffb29309',
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
          'https://firebasestorage.googleapis.com/v0/b/goodiemap.appspot.com/o/products%2Fmama-sita-oyster-sauce-405g_1.jpg?alt=media&token=099f4e9c-7d4f-4bbb-a435-86e6138b65aa',
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
          'https://firebasestorage.googleapis.com/v0/b/goodiemap.appspot.com/o/products%2Fjufran.webp?alt=media&token=8fe13eed-5782-41a1-8164-af0a746f5e59',
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
          'https://firebasestorage.googleapis.com/v0/b/goodiemap.appspot.com/o/products%2Fmang-tomas-lechon-sauce-siga-12oz_1.jpg?alt=media&token=450f793b-f54c-4fbe-ab26-bcbc676f710c',
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
      name: 'Ufc Hot&Spicy Banana ketchup',
      category: 'Condiments Sauces & Dress',
      imgUrl:
          'https://firebasestorage.googleapis.com/v0/b/goodiemap.appspot.com/o/products%2FSM2069227-10.jpg?alt=media&token=5435b6cd-eaae-4cee-bf93-0c26e50a2d27',
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
          'https://firebasestorage.googleapis.com/v0/b/goodiemap.appspot.com/o/products%2F051320-Order-Form-TSC_700x700.webp?alt=media&token=1723ba22-5722-4222-b0f9-239bf1648aa5',
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
          'https://firebasestorage.googleapis.com/v0/b/goodiemap.appspot.com/o/products%2F10281021_blue_cucumber_lime_500ml.png?alt=media&token=d1257bbd-ed2d-4b1d-9faf-11623f1b6d4c',
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
          'https://firebasestorage.googleapis.com/v0/b/goodiemap.appspot.com/o/products%2Fwet%20water.webp?alt=media&token=6c57bda5-08b6-4006-aa6d-b25a4340e2c3',
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
          'https://firebasestorage.googleapis.com/v0/b/goodiemap.appspot.com/o/products%2Fvita%20coco.jpg?alt=media&token=94040d00-dec8-4efb-af9f-fcc2e81e2e98',
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
          'https://firebasestorage.googleapis.com/v0/b/goodiemap.appspot.com/o/products%2Fsunkist.jpg?alt=media&token=5d40298d-e668-4dbf-bf18-fb699acd3333',
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
          'https://firebasestorage.googleapis.com/v0/b/goodiemap.appspot.com/o/products%2Fkoolers.webp?alt=media&token=775b7da8-cb5b-4677-8753-820d020d1296',
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
          'https://firebasestorage.googleapis.com/v0/b/goodiemap.appspot.com/o/products%2Fkiwi%20juice.png?alt=media&token=3e49b1c5-6bb8-462f-835e-a8b4631c673c',
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
          'https://firebasestorage.googleapis.com/v0/b/goodiemap.appspot.com/o/products%2Fferero.png?alt=media&token=bc3e62c0-b2db-4d85-a534-8206a8745b21',
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
          'https://firebasestorage.googleapis.com/v0/b/goodiemap.appspot.com/o/products%2Fkisses.png?alt=media&token=7186d5c6-4c90-408e-91f6-751d9643a7c6',
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
          'https://firebasestorage.googleapis.com/v0/b/goodiemap.appspot.com/o/products%2Fx.o%20coffee.jpg?alt=media&token=8cec2f8d-597b-46ec-8ba2-b40ddce3d251',
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
          'https://firebasestorage.googleapis.com/v0/b/goodiemap.appspot.com/o/products%2Fmarchmallows.webp?alt=media&token=9334f00e-6a66-4e49-a577-d521533b9078',
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
          'https://firebasestorage.googleapis.com/v0/b/goodiemap.appspot.com/o/products%2Facne%20clear%20nvia.jpg?alt=media&token=2e108afa-377a-4aa3-86b6-0d877f0d21b5',
      price: 268.00,
      description: 'NIVEA MEN ACNE OIL CLEAR 100G',
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
          'https://firebasestorage.googleapis.com/v0/b/goodiemap.appspot.com/o/products%2Fcetaphil.webp?alt=media&token=7875eb4b-53b1-4b72-8216-9ecdb34e399b',
      price: 523,
      description: 'CETAPHIL GENTE WASH AND SHAMPOO 400ML',
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
          'https://firebasestorage.googleapis.com/v0/b/goodiemap.appspot.com/o/products%2Fsunsilk.webp?alt=media&token=1bd1202a-1e29-4b6d-ae8c-02330855fc8f',
      price: 523,
      description: 'SUNSILK GREEN SHAMPOO 15 ML',
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
          'https://firebasestorage.googleapis.com/v0/b/goodiemap.appspot.com/o/products%2Finwater%20oishi.jpg?alt=media&token=9fb78ee7-6ede-4423-be36-594767b134e8',
      price: 21.85,
      description: 'OISHI IN WATER ORANGE',
      barcode: 4800194112796,
      location:
          'https://firebasestorage.googleapis.com/v0/b/goodiemap.appspot.com/o/sections%2FSection%202.jpg?alt=media&token=8d8e502b-6f0b-45a7-adbe-c694805f6489',
      isPopular: false,
      isRecommended: false,
    ),
    const Product(
      id: 27,
      name: 'High Endurance 14G',
      category: 'Babycare & Beauty',
      imgUrl:
          'https://firebasestorage.googleapis.com/v0/b/goodiemap.appspot.com/o/products%2Fhigh%20endurance.jpg?alt=media&token=e11c6895-205d-4bc9-bf0e-43f95c14cf41',
      price: 104.00,
      description:
          'OLD SPICE HIGH ENDURANCE ANTI PERSPIRANT/DEODORANT CREAM FRESH 14G',
      barcode: 020800306348,
      location:
          'https://firebasestorage.googleapis.com/v0/b/goodiemap.appspot.com/o/sections%2FSection%205.jpg?alt=media&token=81c61f2f-8be7-4966-bcaa-bb5055ca6f0b',
      isPopular: false,
      isRecommended: false,
    ),
    const Product(
      id: 28,
      name: 'Milo Energy Drink 24G',
      category: 'Drinks & Canned Goods',
      imgUrl:
          'https://firebasestorage.googleapis.com/v0/b/goodiemap.appspot.com/o/products%2Fmilo.webp?alt=media&token=94b063f6-6673-44ed-99ed-e8632d7187ea',
      price: 10.00,
      description: 'MILO POWDER ENERGY DRINK SACHET 24G',
      barcode: 4800361413480,
      location:
          'https://firebasestorage.googleapis.com/v0/b/goodiemap.appspot.com/o/sections%2FSection%202.jpg?alt=media&token=8d8e502b-6f0b-45a7-adbe-c694805f6489',
      isPopular: true,
      isRecommended: false,
    ),
    const Product(
      id: 29,
      name: 'Pimple Eraser Cleansing Soap 90G',
      category: 'Babycare & Beauty',
      imgUrl:
          'https://firebasestorage.googleapis.com/v0/b/goodiemap.appspot.com/o/products%2Fpimple%20heartrate.jpg?alt=media&token=38254953-ca4f-484c-8e9c-8436656a6652',
      price: 104.00,
      description: 'QUICK FX PIMPLE ERASER CLEASING BAR SOAP 90G',
      barcode: 4806530451086,
      location:
          'https://firebasestorage.googleapis.com/v0/b/goodiemap.appspot.com/o/sections%2FSection%205.jpg?alt=media&token=81c61f2f-8be7-4966-bcaa-bb5055ca6f0b',
      isPopular: false,
      isRecommended: false,
    ),
    const Product(
      id: 30,
      name: 'Cleene Gel Hand Sanitizer 60ml',
      category: 'Bath & Hygiene',
      imgUrl:
          'https://firebasestorage.googleapis.com/v0/b/goodiemap.appspot.com/o/products%2Fclenee%20alcohol.webp?alt=media&token=0174894d-4651-44f6-bf7a-67feecfdbf78',
      price: 523,
      description: 'CLEENE ALCOHOL GEL HAND SANITIZER 60ML',
      barcode: 4800067126967,
      location:
          'https://firebasestorage.googleapis.com/v0/b/goodiemap.appspot.com/o/sections%2FSection%206.jpg?alt=media&token=ad6cf2b5-c003-4466-9286-2d986a7272d2',
      isPopular: false,
      isRecommended: false,
    ),
  ];
}
