import 'dart:html';
import 'package:fckng_portfolio/article_entity.dart';
import 'package:fckng_portfolio/project_entity.dart';
import 'package:fckng_portfolio/talk_entity.dart';

void main() {
  initTalks();
  initArticles();
  initProjects();
}

void initTalks() {
  DivElement element = querySelector("#talks");

  List<TalkEntity> talks = [
    new TalkEntity(
      name: "Budoucí přítomnost v CSS: grid a proměnné",
      eventName: 'Přednáškový sraz ITnetwork',
      eventLink: 'https://www.itnetwork.cz/nezarazene/prednaskovy-sraz-itnetwork/detail/153',
      date: new DateTime(2018, 1, 26),
    ),
    new TalkEntity(
      name: "Slyšeli jste někdy o Dartu?",
      link: 'https://goo.gl/bTX3CB',
      eventName: 'Přednáškový sraz ITnetwork',
      eventLink: 'https://www.itnetwork.cz/nezarazene/prednaskovy-sraz-itnetwork/detail/110',
      date: new DateTime(2017, 9, 29),
    ),
  ];

  talks.sort((TalkEntity a, TalkEntity b) => -a.date.compareTo(b.date));

  talks.forEach((TalkEntity entity) {
    element.appendHtml(entity.toString(), treeSanitizer: NodeTreeSanitizer.trusted);
  });
}

void initArticles() {
  DivElement element = querySelector("#articles");

  List<ArticleEntity> articles = [];

  if (articles.isEmpty) {
    element?.appendHtml('<p class="paragraph">Nothing in the database yet.</p>');
    return;
  }

  articles.forEach((ArticleEntity entity) {
    element.appendHtml(entity.toString(), treeSanitizer: NodeTreeSanitizer.trusted);
  });
}

void initProjects() {
  DivElement element = querySelector("#projects");

  List<ProjectEntity> projects = [];

  if (projects.isEmpty) {
    element?.appendHtml('<p class="paragraph">Nothing in the database yet.</p>');
    return;
  }

  projects.forEach((ProjectEntity entity) {
    element.appendHtml(entity.toString(), treeSanitizer: NodeTreeSanitizer.trusted);
  });
}
