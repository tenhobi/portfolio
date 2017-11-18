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

  List<ArticleEntity> articles = [
    new ArticleEntity(
      name: 'Základy jQuery',
      link: 'https://www.itnetwork.cz/javascript/jquery-zaklady',
      description: 'Series of articles on basics of jQuery.',
      date: new DateTime(2014, 11, 11),
    ),
    new ArticleEntity(
      name: 'Moderní a profesionální webové portfolio',
      link: 'https://www.itnetwork.cz/html-css/webove-portfolio',
      description: 'Series of articles on how to make modern portfolio.',
      date: new DateTime(2014, 12, 21),
    ),
    new ArticleEntity(
      name: 'Responzivní webdesign',
      link: 'https://www.itnetwork.cz/html-css/responzivni-webdesign',
      description: 'Series of articles on responsive design.',
      date: new DateTime(2015, 4, 21),
    ),
    new ArticleEntity(
      name: 'Technologie pro vývoj webových aplikací',
      link: 'https://www.itnetwork.cz/html-css/webove-aplikace',
      description: 'Series of articles as web export of my highschool semi-thesis about web technologies.',
      date: new DateTime(2015, 5, 29),
    ),
    new ArticleEntity(
      name: 'Hotová řešení v Javascriptu',
      link: 'https://www.itnetwork.cz/javascript/jquery-hotova-reseni',
      description: 'Series of articles on ready-made jQuery solutions.',
      date: new DateTime(2016, 1, 25),
    ),
    new ArticleEntity(
      name: 'Základní konstrukce jazyka Dart',
      date: new DateTime(2017, 12, 24),
    ),
    new ArticleEntity(
      name: 'Objektově orientované programování v Dart',
      date: new DateTime(2017, 12, 25),
    ),
    new ArticleEntity(
      name: 'AngularDart',
      date: new DateTime(2018, 2, 1),
    ),
    new ArticleEntity(
      name: 'Flutter',
      date: new DateTime(2018, 4, 1),
    ),
  ];

  articles.sort((ArticleEntity a, ArticleEntity b) => -a.date.compareTo(b.date));

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
