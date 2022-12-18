// To parse this JSON data, do
//
//     final restaurant = restaurantFromJson(jsonString?);

import 'dart:convert';

Restaurant restaurantFromJson(String? str) => Restaurant.fromJson(json.decode(str!));

String? restaurantToJson(Restaurant data) => json.encode(data.toJson());

class Restaurant {
    Restaurant({
        this.status,
        this.data,
    });

    bool? status;
    List<Datum>? data;

    factory Restaurant.fromJson(Map<String?, dynamic> json) => Restaurant(
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String?, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        this.sellerCity,
        this.preparationTime,
        this.sellerCode,
        this.pf,
        this.businessName,
        this.businessLogo,
        this.productCode,
        this.productName,
        this.productDescription,
        this.productPrice,
        this.productAQuantity,
        this.productType,
        this.productPaymentMode,
        this.categoryCode,
        this.categoryName,
        this.productStatus,
        this.skinTypes,
        this.genderTypes,
        this.allergyDetails,
        this.dynamicLink,
        this.productImages,
        this.modifierGroup,
    });

    String? sellerCity;
    String? preparationTime;
    String? sellerCode;
    int ?pf;
    String? businessName;
    String? businessLogo;
    String? productCode;
    String? productName;
    String? productDescription;
    String? productPrice;
    String? productAQuantity;
    String? productType;
    String? productPaymentMode;
    String? categoryCode;
    String? categoryName;
    String? productStatus;
    String? skinTypes;
    String? genderTypes;
    String? allergyDetails;
    String? dynamicLink;
    ProductImages? productImages;
    List<ModifierGroup>? modifierGroup;

    factory Datum.fromJson(Map<String?, dynamic> json) => Datum(
        sellerCity: json["seller_city"],
        preparationTime: json["preparation_time"],
        sellerCode: json["seller_code"],
        pf: json["pf"],
        businessName: json["business_name"],
        businessLogo: json["business_logo"],
        productCode: json["product_code"],
        productName: json["product_name"],
        productDescription: json["product_description"],
        productPrice: json["product_price"],
        productAQuantity: json["product_a_quantity"],
        productType: json["product_type"],
        productPaymentMode: json["product_payment_mode"],
        categoryCode: json["category_code"],
        categoryName: json["category_name"],
        productStatus: json["product_status"],
        skinTypes: json["skin_types"],
        genderTypes: json["gender_types"],
        allergyDetails: json["allergy_details"],
        dynamicLink: json["dynamic_link"],
        productImages: ProductImages.fromJson(json["product_images"]),
        modifierGroup: List<ModifierGroup>.from(json["modifier_group"].map((x) => ModifierGroup.fromJson(x))),
    );

    Map<String?, dynamic> toJson() => {
        "seller_city": sellerCity,
        "preparation_time": preparationTime,
        "seller_code": sellerCode,
        "pf": pf,
        "business_name": businessName,
        "business_logo": businessLogo,
        "product_code": productCode,
        "product_name": productName,
        "product_description": productDescription,
        "product_price": productPrice,
        "product_a_quantity": productAQuantity,
        "product_type": productType,
        "product_payment_mode": productPaymentMode,
        "category_code": categoryCode,
        "category_name": categoryName,
        "product_status": productStatus,
        "skin_types": skinTypes,
        "gender_types": genderTypes,
        "allergy_details": allergyDetails,
        "dynamic_link": dynamicLink,
        "product_images": productImages!.toJson(),
        "modifier_group": List<dynamic>.from(modifierGroup!.map((x) => x.toJson())),
    };
}

class ModifierGroup {
    ModifierGroup({
        this.groupCode,
        this.name,
        this.limitModifiers,
        this.numberModifiers,
        this.selectionType,
        this.modifierMessage,
        this.subModifiers,
    });

    String? groupCode;
    String? name;
    String? limitModifiers;
    String? numberModifiers;
    String? selectionType;
    String? modifierMessage;
    List<SubModifier>? subModifiers;

    factory ModifierGroup.fromJson(Map<String?, dynamic> json) => ModifierGroup(
        groupCode: json["group_code"],
        name: json["name"],
        limitModifiers: json["limit_modifiers"],
        numberModifiers: json["number_modifiers"],
        selectionType: json["selection_type"],
        modifierMessage: json["modifier_message"],
        subModifiers: List<SubModifier>.from(json["sub_modifiers"].map((x) => SubModifier.fromJson(x))),
    );

    Map<String?, dynamic> toJson() => {
        "group_code": groupCode,
        "name": name,
        "limit_modifiers": limitModifiers,
        "number_modifiers": numberModifiers,
        "selection_type": selectionType,
        "modifier_message": modifierMessage,
        "sub_modifiers": List<dynamic>.from(subModifiers!.map((x) => x.toJson())),
    };
}

class SubModifier {
    SubModifier({
        this.modifierCode,
        this.nameModifier,
        this.priceModifier,
        this.byDefault,
    });

    String? modifierCode;
    String? nameModifier;
    String? priceModifier;
    String? byDefault;

    factory SubModifier.fromJson(Map<String?, dynamic> json) => SubModifier(
        modifierCode: json["modifier_code"],
        nameModifier: json["name_modifier"],
        priceModifier: json["price_modifier"],
        byDefault: json["by_default"],
    );

    Map<String?, dynamic> toJson() => {
        "modifier_code": modifierCode,
        "name_modifier": nameModifier,
        "price_modifier": priceModifier,
        "by_default": byDefault,
    };
}

class ProductImages {
    ProductImages({
        this.images,
        this.videos,
    });

    List<String>?images;
    List<String>? videos;

    factory ProductImages.fromJson(Map<String?, dynamic> json) => ProductImages(
        images: List<String>.from(json["images"].map((x) => x)),
        videos: List<String>.from(json["videos"].map((x) => x)),
    );

    Map<String?, dynamic> toJson() => {
        "images": List<dynamic>.from(images!.map((x) => x)),
        "videos": List<dynamic>.from(videos!.map((x) => x)),
    };
}
