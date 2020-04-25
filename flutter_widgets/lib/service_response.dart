class ServiceResponse {
  Services services;
  List<DiscoverNewsItem> news;

  ServiceResponse({this.services, this.news});

  ServiceResponse.fromJson(Map<String, dynamic> json) {
    services = json['services'] != null
        ? new Services.fromJson(json['services'])
        : null;
    if (json['news'] != null) {
      news = new List<DiscoverNewsItem>();
      json['news'].forEach((v) {
        news.add(new DiscoverNewsItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.services != null) {
      data['services'] = this.services.toJson();
    }
    if (this.news != null) {
      data['news'] = this.news.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Services {
  String apiVersion;
  List<ServiceConfigurations> serviceConfigurations;

  Services({this.apiVersion, this.serviceConfigurations});

  Services.fromJson(Map<String, dynamic> json) {
    apiVersion = json['apiVersion'];
    if (json['service_configurations'] != null) {
      serviceConfigurations = new List<ServiceConfigurations>();
      json['service_configurations'].forEach((v) {
        serviceConfigurations.add(new ServiceConfigurations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['apiVersion'] = this.apiVersion;
    if (this.serviceConfigurations != null) {
      data['service_configurations'] =
          this.serviceConfigurations.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ServiceConfigurations {
  String name;
  String apiVersion;
  bool error;
  String display;
  ServiceTypes serviceTypes;
  List<DiscoverServiceGroup> value;

  ServiceConfigurations(
      {this.name,
      this.apiVersion,
      this.error,
      this.display,
      this.serviceTypes,
      this.value});

  ServiceConfigurations.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    apiVersion = json['apiVersion'];
    error = json['error'];
    display = json['display'];
    serviceTypes = json['serviceTypes'] != null
        ? new ServiceTypes.fromJson(json['serviceTypes'])
        : null;
    if (json['value'] != null) {
      value = new List<DiscoverServiceGroup>();
      json['value'].forEach((v) {
        value.add(new DiscoverServiceGroup.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['apiVersion'] = this.apiVersion;
    data['error'] = this.error;
    data['display'] = this.display;
    if (this.serviceTypes != null) {
      data['serviceTypes'] = this.serviceTypes.toJson();
    }
    if (this.value != null) {
      data['value'] = this.value.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ServiceTypes {
  int service;

  ServiceTypes({this.service});

  ServiceTypes.fromJson(Map<String, dynamic> json) {
    service = json['service'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['service'] = this.service;
    return data;
  }
}

class DiscoverServiceGroup {
  String groupName;
  int displayOrder;
  List<ServiceItem> services;

  DiscoverServiceGroup({this.groupName, this.displayOrder, this.services});

  DiscoverServiceGroup.fromJson(Map<String, dynamic> json) {
    groupName = json['groupName'];
    displayOrder = json['displayOrder'];
    if (json['services'] != null) {
      services = new List<ServiceItem>();
      json['services'].forEach((v) {
        services.add(new ServiceItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['groupName'] = this.groupName;
    data['displayOrder'] = this.displayOrder;
    if (this.services != null) {
      data['services'] = this.services.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ServiceItem {
  String id;
  String image;
  String name;
  String serviceCode;
  String description;
  String shortDescription;
  String type;
  String uri;
  String transitionType;
  String storeURI;
  int position;
  int status;

  ServiceItem(
      {this.id,
      this.image,
      this.name,
      this.serviceCode,
      this.description,
      this.shortDescription,
      this.type,
      this.uri,
      this.transitionType,
      this.storeURI,
      this.position,
      this.status});

  ServiceItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    name = json['name'];
    serviceCode = json['serviceCode'];
    description = json['description'];
    shortDescription = json['shortDescription'];
    type = json['type'];
    uri = json['uri'];
    transitionType = json['transitionType'];
    storeURI = json['storeURI'];
    position = json['position'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['name'] = this.name;
    data['serviceCode'] = this.serviceCode;
    data['description'] = this.description;
    data['shortDescription'] = this.shortDescription;
    data['type'] = this.type;
    data['uri'] = this.uri;
    data['transitionType'] = this.transitionType;
    data['storeURI'] = this.storeURI;
    data['position'] = this.position;
    data['status'] = this.status;
    return data;
  }
}

class DiscoverNewsItem {
  int id;
  String serviceTitle;
  String bannerImageUrl;
  String serviceNewsUrl;
  int thirdPartyNewsId;

  DiscoverNewsItem(
      {this.id,
      this.serviceTitle,
      this.bannerImageUrl,
      this.serviceNewsUrl,
      this.thirdPartyNewsId});

  DiscoverNewsItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    serviceTitle = json['serviceTitle'];
    bannerImageUrl = json['bannerImageUrl'];
    serviceNewsUrl = json['serviceNewsUrl'];
    thirdPartyNewsId = json['thirdPartyNewsId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['serviceTitle'] = this.serviceTitle;
    data['bannerImageUrl'] = this.bannerImageUrl;
    data['serviceNewsUrl'] = this.serviceNewsUrl;
    data['thirdPartyNewsId'] = this.thirdPartyNewsId;
    return data;
  }
}
