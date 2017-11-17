import 'package:intl/intl.dart';

class TalkEntity {
  final String name;
  final String link;
  final DateTime date;
  final String language;

  TalkEntity({this.name, this.link, this.date, this.language = 'cz'}) {
    if (date == null) throw new ArgumentError.notNull();
  }

  final _formatter = new DateFormat('d. M. yyyy');

  @override
  String toString() {
    String nameElement;

    if (link != null) {
      nameElement = '<a class="talk__name link" href="${link}" target="_blank">${name ?? ''}</a>';
    } else {
      nameElement = '<span class="talk__name">${name ?? ''}</span>';
    }

    return '''
      <div class="talk">
        <div class="talk__left">
          ${nameElement}
          <span class="talk__language">${language.toLowerCase() ?? ''}</span>
        </div>
        <div class="talk__date">${date != null ? _formatter.format(date) : ''}</div>
      </div>
    ''';
  }
}
