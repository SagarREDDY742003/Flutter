import 'package:flutter/material.dart';
import 'package:weather_app/pages/weather_forecast_item.dart';
import 'package:weather_app/pages/additional_information_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Weather App',
          style: TextStyle(
            fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed:() {
              
            }, 
            icon: Icon(Icons.refresh),
          )
        ],
      ),

      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            //main card
            SizedBox(
              width: double.infinity,
              child: Card(
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        '300 °C',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 16,),
                  
                      Icon(
                        Icons.cloud,
                        size: 64,
                      ),
                      SizedBox(height: 16,),
                  
                      Text(
                        'Rain',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
        
            ////weather forecast
            Text(
              'Weather Forecast',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  WeatherForecastItem(
                    

                  ),
                  WeatherForecastItem(),
                  WeatherForecastItem(),
                  WeatherForecastItem(),
                  WeatherForecastItem()
                ],
              ),
            ),
            const SizedBox(height: 20),
        
            ///additional information
             Text(
              'Additional Information',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8,),

            SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AdditionalInformationItem(
                    icon:Icons.water_drop,
                    label: 'Humidity',
                    value: '91',
                  ),
                  AdditionalInformationItem(
                    icon:Icons.water_drop,
                    label: 'Wind Speed',
                    value: '7.67',
                  ),
                  AdditionalInformationItem(
                    icon:Icons.water_drop,
                    label: 'Pressure',
                    value: '1006',
                  ),
                ],
              ),
            )


          ],
        ),
      ),
    );
  }
}
