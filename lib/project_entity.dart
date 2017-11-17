class ProjectEntity {
  final String name;
  final String description;
  final String link;
  final String imageUrl; // TODO

  ProjectEntity({this.name, this.description, this.link, this.imageUrl});

  @override
  String toString() {
    String nameElement;

    if (link != null) {
      nameElement = '<a class="project__name link" href="${link}" target="_blank">${name ?? ''}</a>';
    } else {
      nameElement = '<span class="project__name">${name ?? ''}</span>';
    }

    return '''
      <div class="project">
        ${nameElement}
        <p class="project__description">${description ?? ''}</p>
      </div>
    ''';
  }
}
