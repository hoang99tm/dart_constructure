List bubbleSort(list){
  for(int i = 0; i < list.length - 1; i++){
    bool swapped = false;
    for(int j = 0; j< list.length - 1; j++){
      if(list[j] == null || (list[j + 1] != null && list[j] > list[j+1])){
        var temp = list[j]; 
        list[j] = list[j + 1];
        list[j + 1] = temp;
        swapped = true;
      }
    }
    if(!swapped) break;
  }
  return list;
}

List insertionSort(list){
  var holePosition;
  var valueToInsert;

  for(var i = 0; i< list.length; i++){
    valueToInsert = list[i];
    holePosition = i;

    while (holePosition > 0 && list[holePosition - 1] > valueToInsert){
      list[holePosition] = list[holePosition - 1];
      holePosition = holePosition - 1;
    }

    list[holePosition] = valueToInsert;
  }
  print('List sorted: $list');
  return list;
}

List selectionSort(list){
  for(var i = 0; i < list.length - 1; i++){
    var min = i;
    for(var j = i + 1; j < list.length; j++){
      if(list[min] > list[j]){
        min = j;
      }
    }
    if(min != i){
      var temp = list[min]; 
      list[min] = list[i];
      list[i] = temp;
      // swap(list[min], list[i]);
    }
  }
  return list;
}

partitionFunction(list, left, right, privot){
  var leftPointer = left - 1;
}

// Hieu qua tap dl lon ma do phuc tap trung binh vaf TH xau nhat laf O(nlogn)
List quickSort(list){
  

  return list;
}

int compareOnDart(a, b){
  if(a == null){
    return 1;
  }else if ( b == null){
    return -1;
  }else if( a > b){
    return -1;
  }else if( a < b){
    return -1;
  }else{
    return 0;
  }
}

class CustomSort<T>{
  
  mergeSort(list){
    if(list.length == 1) return list;

    var l = <T>[];
    var r = <T>[];

    for(int i =0; i< list.length ~/ 2; i++){
      l.add(list[i]);
    }

    for(int i = list.length ~/ 2; i< list.length; i++){
      r.add(list[i]);
    }

    l = mergeSort(l);
    r = mergeSort(r);

    return merge(l, r);
  }

  merge(l, r){
    var list = [];
    
    while(l.length > 0 && r.length > 0){
      if(compare(l[0], r[0]) <= 0){
        list.add(l[0]);
        l.remove(l[0]);
      }else{
        list.add(r[0]);
        r.remove(r[0]);
      }
    }

    while(l.length > 0){
      list.add(l[0]);
      l.remove(l[0]);
    }

    while(r.length > 0){
      list.add(r[0]);
      r.remove(r[0]);
    }
    return list;
  }

  compare([a, b]){
    if(a == null){
      return 1;
    }
    if(b == null){
      return -1;
    }
    if(a > b){
      return 1;
    }else{
      return -1;
    }
  }
}