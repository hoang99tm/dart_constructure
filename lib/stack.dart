import 'package:dart_constructure/node.dart';

excuteStack(){
  print('================STACK===============');
  var stack = StackCustom<int>(5);
  var list = [1,2,3,4,5,6,7,8,9];
  
  for(final num in list){
    stack.push(num);
  }
  
  printStack(stack);
  
  print('\nELEMENT POP OUT STACK: ');
  for(var i = 0; i< list.length; i++){
    var itemPop = stack.pop();
    print('Pop item $i: $itemPop');
  }


  print('================END STACK===============');
}

printStack(stack){
  print('-------STACK-------');
  var top = stack.top;
  print(top?.key);

  while(top?.next != null){
    top = top?.next;
    print(top?.key);
  }
  print('-------------------');
}

class StackCustom<T>{
  final int size;
  StackCustom(this.size);

  Node<T>? top;

  isFull(){
    
  }
  
  push(T key){
    top ??= Node<T>();
    
    if(top?.key == null){
      top?.key = key;
      return;
    }else{
      var newNode = Node<T>();
      newNode.key = key;
      newNode.next = top;
      top = newNode;
    }
  }
  
  pop(){
    dynamic popItem;
    if(top == null) return;
    
    if(top?.key != null) {
      popItem = top?.key;
    }else{
      return;
    } 

    if(top?.next != null){
      top = top?.next;
    }else{
      top = null;
    }
    return popItem;
  }
}

