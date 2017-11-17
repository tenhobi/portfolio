import 'dart:html';
import 'package:fckng_portfolio/project_entity.dart';
import 'package:fckng_portfolio/talk_entity.dart';

void main() {
  initTalks();
  initProjects();
}

void initTalks() {
  DivElement element = querySelector("#talks");

  List<TalkEntity> talks = [
    new TalkEntity(name: "Slyšeli jste někdy o Dartu?", date: new DateTime(2017, 9, 29), link: 'https://goo.gl/bTX3CB'),
  ];

  talks.sort((TalkEntity a, TalkEntity b) => -a.date.compareTo(b.date));

  talks.forEach((TalkEntity entity) {
    element.appendHtml(entity.toString(), treeSanitizer: NodeTreeSanitizer.trusted);
  });
}

void initProjects() {
  DivElement element = querySelector("#projects");

  List<ProjectEntity> projects = [
//    new ProjectEntity(
//      name: 'Project X',
//      description: 'About Project X...',
//    ),
  ];

  projects.forEach((ProjectEntity entity) {
    element.appendHtml(entity.toString(), treeSanitizer: NodeTreeSanitizer.trusted);
  });
}
