import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../models/serviceprovider_model.dart';

List<ServiceProvider> mockServiceProviders = [
  ServiceProvider(
    fullName: "Tamirat Tola",
    email: "provider1@example.com",
    phone: "+251911223344",
    serviceType: "Plumber",
    location: const LatLng(9.0207, 38.7597), // Bole, Addis Ababa
    locationDescription: "Bole, Addis Ababa",
    distance: "2 km",
    status: "Online", walletBalance: 0,
  ),
  ServiceProvider(
    fullName: "Kidiane Beyene",
    email: "provider2@example.com",
    phone: "+251922334455",
    serviceType: "Electrician",
    location: const LatLng(9.0054, 38.7069), // Megenagna, Addis Ababa
    locationDescription: "Megenagna, Addis Ababa",
    distance: "5 km",
    status: "Offline", walletBalance: 0,
  ),
  ServiceProvider(
    fullName: "Beza Seyum",
    email: "provider3@example.com",
    phone: "+251933445566",
    serviceType: "Carpenter",
    location: const LatLng(9.0391, 38.7872), // Gerji, Addis Ababa
    locationDescription: "Gerji, Addis Ababa",
    distance: "3 km",
    status: "Online", walletBalance: 0,
  ),
  ServiceProvider(
    fullName: "Mulugeta Abebe",
    email: "provider4@example.com",
    phone: "+251944556677",
    serviceType: "Painter",
    location: const LatLng(9.0325, 38.7439), // Kazanchis, Addis Ababa
    locationDescription: "Kazanchis, Addis Ababa",
    distance: "4 km",
    status: "Online", walletBalance: 0,
  ),
  ServiceProvider(
    fullName: "Hana Solomon",
    email: "provider5@example.com",
    phone: "+251955667788",
    serviceType: "Gardener",
    location: const LatLng(9.0162, 38.7710), // CMC, Addis Ababa
    locationDescription: "CMC, Addis Ababa",
    distance: "6 km",
    status: "Offline", walletBalance: 0,
  ),
  ServiceProvider(
    fullName: "Girma Bekele",
    email: "provider6@example.com",
    phone: "+251966778899",
    serviceType: "Cleaner",
    location: const LatLng(9.0123, 38.7567), // Arat Kilo, Addis Ababa
    locationDescription: "Arat Kilo, Addis Ababa",
    distance: "1 km",
    status: "Online", walletBalance: 0,
  ),
  ServiceProvider(
    fullName: "Selamawit Yirga",
    email: "provider7@example.com",
    phone: "+251977889900",
    serviceType: "Chef",
    location: const LatLng(9.0351, 38.7387), // Bole Medhanealem, Addis Ababa
    locationDescription: "Bole Medhanealem, Addis Ababa",
    distance: "7 km",
    status: "Online", walletBalance: 0,
  ),
  ServiceProvider(
    fullName: "Lydia Demissie",
    email: "provider8@example.com",
    phone: "+251988990011",
    serviceType: "Mechanic",
    location: const LatLng(9.0289, 38.7575), // Addis Ketema, Addis Ababa
    locationDescription: "Addis Ketema, Addis Ababa",
    distance: "2.5 km",
    status: "Offline", walletBalance: 0,
  ),
  ServiceProvider(
    fullName: "Samuel Tesfaye",
    email: "provider9@example.com",
    phone: "+251999001122",
    serviceType: "Tailor",
    location: const LatLng(9.0234, 38.7599), // Sidist Kilo, Addis Ababa
    locationDescription: "Sidist Kilo, Addis Ababa",
    distance: "3.5 km",
    status: "Online", walletBalance: 0,
  ),
  ServiceProvider(
    fullName: "Meron Assefa",
    email: "provider10@example.com",
    phone: "+251910011223",
    serviceType: "Hairdresser",
    location: const LatLng(9.0423, 38.7624), // Bole Airport, Addis Ababa
    locationDescription: "Bole Airport, Addis Ababa",
    distance: "5 km",
    status: "Online", walletBalance: 0,
  ),
  ServiceProvider(
    fullName: "Dawit Alemayehu",
    email: "provider11@example.com",
    phone: "+251921122334",
    serviceType: "Tutor",
    location: const LatLng(9.0124, 38.7256), // Kality, Addis Ababa
    locationDescription: "Kality, Addis Ababa",
    distance: "8 km",
    status: "Offline", walletBalance: 0,
  ),
  ServiceProvider(
    fullName: "Aisha Mohammed",
    email: "provider12@example.com",
    phone: "+251932233445",
    serviceType: "Driver",
    location: const LatLng(9.0187, 38.7463), // Kolfe Keranio, Addis Ababa
    locationDescription: "Kolfe Keranio, Addis Ababa",
    distance: "4 km",
    status: "Online", walletBalance: 0,
  ),
];
