
//Equation to get rise in ocean level is 2^(years/29)/2


import 'dart:math';

class OceanLevelUtils {

  static int getLevel(int a){
    return pow(2, (a/29))*0.5;
  }

}