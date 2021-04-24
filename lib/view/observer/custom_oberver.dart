// MANAGER
typedef ListenerObserver<T> = void Function(T model);

abstract class Oberver<T> {
  Oberver(this.listen);

  void update(T data);
  final ListenerObserver<T> listen;
}

abstract class Subject<R extends Oberver> {
  List<R> get items;
  void attach(R observer);
  void deattach(R observer);

  void notifyObserver();
}

// MODEL
//
class CounterModel {
  String title;
  int data;
  CounterModel({required this.title, required this.data});
}

class Counter extends Oberver<CounterModel> {
  int count = 0;
  final ListenerObserver<CounterModel> listen;
  Counter(this.listen) : super(listen);
  @override
  void update(CounterModel data) {
    print(data);
    count++;
    listen(data);
  }
}

class CounterManager extends Subject<Counter> {
  @override
  List<Counter> items = [];

  int _count = 0;

  void updateCount(int count) {
    _count = count;
    notifyObserver();
  }

  void increment() {
    _count++;
    notifyObserver();
  }

  @override
  void attach(Counter observer) {
    items.add(observer);
  }

  @override
  void deattach(Counter observer) {
    items.remove(observer);
  }

  @override
  void notifyObserver() {
    items.forEach((element) {
      element.update(CounterModel(title: 'vb', data: _count));
    });
  }
}
