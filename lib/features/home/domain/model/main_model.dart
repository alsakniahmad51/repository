class User {
  final Map<String, Categoriy> categories;

  User({required this.categories});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      categories: (json).map(
        (key, value) => MapEntry(key, Categoriy.fromJson(value)),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'animals': categories.map((key, value) => MapEntry(key, value.toJson())),
    };
  }
}

class Categoriy {
  final Production production;
  final Sallary sallary;

  Categoriy({required this.production, required this.sallary});

  factory Categoriy.fromJson(Map<Object?, dynamic> json) {
    return Categoriy(
      production:
          Production.fromJson(Map<String, dynamic>.from(json['production'])),
      sallary: Sallary.fromJson(Map<String, dynamic>.from(json['sallary'])),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'production': production.toJson(),
      'sallary': sallary.toJson(),
    };
  }
}

class Production {
  final int count;
  final String date;
  final String notes;
  final int weight;

  Production({
    required this.count,
    required this.date,
    required this.notes,
    required this.weight,
  });

  factory Production.fromJson(Map<String, dynamic> json) {
    return Production(
      count: json['count'] as int,
      date: json['date'] as String,
      notes: json['notes'] as String,
      weight: json['weight'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'count': count,
      'date': date,
      'notes': notes,
      'weight': weight,
    };
  }
}

class Sallary {
  final String clientName;
  final String notes;
  final int orderid;
  final int sallary;
  final String sallarydate;

  Sallary({
    required this.clientName,
    required this.notes,
    required this.orderid,
    required this.sallary,
    required this.sallarydate,
  });

  factory Sallary.fromJson(Map<String, dynamic> json) {
    return Sallary(
      clientName: json['clientName'] as String,
      notes: json['notes'] as String,
      orderid: json['orderid'] as int,
      sallary: json['sallary'] as int,
      sallarydate: json['sallarydate'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'clientName': clientName,
      'notes': notes,
      'orderid': orderid,
      'sallary': sallary,
      'sallarydate': sallarydate,
    };
  }
}
