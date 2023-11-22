import 'package:flutter/material.dart';
import 'package:climate_app/clases/climate.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ClimateHomePage extends StatefulWidget{
   const ClimateHomePage({super.key});
   
     @override
     State<StatefulWidget> createState() => _ClimateHomePageState();


}

class _ClimateHomePageState extends State<ClimateHomePage>{
   late Future<Climate> climaFuture;

   @override
   void initState() {
    super.initState();
    climaFuture = getClima('honduras');
  }

  Future<Climate> getClima(String country) async {
    final response = await http.get(Uri.parse('http://api.weatherapi.com/v1/current.json?key= 869e4dcbc7984207be3214252231811&q=$country&aqi=yes'));
    
    if (response.statusCode == 200) {
      return Climate.fromJson(jsonDecode(response.body));
    }else {
      throw Exception('No se pudo cargar las noticias climaticas');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Noticias del clima"),
        actions: const [
          IconButton(onPressed: null, icon: Icon(Icons.search)),
          IconButton(onPressed: null, icon: Icon(Icons.more_vert)),
          IconButton(onPressed: null, icon: Icon(Icons.refresh)),
        ],
      ),
      body: Center(
        child: FutureBuilder(
          future: climaFuture,
          builder: (context,snapshot){
            if (snapshot.connectionState == ConnectionState.waiting){
              return const CircularProgressIndicator();

            }else if (snapshot.hasData){
              final climas = snapshot.data!;
              return buildClima(climas as List<Climate>);
            }else{
              return const Text("No data avaidable");
            }
          }
        )
      ),
    );
  }

   

}

Widget buildClima(List<Climate> climas) {
  return ListView.separated(
    itemCount: climas.length,
    itemBuilder: (BuildContext context, int index){
      final climateData = climas[index];
      
      return ListTile(
        title: Text('Nombre del pais:  ${climateData.location?.country ?? "Infomracion no disponible"}'),
        contentPadding: const EdgeInsets.all(8.0),
        dense: true,
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Region: ${climateData.location?.region ?? "Infomracion no disponible"}'),
            Text('Nombre: ${climateData.location?.name ?? "Infomracion no disponible"}'),
            Text('Temperatura Celsius: ${climateData.current?.tempC ?? "Infomracion no disponible"}'),
            Text('Temperatura Farenheit: ${climateData.current?.tempF ?? "Infomracion no disponible"}'),
            Text('Humedad: ${climateData.current?.humidity ?? "Infomracion no disponible"}'),
            Text('Nubes: ${climateData.current?.cloud ?? "Infomracion no disponible"}'),
            Text('Velocidad de viento en kilometros/hora: ${climateData.current?.windKph ?? "Infomracion no disponible"}'),
            Text('Velocidad de viento en metros/hora: ${climateData.current?.windMph ?? "Infomracion no disponible"}'),
            Text('Grado de viento: ${climateData.current?.windDegree ?? "Infomracion no disponible"}'),

          ],
        ),
      );
  },
  separatorBuilder: (BuildContext context, int index){
    return const Divider(
      thickness: 2,

    );
  }

  );
}