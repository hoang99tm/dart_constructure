import 'package:dart_constructure/node.dart';
import 'package:dart_constructure/binary_search.dart';
import 'package:dart_constructure/sort.dart';

executeBinarySearch(){
  List list = [20,4,6,2,1,7,8,4,15,9,10,3,12];
  
  var rs = binarySearch(list, 15);
  print('Result: $rs');
}

binarySearch(List list, x){
  // var listSorted = bubbleSort(list);
  // var listSorted = insertionSort(list);
  var listSorted = selectionSort(list);

  var lowerBound = 0;
  var upperBound = listSorted.length - 1;

  var midIndex = (upperBound - lowerBound) ~/ 2;
  bool isSuccess = false;

  while(!isSuccess){
    if(upperBound < lowerBound) return;

    midIndex = lowerBound + (upperBound - lowerBound) ~/ 2;
    
    if(listSorted[midIndex] < x){
      lowerBound = midIndex + 1;
    } else if(listSorted[midIndex] > x){
      upperBound = midIndex - 1;
    } else if(listSorted[midIndex] == x){
      print('EQUAL');
      isSuccess = true;
      return midIndex;
    }
  }
}

