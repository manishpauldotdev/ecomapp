import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../infrastructure/hive_database.dart';

final hiveProvider = Provider((ref) => HiveDatabase());
