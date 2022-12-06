import 'package:dart_constructure/sort.dart';

executeInterpolationSearch(){
  List list = [20,4,6,2,1,7,8,4,15,9,10,3,12];
  
  var rs = interpolationSearch(list, 15);
  print('Result: $rs');
}

interpolationSearch(list, x){
  var listSorted = selectionSort(list);

  var lowerBound = 0;
  var upperBound = listSorted.length - 1;

  var midIndex = upperBound + ((upperBound - lowerBound)/(list[upperBound] - list[lowerBound])) * (x - list[lowerBound]);
  bool isSuccess = false;

  while(!isSuccess){
    if(upperBound < lowerBound) return;

    midIndex = lowerBound + ((upperBound - lowerBound)/(list[upperBound] - list[lowerBound])) * (x - list[lowerBound]);
    
    var s = midIndex.toInt();
    if(listSorted[s] < x){
      lowerBound = s + 1;
    } else if(listSorted[s] > x){
      upperBound = s - 1;
    } else if(listSorted[s] == x){
      print('EQUAL');
      isSuccess = true;
      return midIndex;
    }
  }
}