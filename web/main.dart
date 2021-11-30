import 'dart:async';
import 'dart:html';

import 'package:portfolio/src/record_entity.dart';
import 'package:portfolio/src/data/article.dart';
import 'package:portfolio/src/data/project.dart';
import 'package:portfolio/src/data/talk.dart';

void main() {
  initRecords(talks, querySelector('#talks'));
  initRecords(articles, querySelector('#articles'));
  initRecords(projects, querySelector('#projects'));
}

Future initRecords(List<RecordEntity> entities, Element? element) async {
  if (element == null) return;

  if (entities.isEmpty) {
    element.appendHtml(
        '<p class="paragraph">Nothing has been added in the database yet.</p>');
  }

  entities
    ..sort((RecordEntity a, RecordEntity b) {
      if (a.date == null || b.date == null) {
        return 0;
      }

      return -a.date!.compareTo(b.date!);
    })
    ..forEach((RecordEntity entity) {
      element.appendHtml(entity.toString(),
          treeSanitizer: NodeTreeSanitizer.trusted);
    });
}
