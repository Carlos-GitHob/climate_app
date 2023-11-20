class Climate {
    Location? location;
    Current? current;

    Climate({
         this.location,
         this.current,
    });

     Climate.fromJson(Map<String, dynamic> json){
        location = Location.fromJson(json["location"]);
        current = Current.fromJson(json["current"]);
     }

    Map<String, dynamic> toJson() {
      final Map<String, dynamic> data = <String, dynamic>{};
        data['current'] = current?.toJson();
        data["location"] = location;
        return data;
    }
}

class Current {
    int? lastUpdatedEpoch;
    String? lastUpdated;
    int? tempC;
    double? tempF;
    int? isDay;
    Condition? condition;
    double? windMph;
    int? windKph;
    int? windDegree;
    String? windDir;
    int? pressureMb;
    double? pressureIn;
    double? precipMm;
    int? precipIn;
    int? humidity;
    int? cloud;
    double? feelslikeC;
    double? feelslikeF;
    int? visKm;
    int? visMiles;
    int? uv;
    double? gustMph;
    double? gustKph;
    Map<String, double>? airQuality;

    Current({
         this.lastUpdatedEpoch,
         this.lastUpdated,
         this.tempC,
         this.tempF,
         this.isDay,
         this.condition,
         this.windMph,
         this.windKph,
         this.windDegree,
         this.windDir,
         this.pressureMb,
         this.pressureIn,
         this.precipMm,
         this.precipIn,
         this.humidity,
         this.cloud,
         this.feelslikeC,
         this.feelslikeF,
         this.visKm,
         this.visMiles,
         this.uv,
         this.gustMph,
         this.gustKph,
         this.airQuality,
    });

     Current.fromJson(Map<String, dynamic> json) {
        lastUpdatedEpoch= json["last_updated_epoch"];
        lastUpdated= json["last_updated"];
        tempC= json["temp_c"];
        tempF= json["temp_f"]?.toDouble();
        isDay= json["is_day"];
        condition= Condition.fromJson(json["condition"]);
        windMph= json["wind_mph"]?.toDouble();
        windKph= json["wind_kph"];
        windDegree= json["wind_degree"];
        windDir= json["wind_dir"];
        pressureMb= json["pressure_mb"];
        pressureIn= json["pressure_in"]?.toDouble();
        precipMm= json["precip_mm"]?.toDouble();
        precipIn= json["precip_in"];
        humidity= json["humidity"];
        cloud= json["cloud"];
        feelslikeC= json["feelslike_c"]?.toDouble();
        feelslikeF= json["feelslike_f"]?.toDouble();
        visKm= json["vis_km"];
        visMiles= json["vis_miles"];
        uv= json["uv"];
        gustMph= json["gust_mph"]?.toDouble();
        gustKph= json["gust_kph"]?.toDouble();
        airQuality= Map.from(json["air_quality"]).map((k, v) => MapEntry<String, double>(k, v?.toDouble()));
     }

    Map<String, dynamic> toJson() {
      final Map<String, dynamic> data = <String, dynamic>{};
        data['last_updated_epoch']= lastUpdatedEpoch;
        data["last_updated"]= lastUpdated;
        data['temp_c']= tempC;
        data['temp_f']= tempF;
        data['is_day']= isDay;
        data["condition"]= condition?.toJson();
        data['wind_mph']= windMph;
        data['wind_kph']= windKph;
        data['wind_degree']= windDegree;
        data["wind_dir"]=windDir;
        data['pressure_mb']= pressureMb;
        data['pressure_in']= pressureIn;
        data['precip_mm']= precipMm;
        data['precip_in']= precipIn;
        data['humidity']= humidity;
        data['cloud']=cloud;
        data['feelslike_c']= feelslikeC;
        data['feelslike_f']= feelslikeF;
        data['vis_km']= visKm;
        data['vis_miles']= visMiles;
        data['uv']= uv;
        data['gust_mph']= gustMph;
        data['gust_kph']= gustKph;
        data['airQuality']= Map.from(data["air_quality"]).map((k, v) => MapEntry<String, double>(k, v?.toDouble()));
        return data;
    }
}

class Condition {
    String? text;
    String? icon;
    int? code;

    Condition({
         this.text,
         this.icon,
         this.code,
    });

     Condition.fromJson(Map<String, dynamic> json) {
        text= json["text"];
        icon= json["icon"];
        code= json["code"];
     }

    Map<String, dynamic> toJson() {
      final Map<String, dynamic> data = <String, dynamic>{};
        data["text"]= text;
        data["icon"]= icon;
        data["code"]= code;
        return data;
    }
}

class Location {
    String? name;
    String? region;
    String? country;
    double? lat;
    double? lon;
    String? tzId;
    int? localtimeEpoch;
    String? localtime;

    Location({
         this.name,
         this.region,
         this.country,
         this.lat,
         this.lon,
         this.tzId,
         this.localtimeEpoch,
         this.localtime,
    });

     Location.fromJson(Map<String, dynamic> json) {
        name = json["name"];
        region= json["region"];
        country= json["country"];
        lat= json["lat"]?.toDouble();
        lon= json["lon"]?.toDouble();
        tzId= json["tz_id"];
        localtimeEpoch= json["localtime_epoch"];
        localtime= json["localtime"];
    }

    Map<String, dynamic> toJson()  {
      final Map<String, dynamic> data = <String, dynamic>{};
        data["name"]= name;
        data["region"]= region;
        data["country"]= country;
        data["lat"]= lat;
        data["lon"]=lon;
        data["tz_id"]= tzId;
        data["localtime_epoch"]= localtimeEpoch;
        data["localtime"]= localtime;
        return data;
    }
}
