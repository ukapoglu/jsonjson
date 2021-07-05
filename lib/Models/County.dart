class County {
  int? id;
  String? name;
  dynamic createBy;
  String? createTime;
  dynamic updateBy;
  String? updateTime;
  bool? isActive;

  County({
      this.id,
      this.name,
      this.createBy, 
      this.createTime,
      this.updateBy, 
      this.updateTime,
      this.isActive});

  County.fromJson(dynamic json) {
    id = json["id"];
    name = json["name"];
    createBy = json["createBy"];
    createTime = json["createTime"];
    updateBy = json["updateBy"];
    updateTime = json["updateTime"];
    isActive = json["isActive"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["name"] = name;
    map["createBy"] = createBy;
    map["createTime"] = createTime;
    map["updateBy"] = updateBy;
    map["updateTime"] = updateTime;
    map["isActive"] = isActive;
    return map;
  }

}
