import 'package:BolilerPlate/config/urls/global_configuration.dart';



void setupEnvironnment(Environnement environnement) {
  GlobalConfiguration.environnement = environnement;
   if (environnement == Environnement.prod) {
     GlobalConfiguration.disableTestMode();
   }
}