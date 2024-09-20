import 'package:news_app/core/utilities/functions/show_snack_bar.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchCustomUrl(context, String? url) async {
  if (url != null) {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  } else {
    showSnackBar(context, 'Error opening the webpage!\nTry again later.');
  }
}
