import 'dart:async';
import 'dart:html';

import 'package:fckng_portfolio/src/record_entity.dart';
import 'package:fckng_portfolio/src/data/article.dart';
import 'package:fckng_portfolio/src/data/project.dart';
import 'package:fckng_portfolio/src/data/talk.dart';

void main() {
  initRecords(talks, querySelector('#talks'));
  initRecords(articles, querySelector('#articles'));
  initRecords(projects, querySelector('#projects'));
}

Future initRecords(List<RecordEntity> entities, DivElement element) async {
  if (element == null) return;

  if (entities.isEmpty) {
    element.appendHtml('<p class="paragraph">Nothing has been added in the database yet.</p>');
  }

  entities
    ..sort((RecordEntity a, RecordEntity b) => -a.date.compareTo(b.date))
    ..forEach((RecordEntity entity) {
      element.appendHtml(entity.toString(), treeSanitizer: NodeTreeSanitizer.trusted);
    });
}
