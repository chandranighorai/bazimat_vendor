class DeliveredModel {
  int state;
  String message;
  List<RespData> respData;

  DeliveredModel({this.state, this.message, this.respData});

  DeliveredModel.fromJson(Map<String, dynamic> json) {
    state = json['state'];
    message = json['message'];
    if (json['respData'] != null) {
      respData = <RespData>[];
      json['respData'].forEach((v) {
        respData.add(new RespData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['state'] = this.state;
    data['message'] = this.message;
    if (this.respData != null) {
      data['respData'] = this.respData.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RespData {
  int id;
  int userId;
  int foodId;
  int quantity;
  int orderAmount;
  int couponDiscountAmount;
  String couponDiscountTitle;
  String paymentStatus;
  String orderStatus;
  int totalTaxAmount;
  String paymentMethod;
  String transactionReference;
  String deliveryManId;
  String couponCode;
  String orderNote;
  String orderType;
  int checked;
  int restaurantId;
  String createdAt;
  String updatedAt;
  int deliveryCharge;
  String scheduleAt;
  String callback;
  String otp;
  String pending;
  String accepted;
  String confirmed;
  String processing;
  String handover;
  String pickedUp;
  String delivered;
  String canceled;
  String refundRequested;
  String refunded;
  String transactionId;
  String deliveryAddress;
  int scheduled;
  int restaurantDiscountAmount;
  String originalDeliveryCharge;
  String failed;
  String adjusment;
  int edited;
  List<CartDetails> cartDetails;
  String deliveryBoyName;

  RespData(
      {this.id,
      this.userId,
      this.foodId,
      this.quantity,
      this.orderAmount,
      this.couponDiscountAmount,
      this.couponDiscountTitle,
      this.paymentStatus,
      this.orderStatus,
      this.totalTaxAmount,
      this.paymentMethod,
      this.transactionReference,
      this.deliveryManId,
      this.couponCode,
      this.orderNote,
      this.orderType,
      this.checked,
      this.restaurantId,
      this.createdAt,
      this.updatedAt,
      this.deliveryCharge,
      this.scheduleAt,
      this.callback,
      this.otp,
      this.pending,
      this.accepted,
      this.confirmed,
      this.processing,
      this.handover,
      this.pickedUp,
      this.delivered,
      this.canceled,
      this.refundRequested,
      this.refunded,
      this.transactionId,
      this.deliveryAddress,
      this.scheduled,
      this.restaurantDiscountAmount,
      this.originalDeliveryCharge,
      this.failed,
      this.adjusment,
      this.edited,
      this.cartDetails,
      this.deliveryBoyName});

  RespData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    foodId = json['food_id'];
    quantity = json['quantity'];
    orderAmount = json['order_amount'];
    couponDiscountAmount = json['coupon_discount_amount'];
    couponDiscountTitle = json['coupon_discount_title'];
    paymentStatus = json['payment_status'];
    orderStatus = json['order_status'];
    totalTaxAmount = json['total_tax_amount'];
    paymentMethod = json['payment_method'];
    transactionReference = json['transaction_reference'];
    deliveryManId = json['delivery_man_id'];
    couponCode = json['coupon_code'];
    orderNote = json['order_note'];
    orderType = json['order_type'];
    checked = json['checked'];
    restaurantId = json['restaurant_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deliveryCharge = json['delivery_charge'];
    scheduleAt = json['schedule_at'];
    callback = json['callback'];
    otp = json['otp'];
    pending = json['pending'];
    accepted = json['accepted'];
    confirmed = json['confirmed'];
    processing = json['processing'];
    handover = json['handover'];
    pickedUp = json['picked_up'];
    delivered = json['delivered'];
    canceled = json['canceled'];
    refundRequested = json['refund_requested'];
    refunded = json['refunded'];
    transactionId = json['transaction_id'];
    deliveryAddress = json['delivery_address'];
    scheduled = json['scheduled'];
    restaurantDiscountAmount = json['restaurant_discount_amount'];
    originalDeliveryCharge = json['original_delivery_charge'];
    failed = json['failed'];
    adjusment = json['adjusment'];
    edited = json['edited'];
    if (json['cart_details'] != null) {
      cartDetails = <CartDetails>[];
      json['cart_details'].forEach((v) {
        cartDetails.add(new CartDetails.fromJson(v));
      });
    }
    deliveryBoyName = json['delivery_boy_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['food_id'] = this.foodId;
    data['quantity'] = this.quantity;
    data['order_amount'] = this.orderAmount;
    data['coupon_discount_amount'] = this.couponDiscountAmount;
    data['coupon_discount_title'] = this.couponDiscountTitle;
    data['payment_status'] = this.paymentStatus;
    data['order_status'] = this.orderStatus;
    data['total_tax_amount'] = this.totalTaxAmount;
    data['payment_method'] = this.paymentMethod;
    data['transaction_reference'] = this.transactionReference;
    data['delivery_man_id'] = this.deliveryManId;
    data['coupon_code'] = this.couponCode;
    data['order_note'] = this.orderNote;
    data['order_type'] = this.orderType;
    data['checked'] = this.checked;
    data['restaurant_id'] = this.restaurantId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['delivery_charge'] = this.deliveryCharge;
    data['schedule_at'] = this.scheduleAt;
    data['callback'] = this.callback;
    data['otp'] = this.otp;
    data['pending'] = this.pending;
    data['accepted'] = this.accepted;
    data['confirmed'] = this.confirmed;
    data['processing'] = this.processing;
    data['handover'] = this.handover;
    data['picked_up'] = this.pickedUp;
    data['delivered'] = this.delivered;
    data['canceled'] = this.canceled;
    data['refund_requested'] = this.refundRequested;
    data['refunded'] = this.refunded;
    data['transaction_id'] = this.transactionId;
    data['delivery_address'] = this.deliveryAddress;
    data['scheduled'] = this.scheduled;
    data['restaurant_discount_amount'] = this.restaurantDiscountAmount;
    data['original_delivery_charge'] = this.originalDeliveryCharge;
    data['failed'] = this.failed;
    data['adjusment'] = this.adjusment;
    data['edited'] = this.edited;
    if (this.cartDetails != null) {
      data['cart_details'] = this.cartDetails.map((v) => v.toJson()).toList();
    }
    data['delivery_boy_name'] = this.deliveryBoyName;
    return data;
  }
}

class CartDetails {
  int cartId;
  int userId;
  int restaurantId;
  int foodId;
  int quantity;
  int tax;
  int foodAmount;
  String orderId;
  int isOdered;
  String addedDtime;
  int status;
  String foodName;
  String foodImage;

  CartDetails(
      {this.cartId,
      this.userId,
      this.restaurantId,
      this.foodId,
      this.quantity,
      this.tax,
      this.foodAmount,
      this.orderId,
      this.isOdered,
      this.addedDtime,
      this.status,
      this.foodName,
      this.foodImage});

  CartDetails.fromJson(Map<String, dynamic> json) {
    cartId = json['cart_id'];
    userId = json['user_id'];
    restaurantId = json['restaurant_id'];
    foodId = json['food_id'];
    quantity = json['quantity'];
    tax = json['tax'];
    foodAmount = json['food_amount'];
    orderId = json['order_id'];
    isOdered = json['is_odered'];
    addedDtime = json['added_dtime'];
    status = json['status'];
    foodName = json['food_name'];
    foodImage = json['food_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cart_id'] = this.cartId;
    data['user_id'] = this.userId;
    data['restaurant_id'] = this.restaurantId;
    data['food_id'] = this.foodId;
    data['quantity'] = this.quantity;
    data['tax'] = this.tax;
    data['food_amount'] = this.foodAmount;
    data['order_id'] = this.orderId;
    data['is_odered'] = this.isOdered;
    data['added_dtime'] = this.addedDtime;
    data['status'] = this.status;
    data['food_name'] = this.foodName;
    data['food_image'] = this.foodImage;
    return data;
  }
}
// class DeliveredModel {
//   int state;
//   String message;
//   RespData respData;

//   DeliveredModel({this.state, this.message, this.respData});

//   DeliveredModel.fromJson(Map<String, dynamic> json) {
//     state = json['state'];
//     message = json['message'];
//     respData = json['respData'] != null
//         ? new RespData.fromJson(json['respData'])
//         : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['state'] = this.state;
//     data['message'] = this.message;
//     if (this.respData != null) {
//       data['respData'] = this.respData.toJson();
//     }
//     return data;
//   }
// }

// class RespData {
//   List<Restaurants> restaurants;

//   RespData({this.restaurants});

//   RespData.fromJson(Map<String, dynamic> json) {
//     if (json['restaurants'] != null) {
//       restaurants = <Restaurants>[];
//       json['restaurants'].forEach((v) {
//         restaurants.add(new Restaurants.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.restaurants != null) {
//       data['restaurants'] = this.restaurants.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Restaurants {
//   int id;
//   int userId;
//   int foodId;
//   int quantity;
//   int orderAmount;
//   int couponDiscountAmount;
//   String couponDiscountTitle;
//   String paymentStatus;
//   String orderStatus;
//   int totalTaxAmount;
//   String paymentMethod;
//   String transactionReference;
//   String deliveryManId;
//   String couponCode;
//   String orderNote;
//   String orderType;
//   int checked;
//   int restaurantId;
//   String createdAt;
//   String updatedAt;
//   int deliveryCharge;
//   String scheduleAt;
//   String callback;
//   String otp;
//   String pending;
//   String accepted;
//   String confirmed;
//   String processing;
//   String handover;
//   String pickedUp;
//   String delivered;
//   String canceled;
//   String refundRequested;
//   String refunded;
//   String transactionId;
//   String deliveryAddress;
//   int scheduled;
//   int restaurantDiscountAmount;
//   String originalDeliveryCharge;
//   String failed;
//   String adjusment;
//   int edited;
//   List<CartDetails> cartDetails;
//   String deliveryBoyName;

//   Restaurants(
//       {this.id,
//       this.userId,
//       this.foodId,
//       this.quantity,
//       this.orderAmount,
//       this.couponDiscountAmount,
//       this.couponDiscountTitle,
//       this.paymentStatus,
//       this.orderStatus,
//       this.totalTaxAmount,
//       this.paymentMethod,
//       this.transactionReference,
//       this.deliveryManId,
//       this.couponCode,
//       this.orderNote,
//       this.orderType,
//       this.checked,
//       this.restaurantId,
//       this.createdAt,
//       this.updatedAt,
//       this.deliveryCharge,
//       this.scheduleAt,
//       this.callback,
//       this.otp,
//       this.pending,
//       this.accepted,
//       this.confirmed,
//       this.processing,
//       this.handover,
//       this.pickedUp,
//       this.delivered,
//       this.canceled,
//       this.refundRequested,
//       this.refunded,
//       this.transactionId,
//       this.deliveryAddress,
//       this.scheduled,
//       this.restaurantDiscountAmount,
//       this.originalDeliveryCharge,
//       this.failed,
//       this.adjusment,
//       this.edited,
//       this.cartDetails,
//       this.deliveryBoyName});

//   Restaurants.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     userId = json['user_id'];
//     foodId = json['food_id'];
//     quantity = json['quantity'];
//     orderAmount = json['order_amount'];
//     couponDiscountAmount = json['coupon_discount_amount'];
//     couponDiscountTitle = json['coupon_discount_title'];
//     paymentStatus = json['payment_status'];
//     orderStatus = json['order_status'];
//     totalTaxAmount = json['total_tax_amount'];
//     paymentMethod = json['payment_method'];
//     transactionReference = json['transaction_reference'];
//     deliveryManId = json['delivery_man_id'];
//     couponCode = json['coupon_code'];
//     orderNote = json['order_note'];
//     orderType = json['order_type'];
//     checked = json['checked'];
//     restaurantId = json['restaurant_id'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     deliveryCharge = json['delivery_charge'];
//     scheduleAt = json['schedule_at'];
//     callback = json['callback'];
//     otp = json['otp'];
//     pending = json['pending'];
//     accepted = json['accepted'];
//     confirmed = json['confirmed'];
//     processing = json['processing'];
//     handover = json['handover'];
//     pickedUp = json['picked_up'];
//     delivered = json['delivered'];
//     canceled = json['canceled'];
//     refundRequested = json['refund_requested'];
//     refunded = json['refunded'];
//     transactionId = json['transaction_id'];
//     deliveryAddress = json['delivery_address'];
//     scheduled = json['scheduled'];
//     restaurantDiscountAmount = json['restaurant_discount_amount'];
//     originalDeliveryCharge = json['original_delivery_charge'];
//     failed = json['failed'];
//     adjusment = json['adjusment'];
//     edited = json['edited'];
//     if (json['cart_details'] != null) {
//       cartDetails = <CartDetails>[];
//       json['cart_details'].forEach((v) {
//         cartDetails.add(new CartDetails.fromJson(v));
//       });
//     }
//     deliveryBoyName = json['delivery_boy_name'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['user_id'] = this.userId;
//     data['food_id'] = this.foodId;
//     data['quantity'] = this.quantity;
//     data['order_amount'] = this.orderAmount;
//     data['coupon_discount_amount'] = this.couponDiscountAmount;
//     data['coupon_discount_title'] = this.couponDiscountTitle;
//     data['payment_status'] = this.paymentStatus;
//     data['order_status'] = this.orderStatus;
//     data['total_tax_amount'] = this.totalTaxAmount;
//     data['payment_method'] = this.paymentMethod;
//     data['transaction_reference'] = this.transactionReference;
//     data['delivery_man_id'] = this.deliveryManId;
//     data['coupon_code'] = this.couponCode;
//     data['order_note'] = this.orderNote;
//     data['order_type'] = this.orderType;
//     data['checked'] = this.checked;
//     data['restaurant_id'] = this.restaurantId;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     data['delivery_charge'] = this.deliveryCharge;
//     data['schedule_at'] = this.scheduleAt;
//     data['callback'] = this.callback;
//     data['otp'] = this.otp;
//     data['pending'] = this.pending;
//     data['accepted'] = this.accepted;
//     data['confirmed'] = this.confirmed;
//     data['processing'] = this.processing;
//     data['handover'] = this.handover;
//     data['picked_up'] = this.pickedUp;
//     data['delivered'] = this.delivered;
//     data['canceled'] = this.canceled;
//     data['refund_requested'] = this.refundRequested;
//     data['refunded'] = this.refunded;
//     data['transaction_id'] = this.transactionId;
//     data['delivery_address'] = this.deliveryAddress;
//     data['scheduled'] = this.scheduled;
//     data['restaurant_discount_amount'] = this.restaurantDiscountAmount;
//     data['original_delivery_charge'] = this.originalDeliveryCharge;
//     data['failed'] = this.failed;
//     data['adjusment'] = this.adjusment;
//     data['edited'] = this.edited;
//     if (this.cartDetails != null) {
//       data['cart_details'] = this.cartDetails.map((v) => v.toJson()).toList();
//     }
//     data['delivery_boy_name'] = this.deliveryBoyName;
//     return data;
//   }
// }

// class CartDetails {
//   int cartId;
//   int userId;
//   int restaurantId;
//   int foodId;
//   int quantity;
//   int tax;
//   int foodAmount;
//   String orderId;
//   int isOdered;
//   String addedDtime;
//   int status;
//   String foodName;
//   String foodImage;

//   CartDetails(
//       {this.cartId,
//       this.userId,
//       this.restaurantId,
//       this.foodId,
//       this.quantity,
//       this.tax,
//       this.foodAmount,
//       this.orderId,
//       this.isOdered,
//       this.addedDtime,
//       this.status,
//       this.foodName,
//       this.foodImage});

//   CartDetails.fromJson(Map<String, dynamic> json) {
//     cartId = json['cart_id'];
//     userId = json['user_id'];
//     restaurantId = json['restaurant_id'];
//     foodId = json['food_id'];
//     quantity = json['quantity'];
//     tax = json['tax'];
//     foodAmount = json['food_amount'];
//     orderId = json['order_id'];
//     isOdered = json['is_odered'];
//     addedDtime = json['added_dtime'];
//     status = json['status'];
//     foodName = json['food_name'];
//     foodImage = json['food_image'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['cart_id'] = this.cartId;
//     data['user_id'] = this.userId;
//     data['restaurant_id'] = this.restaurantId;
//     data['food_id'] = this.foodId;
//     data['quantity'] = this.quantity;
//     data['tax'] = this.tax;
//     data['food_amount'] = this.foodAmount;
//     data['order_id'] = this.orderId;
//     data['is_odered'] = this.isOdered;
//     data['added_dtime'] = this.addedDtime;
//     data['status'] = this.status;
//     data['food_name'] = this.foodName;
//     data['food_image'] = this.foodImage;
//     return data;
//   }
// }
