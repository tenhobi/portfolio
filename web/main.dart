import 'dart:async';
import 'dart:html';

import 'package:fckng_portfolio/src/record_entity.dart';
import 'package:firebase/firebase.dart' as fb;

void main() {
  fb.initializeApp(
    apiKey: "AIzaSyBF5SuAklwamnRoSoVak-KmNUTEOe9CaWs",
    authDomain: "portfolio-348b6.firebaseapp.com",
    databaseURL: "https://portfolio-348b6.firebaseio.com",
    storageBucket: "portfolio-348b6.appspot.com");

  fb.Database database = fb.database();

  initRecords(database.ref("talks"), '#talks');
  initRecords(database.ref("articles"), '#articles');
  initRecords(database.ref("projects"), '#projects');
}

Future initRecords(fb.DatabaseReference ref, String selector) async {
  DivElement element = querySelector(selector);

  if (element == null) return;

  List<RecordEntity> entities = [];

  fb.QueryEvent qe = await ref.once('value');

  (qe?.snapshot?.val() as Map)?.forEach((String key, Map value) {
    try {
      entities.add(new RecordEntity.fromMap(value));
    } catch(e) {}
  });

  if (entities.isEmpty) {
    element.appendHtml('<p class="paragraph">Nothing in the database yet.</p>');
  }

  entities.sort((RecordEntity a, RecordEntity b) => -a.date.compareTo(b.date));

  entities.forEach((RecordEntity entity) {
    element.appendHtml(entity.toString(), treeSanitizer: NodeTreeSanitizer.trusted);
  });
}
