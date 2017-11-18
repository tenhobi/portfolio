import 'package:intl/intl.dart';

class ArticleEntity {
  final String name;
  final String link;
  final String description;
  final DateTime date;
  final String language;

  ArticleEntity({this.name, this.link, this.description, this.date, this.language = 'cz'}) {
    if (name == null) throw new ArgumentError.notNull('name');
    if (date == null) throw new ArgumentError.notNull('date');
  }

  final _formatter = new DateFormat('d. M. yyyy');

  @override
  String toString() {
    String nameElement;

    // link or simple text
    if (link != null) {
      nameElement = '<a class="article__name link" href="${link}" target="_blank">${name ?? ''}</a>';
    } else {
      nameElement = '<span class="article__name article__name--todo">${name ?? ''}</span>';
    }

    return '''
      <div class="article">
        <div class="article__header">
          <div class="article__primary">
            ${nameElement}
          </div>
          <div class="article__secondary">
            <div class="article__date">${date != null ? _formatter.format(date) : ''}</div>
            <span class="article__language">${language ?? ''}</span>
          </div>
        </div>
        <div class="article__description">${description ?? ''}</div>
      </div>
    ''';
  }
}
