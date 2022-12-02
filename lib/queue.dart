import 'package:dart_constructure/node.dart';

excuteQueue(){
  print('================QUEUE=============');
  var list = [1,2,3,4,5];
  var queue = QueueCustom<int>();
  
  for(final num in list){
    queue.push(num);
  }

  printQueue(queue);

  queue.remove();
  printQueue(queue);
  queue.remove();
  printQueue(queue);
  print('================END QUEUE===============');
}

printQueue(queue){
  print('-------QUEUE-------');
  var node = queue.last;
  print(node?.key);

  while(node?.prev != null){
    node = node?.prev;
    print(node?.key);
  }
  print('-------------------');
}

/** QUEUE CUSTOM */
class QueueCustom<T>{
  // Node<T>? first;
  Node<T>? last;

  push(T key){
    // check queue co node chua
    last ??= Node<T>();

    // neu queue rong
    if(last?.key == null){
      last?.key = key;
      return;
    }
    //neu queue ko rong, them node last
    else{
      var newNode = Node<T>();

      newNode.key = key;
      // newNode.next = Node<T>();
      last?.next = newNode;
      newNode.prev = last;
      last = newNode;
    }
  }

  remove(){
    pop(last);
  }

  pop(Node<T>? node){
    var tmp = node?.prev;

    if(tmp == null){
      print('TMP NULL');
      node = node?.next;
      return;
    }
    
    if(tmp.prev == null){
      node?.prev = null;
      return;
    }
    pop(node?.prev);
  }
}