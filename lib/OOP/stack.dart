import 'node.dart';

excuteStack(){
  print('================STACK===============');
  var stack = StackCustom<int>();
  var list = [1,2,3,4,5,6,7,8,9];
  
  for(final num in list){
    stack.push(num);
  }
  
  printStack(stack);
  
  print('\nELEMENT POP OUT STACK: ');
  // for(var i = 0; i< list.length; i++){
  //   var itemPop = stack.pop();
  //   print('Pop item $i: $itemPop');
  // }
  stack.removeAll();
  printStack(stack);

  print('================END STACK===============');
}

printStack(stack){
  print('-------STACK-------');
  var top = stack.top;
  print(top?.key);

  while(top?.prev != null){
    top = top?.prev;
    print(top?.key);
  }
  print('-------------------');
}

class StackCustom<T>{
  StackCustom();

  NodeStack<T>? top;

  push(T key){
    top ??= NodeStack<T>();
    
    if(top?.key == null){
      top?.key = key;
      return;
    }else{
      var newNode = NodeStack<T>();
      newNode.key = key;
      newNode.prev = top;
      top = newNode;
    }
  }

  removeAll(){
    pop(top);
  }
  
  pop(NodeStack<T>? node){
    if(top == null) return;

    if(top?.key == null) return;

    top = node?.prev;
      
    pop(node?.prev);
  }

  // popAll(){
  //   dynamic popItem;
  //   if(top == null) return;

  //   if(top?.key == null) return;

  //   popItem = top?.key;

  //   if(top?.prev != null){
  //     top = top?.prev;
  //   }else{
  //     top = null;
  //   }

  //   print('PopItem: $popItem');
    
  //   popAll();
  // }
}

