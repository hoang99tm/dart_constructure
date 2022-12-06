import 'package:dart_constructure/node.dart';
import 'package:dart_constructure/binary_search.dart';
import 'package:dart_constructure/sort.dart';

executeLinearSearch(){
  List list = [20,4,6,2,1,7,8,4,15,9,10,3,12];
  
  var rs = binarySearch(list, 15);
  print('Result: $rs');
}

linearSearch(List list, x){
  // var listSorted = bubbleSort(list);
  // var listSorted = insertionSort(list);
  // var listSorted = selectionSort(list);

  for(var element in list){
    if(element == x){
      print('EQUAL');
      return list.indexOf(element);
    }
  }
}

