import 'package:movieapp/features2/data/models/objectboxmovie_model.dart';
import 'package:movieapp/objectbox.g.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class MovieObjectBox {
  static MovieObjectBox? _instance;
  final Store store;
  late final Box<MovieModelEntity> movieBox;
  MovieObjectBox._create(this.store) {
    movieBox = store.box<MovieModelEntity>();
  }
  static MovieObjectBox get instance {
    return _instance!;
  }

  static Future<void> create() async {
    if (_instance == null) {
      final docsDir = await getApplicationCacheDirectory();
      final store = await openStore(directory: join(docsDir.path, 'movie'));
      _instance = MovieObjectBox._create(store);
    }
  }
}
