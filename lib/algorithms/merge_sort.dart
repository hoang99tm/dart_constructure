
import 'package:dart_constructure/algorithms/sort.dart';

executeMergeSort(){
  var list = [20, 43, 12, 54, 32, 1, 6, 19, 32];

  CustomSort cs = CustomSort();
  var rs = cs.mergeSort(list);
  print('List sorted on execute: $rs'); 

  var index = fibSearch(rs, 54);
  print('INDEX: $index');
}

getMin(a, b){
  var c = (a <= b) ? a : b;
  return c; 
}

fibSearch(list, x){
  int size = list.length;
  var f2 = 0, f1 = 1, f = f1 + f2;
  var offset = -1;

  while(f < size){
    f2 = f1;
    f1 = f; 
    f = f1 + f2;
  }

  while(f2 >= 0 ){
    var i = getMin(offset + f2, size - 1);
    if(list[i] < x){
      f = f1;
      f1 = f2;
      f2 = f - f1;
      offset = i;
    }else if (list[i] > x){
      f = f2;
      f1 = f1 - f2;
      f2 = f - f1;
    } else {
      return i;
    }
  }
  if(f1 == x && list[offset + 1] == x){
    return offset + 1;
  }
  return -1;
}