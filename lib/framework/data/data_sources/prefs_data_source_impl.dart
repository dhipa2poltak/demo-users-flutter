
import 'package:demo_users/data/constants.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/data_sources/prefs_data_source.dart';

@lazySingleton
class PrefsDataSourceImpl extends PrefsDataSource {

  PrefsDataSourceImpl(this.prefs);

  final SharedPreferences prefs;

  @override
  bool hasShowedOnBoarding() {
    return prefs.getBool(Constants.KEY_PREF_HAS_SHOWED_ON_BOARDING) ?? false;
  }

  @override
  bool setHasShowedOnBoarding(bool hasShowedOnBoarding) {
    prefs.setBool(Constants.KEY_PREF_HAS_SHOWED_ON_BOARDING, hasShowedOnBoarding);

    return hasShowedOnBoarding;
  }
}
