// To parse this JSON data, do
//
//     final dataDumpResponse = dataDumpResponseFromJson(jsonString);

import 'dart:convert';

DataDumpResponse dataDumpResponseFromJson(String str) =>
    DataDumpResponse.fromJson(json.decode(str));

String dataDumpResponseToJson(DataDumpResponse data) =>
    json.encode(data.toJson());

class DataDumpResponse {
  DataDumpResponse({
    this.description,
    this.soil,
    this.climate,
  });

  String? description;
  List<Soil>? soil;
  Climate? climate;

  factory DataDumpResponse.fromJson(Map<String, dynamic> json) =>
      DataDumpResponse(
        description: json["#### Description ####"],
        soil: json["#### Soil ####"] == null
            ? []
            : List<Soil>.from(
                json["#### Soil ####"]!.map((x) => Soil.fromJson(x))),
        climate: json["#### climate ####"] == null
            ? null
            : Climate.fromJson(json["#### climate ####"]),
      );

  Map<String, dynamic> toJson() => {
        "#### Description ####": description,
        "#### Soil ####": soil == null
            ? []
            : List<dynamic>.from(soil!.map((x) => x.toJson())),
        "#### climate ####": climate?.toJson(),
      };
}

class Climate {
  Climate({
    this.base,
    this.clouds,
    this.cod,
    this.coord,
    this.dt,
    this.id,
    this.main,
    this.name,
    this.sys,
    this.timezone,
    this.visibility,
    this.weather,
    this.wind,
  });

  String? base;
  Clouds? clouds;
  dynamic cod;
  Coord? coord;
  dynamic dt;
  dynamic id;
  Main? main;
  String? name;
  Sys? sys;
  dynamic timezone;
  dynamic visibility;
  List<Weather>? weather;
  Wind? wind;

  factory Climate.fromJson(Map<String, dynamic> json) => Climate(
        base: json["base"],
        clouds: json["clouds"] == null ? null : Clouds.fromJson(json["clouds"]),
        cod: json["cod"],
        coord: json["coord"] == null ? null : Coord.fromJson(json["coord"]),
        dt: json["dt"],
        id: json["id"],
        main: json["main"] == null ? null : Main.fromJson(json["main"]),
        name: json["name"],
        sys: json["sys"] == null ? null : Sys.fromJson(json["sys"]),
        timezone: json["timezone"],
        visibility: json["visibility"],
        weather: json["weather"] == null
            ? []
            : List<Weather>.from(
                json["weather"]!.map((x) => Weather.fromJson(x))),
        wind: json["wind"] == null ? null : Wind.fromJson(json["wind"]),
      );

  Map<String, dynamic> toJson() => {
        "base": base,
        "clouds": clouds?.toJson(),
        "cod": cod,
        "coord": coord?.toJson(),
        "dt": dt,
        "id": id,
        "main": main?.toJson(),
        "name": name,
        "sys": sys?.toJson(),
        "timezone": timezone,
        "visibility": visibility,
        "weather": weather == null
            ? []
            : List<dynamic>.from(weather!.map((x) => x.toJson())),
        "wind": wind?.toJson(),
      };
}

class Clouds {
  Clouds({
    this.all,
  });

  dynamic? all;

  factory Clouds.fromJson(Map<String, dynamic> json) => Clouds(
        all: json["all"],
      );

  Map<String, dynamic> toJson() => {
        "all": all,
      };
}

class Coord {
  Coord({
    this.lat,
    this.lon,
  });

  dynamic? lat;
  dynamic? lon;

  factory Coord.fromJson(Map<String, dynamic> json) => Coord(
        lat: json["lat"],
        lon: json["lon"],
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lon": lon,
      };
}

class Main {
  Main({
    this.feelsLike,
    this.grndLevel,
    this.humidity,
    this.pressure,
    this.seaLevel,
    this.temp,
    this.tempMax,
    this.tempMin,
  });

  dynamic feelsLike;
  dynamic grndLevel;
  dynamic humidity;
  dynamic pressure;
  dynamic seaLevel;
  dynamic temp;
  dynamic tempMax;
  dynamic tempMin;

  factory Main.fromJson(Map<String, dynamic> json) => Main(
        feelsLike: json["feels_like"],
        grndLevel: json["grnd_level"],
        humidity: json["humidity"],
        pressure: json["pressure"],
        seaLevel: json["sea_level"],
        temp: json["temp"],
        tempMax: json["temp_max"],
        tempMin: json["temp_min"],
      );

  Map<String, dynamic> toJson() => {
        "feels_like": feelsLike,
        "grnd_level": grndLevel,
        "humidity": humidity,
        "pressure": pressure,
        "sea_level": seaLevel,
        "temp": temp,
        "temp_max": tempMax,
        "temp_min": tempMin,
      };
}

class Sys {
  Sys({
    this.country,
    this.sunrise,
    this.sunset,
  });

  String? country;
  dynamic sunrise;
  dynamic sunset;

  factory Sys.fromJson(Map<String, dynamic> json) => Sys(
        country: json["country"],
        sunrise: json["sunrise"],
        sunset: json["sunset"],
      );

  Map<String, dynamic> toJson() => {
        "country": country,
        "sunrise": sunrise,
        "sunset": sunset,
      };
}

class Weather {
  Weather({
    this.description,
    this.icon,
    this.id,
    this.main,
  });

  String? description;
  String? icon;
  dynamic id;
  String? main;

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        description: json["description"],
        icon: json["icon"],
        id: json["id"],
        main: json["main"],
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "icon": icon,
        "id": id,
        "main": main,
      };
}

class Wind {
  Wind({
    this.deg,
    this.gust,
    this.speed,
  });

  dynamic deg;
  dynamic gust;
  dynamic speed;

  factory Wind.fromJson(Map<String, dynamic> json) => Wind(
        deg: json["deg"],
        gust: json["gust"],
        speed: json["speed"],
      );

  Map<String, dynamic> toJson() => {
        "deg": deg,
        "gust": gust,
        "speed": speed,
      };
}

class Soil {
  Soil({
    this.ca,
    this.cu,
    this.depth,
    this.depthcode,
    this.farm,
    this.fe,
    this.k,
    this.lat,
    this.long,
    this.mg,
    this.mn,
    this.n,
    this.na,
    this.objectid,
    this.oc,
    this.p,
    this.x,
    this.y,
    this.zn,
    this.coordinates,
    this.pH,
    this.project,
  });

  dynamic ca;
  dynamic cu;
  String? depth;
  dynamic depthcode;
  String? farm;
  dynamic fe;
  dynamic k;
  dynamic lat;
  dynamic long;
  dynamic mg;
  dynamic mn;
  dynamic n;
  dynamic na;
  dynamic objectid;
  dynamic oc;
  dynamic p;
  dynamic x;
  dynamic y;
  dynamic zn;
  String? coordinates;
  dynamic pH;
  String? project;

  factory Soil.fromJson(Map<String, dynamic> json) => Soil(
        ca: json["Ca"],
        cu: json["Cu"],
        depth: json["Depth"],
        depthcode: json["Depthcode"],
        farm: json["Farm"],
        fe: json["Fe"],
        k: json["K"],
        lat: json["Lat"],
        long: json["Long"],
        mg: json["Mg"],
        mn: json["Mn"],
        n: json["N"],
        na: json["Na"],
        objectid: json["OBJECTID"],
        oc: json["OC"],
        p: json["P"],
        x: json["X"],
        y: json["Y"],
        zn: json["Zn"],
        coordinates: json["coordinates"],
        pH: json["pH"],
        project: json["project"],
      );

  Map<String, dynamic> toJson() => {
        "Ca": ca,
        "Cu": cu,
        "Depth": depth,
        "Depthcode": depthcode,
        "Farm": farm,
        "Fe": fe,
        "K": k,
        "Lat": lat,
        "Long": long,
        "Mg": mg,
        "Mn": mn,
        "N": n,
        "Na": na,
        "OBJECTID": objectid,
        "OC": oc,
        "P": p,
        "X": x,
        "Y": y,
        "Zn": zn,
        "coordinates": coordinates,
        "pH": pH,
        "project": project,
      };
}
