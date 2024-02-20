import 'package:BolilerPlate/config/urls/global_configuration.dart';
import 'package:flutter/material.dart';



void setupEnvironnment(Environnement environnement) {
  GlobalConfiguration.environnement = environnement;
   if (environnement == Environnement.prod) {
     GlobalConfiguration.disableTestMode();
   }
}