//.........................The FarmX hardware sourcecodes were built for the 2023 Google Solution Challenge..............................................................................
//Author: Olufemi Victor Tolulope in Team Chemotronix
//Reach out on linkedIn https://www.linkedin.com/in/olufemi-victor-tolulope/
// We'll be making this project Open source Forever!
// WARNING! If you are a newbie and just downloaded this code from my repository and you want to run it, you need to put it in the standard folder where arduino ide keeps its files, else the code won't compile




// Include the necessary libraries
#include <Arduino.h>
#if defined(ESP32)
#include <WiFi.h>
#include <FirebaseESP32.h>
#elif defined(ESP8266)
#include <ESP8266WiFi.h>
#include <FirebaseESP8266.h>
#elif defined(ARDUINO_RASPBERRY_PI_PICO_W)
#include <WiFi.h>
#include <FirebaseESP8266.h>
#endif

#include <Adafruit_ADS1X15.h> //For the ADC.
#include <Adafruit_BME280.h>

// define pin params
#define digitalPin1 D7
#define digitalPin2 D8
#define SEALEVELPRESSURE_HPA (1013.25)


Adafruit_ADS1115 ads;     /* I'm Using thi for the 16-bit version */
Adafruit_BME280 bme; // I2C


// Provide the token generation process info.
#include <addons/TokenHelper.h>

// Provide the RTDB payload printing info and other helper functions.
#include <addons/RTDBHelper.h>

/* 1. Define the WiFi credentials */
#define WIFI_SSID " " // I'm hiding secrets for open source purposes
#define WIFI_PASSWORD " " // I'm hiding secrets for open source purposes

// For the following credentials, see examples/Authentications/SignInAsUser/EmailPassword/EmailPassword.ino

/* 2. Define the API Key */
#define API_KEY " " // I'm hiding secrets for open source purposes

/* 3. Define the RTDB URL */
#define DATABASE_URL " " //<databaseName>.firebaseio.com or <databaseName>.<region>.firebasedatabase.app // I'm hiding secrets for open source purposes

/* 4. Define the user Email and password that alreadey registerd or added in your project */
#define USER_EMAIL " " // I'm hiding secrets for open source purposes
#define USER_PASSWORD " " // I'm hiding secrets for open source purposes



// Define Firebase Data object
FirebaseData fbdo;
FirebaseAuth auth;
FirebaseConfig config;

unsigned long sendDataPrevMillis = 0;

unsigned long count = 0;

#if defined(ARDUINO_RASPBERRY_PI_PICO_W)
WiFiMulti multi;
#endif

void setup()
{

  Serial.begin(115200);

#if defined(ARDUINO_RASPBERRY_PI_PICO_W)
  multi.addAP(WIFI_SSID, WIFI_PASSWORD);
  multi.run();
#else
  WiFi.begin(WIFI_SSID, WIFI_PASSWORD);
#endif

  Serial.print("Connecting to Wi-Fi");
  unsigned long ms = millis();
  while (WiFi.status() != WL_CONNECTED)
  {
    Serial.print(".");
    delay(300);
#if defined(ARDUINO_RASPBERRY_PI_PICO_W)
    if (millis() - ms > 10000)
      break;
#endif
  }
  Serial.println();
  Serial.print("Connected with IP: ");
  Serial.println(WiFi.localIP());
  Serial.println();

  Serial.printf("Firebase Client v%s\n\n", FIREBASE_CLIENT_VERSION);

  /* Assign the api key (required) */
  config.api_key = API_KEY;

  /* Assign the user sign in credentials */
  auth.user.email = USER_EMAIL;
  auth.user.password = USER_PASSWORD;

  /* Assign the RTDB URL (required) */
  config.database_url = DATABASE_URL;

  /* Assign the callback function for the long running token generation task */
  config.token_status_callback = tokenStatusCallback; // see addons/TokenHelper.h

  // The WiFi credentials are required for Pico W
  // due to it does not have reconnect feature.
#if defined(ARDUINO_RASPBERRY_PI_PICO_W)
  config.wifi.clearAP();
  config.wifi.addAP(WIFI_SSID, WIFI_PASSWORD);
#endif

  // Or use legacy authenticate method
  // config.database_url = DATABASE_URL;
  // config.signer.tokens.legacy_token = "<database secret>";

  // To connect without auth in Test Mode, see Authentications/TestMode/TestMode.ino

  //////////////////////////////////////////////////////////////////////////////////////////////
  // Please make sure the device free Heap is not lower than 80 k for ESP32 and 10 k for ESP8266,
  // otherwise the SSL connection will fail.
  //////////////////////////////////////////////////////////////////////////////////////////////

  Firebase.begin(&config, &auth);

  // Comment or pass false value when WiFi reconnection will control by your code or third party library
  Firebase.reconnectWiFi(true);

  Firebase.setDoubleDigits(5);

//----------------------------------------------------------------SET UP THE BME AND THE ADS1115 -----------------------------------------------------------------------------------------------------//



delay(500);
  Serial.println("=== Checking BME sensor ===");

  bool status;
  status = bme.begin(0x76);  
  if (!status) {
    Serial.println("Could not detect a BME280 sensor, Fix wiring Connections!");
    while (1);
  }
    Serial.println("=== BME SENSOR Passed ===");

Serial.println("=== Setting up ADS.....Preparing to Initialize ===");

  if (!ads.begin())
  {
    Serial.println("Failed to initialize ADS.");
    while (1);
  }
Serial.println("=== ADS is Initialized ===");
delay(500);

  
  // Set the digital pins as input
  pinMode(digitalPin1, INPUT);
  pinMode(digitalPin2, INPUT);












  /** Timeout options.

  //WiFi reconnect timeout (interval) in ms (10 sec - 5 min) when WiFi disconnected.
  config.timeout.wifiReconnect = 10 * 1000;

  //Socket connection and SSL handshake timeout in ms (1 sec - 1 min).
  config.timeout.socketConnection = 10 * 1000;

  //Server response read timeout in ms (1 sec - 1 min).
  config.timeout.serverResponse = 10 * 1000;

  //RTDB Stream keep-alive timeout in ms (20 sec - 2 min) when no server's keep-alive event data received.
  config.timeout.rtdbKeepAlive = 45 * 1000;

  //RTDB Stream reconnect timeout (interval) in ms (1 sec - 1 min) when RTDB Stream closed and want to resume.
  config.timeout.rtdbStreamReconnect = 1 * 1000;

  //RTDB Stream error notification timeout (interval) in ms (3 sec - 30 sec). It determines how often the readStream
  //will return false (error) when it called repeatedly in loop.
  config.timeout.rtdbStreamError = 3 * 1000;

  Note:
  The function that starting the new TCP session i.e. first time server connection or previous session was closed, the function won't exit until the
  time of config.timeout.socketConnection.

  You can also set the TCP data sending retry with
  config.tcp_data_sending_retry = 1;

  */
} // End SETUP

void loop()
{

  // Read the digital pin values
  int digitalValue1 = digitalRead(digitalPin1);
  int digitalValue2 = digitalRead(digitalPin2);



  // Read the analog pin value

  Serial.println("Reading DATA from ADS pins");
  delay(5000);
  Serial.println("Passed brief delay");
  int16_t adc0, adc1;
  Serial.println("Setup the readouts");
  adc0 = ads.readADC_SingleEnded(0); // Rain Sensor.
  delay(500);
  Serial.println("Read A0 successfully");
  adc1 = ads.readADC_SingleEnded(1); // Soil moisture sensor
  delay(500);
   Serial.println("Read A1 successfully");

  




//------------------------------------------------------------------------------------------ READ DATA FROM THE BME SENSOR -------------------------------------------------------------------------------------------//

float temperature = bme.readTemperature();
float pressure = bme.readPressure() / 100.0F ;
float altitude = bme.readAltitude(SEALEVELPRESSURE_HPA);
float humidity = bme.readHumidity();




// Print the values on the serial monitor
Serial.print("Digital Pin 1: ");
Serial.println(digitalValue1);  
Serial.print("Digital Pin 2: ");
Serial.println(digitalValue2);
Serial.print("Temperature = ");
Serial.print(temperature);
Serial.println(" ºC");
Serial.print("Pressure = ");
Serial.print(pressure);
Serial.println(" hPa");
Serial.print("Approx. Altitude = ");
Serial.print(altitude);
Serial.println(" m");
Serial.print("Humidity = ");
Serial.print(humidity);
Serial.println(" %");
Serial.print("Soil Moisture = ");
Serial.print(adc0);
Serial.println("");
Serial.print("Rain sensor = ");
Serial.print(adc1);
Serial.println("");
delay(1000); // Delay for 1 second before repeating the loop


// ----------------------------------------------------------------------------------------------SENDING DATA TO FIREBASE REALTIME DATABASE -----------------------------------------------------------------------------//  

  // Firebase.ready() should be called repeatedly to handle authentication tasks.

  if (Firebase.ready() && (millis() - sendDataPrevMillis > 15000 || sendDataPrevMillis == 0))
  {
    sendDataPrevMillis = millis();

    Serial.printf("Set Digital Pin Soil... %s\n", Firebase.setFloat(fbdo, F("/farmx_iot/digital_pin_soil_moisture"), digitalValue1) ? "ok" : fbdo.errorReason().c_str());

    Serial.printf("Get Digital Pin Soil... %s\n", Firebase.getFloat(fbdo, F("/farmx_iot/digital_pin_soil_moisture")) ? String(fbdo.to<float>()).c_str() : fbdo.errorReason().c_str());

    Serial.printf("Set Digital Rain Sensor... %s\n", Firebase.setDouble(fbdo, F("/farmx_iot/digital_pin_rain_sensor"), digitalValue2) ? "ok" : fbdo.errorReason().c_str());

    Serial.printf("Get Digital Rain Sensor... %s\n", Firebase.getDouble(fbdo, F("/farmx_iot/digital_pin_rain_sensor")) ? String(fbdo.to<double>()).c_str() : fbdo.errorReason().c_str());
 
    Serial.printf("Set Temperature... %s\n", Firebase.setFloat(fbdo, F("/farmx_iot/temperature"), temperature) ? "ok" : fbdo.errorReason().c_str());

    Serial.printf("Get Temperature... %s\n", Firebase.getFloat(fbdo, F("/farmx_iot/temperature")) ? String(fbdo.to<float>()).c_str() : fbdo.errorReason().c_str());

    Serial.printf("Set Humidity... %s\n", Firebase.setDouble(fbdo, F("/farmx_iot/humidity"), humidity) ? "ok" : fbdo.errorReason().c_str());

    Serial.printf("Get Humidity... %s\n", Firebase.getDouble(fbdo, F("/farmx_iot/humidity")) ? String(fbdo.to<double>()).c_str() : fbdo.errorReason().c_str());

    Serial.printf("Set Pressure... %s\n", Firebase.setFloat(fbdo, F("/farmx_iot/Pressure"), pressure) ? "ok" : fbdo.errorReason().c_str());

    Serial.printf("Get Pressure... %s\n", Firebase.getFloat(fbdo, F("/farmx_iot/Pressure")) ? String(fbdo.to<float>()).c_str() : fbdo.errorReason().c_str());

    Serial.printf("Set Altitude... %s\n", Firebase.setDouble(fbdo, F("/farmx_iot/Altitude"), altitude) ? "ok" : fbdo.errorReason().c_str());

    Serial.printf("Get Altitude... %s\n", Firebase.getDouble(fbdo, F("/farmx_iot/Altitude")) ? String(fbdo.to<double>()).c_str() : fbdo.errorReason().c_str());

    Serial.printf("Set SoilMoisture... %s\n", Firebase.setFloat(fbdo, F("/farmx_iot/SoilMoisture"), adc0) ? "ok" : fbdo.errorReason().c_str());

    Serial.printf("Get SoilMoisture... %s\n", Firebase.getFloat(fbdo, F("/farmx_iot/SoilMoisture")) ? String(fbdo.to<float>()).c_str() : fbdo.errorReason().c_str());

    Serial.printf("Set RainSensor... %s\n", Firebase.setDouble(fbdo, F("/farmx_iot/RainSensor"), adc1) ? "ok" : fbdo.errorReason().c_str());

    Serial.printf("Get RainSensor... %s\n", Firebase.getDouble(fbdo, F("/farmx_iot/RainSensor")) ? String(fbdo.to<double>()).c_str() : fbdo.errorReason().c_str());


    delay(5000);
//---------------------------------------------------------------------------------------------SENDING JSON TYPE DATA -----------------------------------------------------------------------------------------------------------//
    // For the usage of FirebaseJson, see examples/FirebaseJson/BasicUsage/Create_Parse_Edit.ino
    FirebaseJson json;

  //  if (count == 0)
  //  {
  //    json.set("value/round/" + String(count), F("cool!"));
  //    json.set(F("vaue/ts/.sv"), F("timestamp"));
   //   Serial.printf("Set json... %s\n", Firebase.set(fbdo, F("/farmx_iot/json"), json) ? "ok" : fbdo.errorReason().c_str());
  //  }
  //  else
  //  {
  //    json.add(String(count), "smart!");
  //    Serial.printf("Update node... %s\n", Firebase.updateNode(fbdo, F("/farmx_iot/json/value/round"), json) ? "ok" : fbdo.errorReason().c_str());
  //  }

    Serial.println();

    // For generic set/get functions.

    // For generic set, use Firebase.set(fbdo, <path>, <any variable or value>)

    // For generic get, use Firebase.get(fbdo, <path>).
    // And check its type with fbdo.dataType() or fbdo.dataTypeEnum() and
    // cast the value from it e.g. fbdo.to<int>(), fbdo.to<std::string>().

    // The function, fbdo.dataType() returns types String e.g. string, boolean,
    // int, float, double, json, array, blob, file and null.

    // The function, fbdo.dataTypeEnum() returns type enum (number) e.g. fb_esp_rtdb_data_type_null (1),
    // fb_esp_rtdb_data_type_integer, fb_esp_rtdb_data_type_float, fb_esp_rtdb_data_type_double,
    // fb_esp_rtdb_data_type_boolean, fb_esp_rtdb_data_type_string, fb_esp_rtdb_data_type_json,
    // fb_esp_rtdb_data_type_array, fb_esp_rtdb_data_type_blob, and fb_esp_rtdb_data_type_file (10)

    count++;
  }
}

/// PLEASE AVOID THIS ////

// Please avoid the following inappropriate and inefficient use cases
/**
 *
 * 1. Call get repeatedly inside the loop without the appropriate timing for execution provided e.g. millis() or conditional checking,
 * where delay should be avoided.
 *
 * Everytime get was called, the request header need to be sent to server which its size depends on the authentication method used,
 * and costs your data usage.
 *
 * Please use stream function instead for this use case.
 *
 * 2. Using the single FirebaseData object to call different type functions as above example without the appropriate
 * timing for execution provided in the loop i.e., repeatedly switching call between get and set functions.
 *
 * In addition to costs the data usage, the delay will be involved as the session needs to be closed and opened too often
 * due to the HTTP method (GET, PUT, POST, PATCH and DELETE) was changed in the incoming request.
 *
 *
 * Please reduce the use of swithing calls by store the multiple values to the JSON object and store it once on the database.
 *
 * Or calling continuously "set" or "setAsync" functions without "get" called in between, and calling get continuously without set
 * called in between.
 *
 * If you needed to call arbitrary "get" and "set" based on condition or event, use another FirebaseData object to avoid the session
 * closing and reopening.
 *
 * 3. Use of delay or hidden delay or blocking operation to wait for hardware ready in the third party sensor libraries, together with stream functions e.g. Firebase.RTDB.readStream and fbdo.streamAvailable in the loop.
 *
 * Please use non-blocking mode of sensor libraries (if available) or use millis instead of delay in your code.
 *
 * 4. Blocking the token generation process.
 *
 * Let the authentication token generation to run without blocking, the following code MUST BE AVOIDED.
 *
 * while (!Firebase.ready()) <---- Don't do this in while loop
 * {
 *     delay(1000);
 * }
 *
 */
