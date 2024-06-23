import 'package:url_launcher/url_launcher_string.dart';

bool isNullOrEmpty(dynamic value) {
  if (value == null) {
    return true;
  }

  if (value is String) {
    if (value.trim().isEmpty || value == 'null') {
      return true;
    }
  }

  return false;
}

void launchUrl(String url) async {
  if (await canLaunchUrlString(url)) {
    launchUrlString(url);
  }
}
