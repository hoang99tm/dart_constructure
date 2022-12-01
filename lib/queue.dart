import 'package:dart_constructure/node.dart';

excuteQueue(){
  print('================QUEUE=============');
  var list = [1,2,3,4,5];
  var queue = QueueCustom<int>();
  
  for(final num in list){
    queue.push(num);
  }

  printQueue(queue);

  for(final num in list){
    var dequeue = queue.pop();
    print('DEQUEUE $num: $dequeue');
  }
  print('================END QUEUE===============');
}

printQueue(queue){
  print('-------QUEUE-------');
  var node = queue.first;
  print(node?.key);

  while(node?.next != null){
    node = node?.next;
    print(node?.key);
  }
  print('-------------------');
}

class QueueCustom<T>{
  Node<T>? first;
  Node<T>? last;

  push(T key){
    // check queue co node chua
    first ??= Node<T>();

    // neu queue rong
    if(first?.key == null){
      first?.key = key;
      last = first;
      return;
    }
    //neu queue ko rong, them node last
    else{
      var newNode = Node<T>();

      newNode.key = key;
      // newNode.next = Node<T>();
      last?.next = newNode;
      last = newNode;
    }
  }

  pop(){
    dynamic dequeueItem;

    if(first == null) return;
    
    if(first?.key != null){
      dequeueItem = first?.key;
    }else{
      return;
    }

    if(first?.next != null){
      first = first?.next;
    }else{
      first = null;
    }

    return dequeueItem;
  }
}