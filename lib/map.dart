import 'dart:collection';

void executeMap(){
  print('===========MAP============');

  var map = MapCustom<String, dynamic>();

  print('Add entries:');
  map.addEntries('1', 'Hoang');
  map.addEntries('2', 'Test 2');
  map.addEntries('3', 'Test 3');
  map.addEntries('4', 'Test 4');
  map.addEntries('5', 'Test 5');
  map.toString();

  print('Remove entry with key = 1');
  map.removeEntries('5');
  map.toString();

  print('===========END MAP============');
}

class Entry<K, V>{
  K? key;
  V? value;
  Entry<K, V>? next;
  Entry<K, V>? prev;
}

class MapCustom<K, V>{
  Entry<K, V>? entries;

  List<String> getKeys(){
    var keys = <String>[];
    Entry<K, V>? element = entries;
    // for(Entry<K, V>? element = entries; element != null; element.prev){
    //   print("Key: ${element.key}");
    //   keys.add(element.key.toString());
    // }

    while(element != null){
      keys.add(element.key.toString());
      element = element.prev;
    }

    return keys;
  }

  addEntries(K key, V value){
    if(getKeys().contains(key)){
      print('Key da ton tai');
      return;
    }

    entries ??= Entry<K, V>();

    if(isEmpty()){
      entries?.key = key;
      entries?.value = value;
      entries?.prev = null;
      return;
    }else{
      var newEntry = Entry<K, V>();
      // set props for [newEntry]
      newEntry.key = key;
      newEntry.value = value;
      newEntry.prev = entries;
      entries?.next = newEntry;

      // assign last entry for [newEntry] 
      entries = newEntry;
    }
  }

  removeEntries(K key){
    if(!getKeys().contains(key)){
      print('Khong ton tai object');
      return;
    }

    entries ??= Entry<K, V>();

    Entry<K, V>? tmp;

    if(isEmpty()) return;

    for(Entry<K, V>? element = entries; element != null; element = element.prev){

      if(key.toString() == element.key.toString()){
        // node dau 
        if(element.prev == null){
          element = element.next;
          element?.prev = null;
        }
        // node cuoi 
        else if(element.next == null){
          entries = entries?.prev;
        }
        // node giua
        else{
          tmp?.next = element.next; 
          element.prev?.next = tmp;
          element.next?.prev = element.prev;
        }
        return;
      }
      tmp = element;
    }
    toString();
  }

  isEmpty(){
    if(entries?.key == null){
      return true;
    }else{
      return false;
    }
  }

  String toString() {
    String c = '';
    Entry<K, V>? element = entries;
    while(element != null){
      String isFirst = element.prev == null ? '' : ', ';
      c += '${element.key} : ${element.value}$isFirst';
      element = element.prev;
    }
    
    c = '{ $c } \n';

    print(c);

    return c;
  }
}

