import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/presentation/providers/provider_utils.dart';
part 'random_index.g.dart';

/// random color provider
@Riverpod(keepAlive: true)
class RandomIndex extends _$RandomIndex  with NotifierUpdate {
  @override
  int build() => 0;

 // update(int newState) => state = newState;
 //I have custome this method in class NotifierUpdate to use it in all classes of genertion by use with to this class only
}
