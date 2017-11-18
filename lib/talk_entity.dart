import 'package:intl/intl.dart';

class TalkEntity {
  final String name;
  final String link;

  final String eventName;
  final String eventLink;

  final DateTime date;
  final String language;

  TalkEntity({this.eventName, this.eventLink, this.name, this.link, this.date, this.language = 'cz'}) {
    if (name == null) throw new ArgumentError.notNull('name');
    if (date == null) throw new ArgumentError.notNull('date');
  }

  final _formatter = new DateFormat('d. M. yyyy');

  @override
  String toString() {
    String nameElement, eventElement;

    // link or simple text
    if (link != null) {
      nameElement = '<a class="talk__name link" href="${link}" target="_blank">${name ?? ''}</a>';
    } else {
      nameElement = '<span class="talk__name">${name ?? ''}</span>';
    }

    // link or simple text
    if (eventLink != null) {
      eventElement = '<a class="talk__event link" href="${eventLink}" target="_blank">${eventName ?? ''}</a>';
    } else {
      eventElement = '<span class="talk__event">${eventName ?? ''}</span>';
    }

    return '''
      <div class="talk">
        <div class="talk__primary">
          ${nameElement}
          ${eventElement}
        </div>
        <div class="talk__secondary">
          <div class="talk__date">${date != null ? _formatter.format(date) : ''}</div>
          <span class="talk__language">${language ?? ''}</span>
        </div>
      </div>
    ''';
  }
}
