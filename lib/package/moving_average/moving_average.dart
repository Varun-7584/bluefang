import 'dart:collection';
import 'dart:math';

// Note: this class is not being at the moment. we are just using the stats package to get all the values.
//
class MovingAverage {
  num size;
  num count = 0;
  num sum = 0;
  DoubleLinkedQueue<num> queue = DoubleLinkedQueue();
  MovingAverage(this.size);

  num next(int val) {
    count += 1;
    queue.add(val);
    final num tail = count > size ? queue.removeFirst() : 0;
    sum = sum - tail + val;
    return sum / min(size, count);
  }

  num getCurrAverage() {
    return sum / min(size, count);
  }
}
