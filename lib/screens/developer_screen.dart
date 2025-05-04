import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/foundation.dart'; 
class DeveloperScreen extends StatelessWidget {
  final String articleUrl =
      'https://ru.wikipedia.org/wiki/%D0%92%D0%BB%D0%B0%D0%B6%D0%BD%D0%BE%D1%81%D1%82%D1%8C';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Про меня')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Имя: Ошлаков Данил', style: TextStyle(fontSize: 20)),
            Text('Группа: ИВТ-22', style: TextStyle(fontSize: 16)),
            Text('Электронная почта: Почту я не дам.',
                style: TextStyle(fontSize: 16)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final uri = Uri.parse(articleUrl);
                try {
                  if (await canLaunchUrl(uri)) {
                    await launchUrl(
                      uri,
                      mode: LaunchMode.externalApplication, // Открывать в браузере
                    );
                    if (kDebugMode) {
                      debugPrint('Successfully launched URL: $articleUrl');
                    }
                  } else {
                    if (kDebugMode) {
                      debugPrint('Cannot launch URL: $articleUrl');
                    }
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Ссылка не поддерживается, увы')),
                    );
                  }
                } catch (e) {
                  if (kDebugMode) {
                    debugPrint('Error launching URL: $e');
                  }
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Что-то не так: $e')),
                  );
                }
              },
              child: Text('Статейка'),
            ),
          ],
        ),
      ),
    );
  }
}