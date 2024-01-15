import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodorder/data/dummy_data.dart';

final mealsProvider = Provider((ref) => dummyMeals);
