import 'package:intl/intl.dart';

class RecordEntity {
  final String title;
  final String titleLink;
  final String subtitle;
  final String subtitleLink;
  final String description;
  final DateTime date;
  final String language;

  final DateFormat _formatter = new DateFormat('d. M. yyyy');

  RecordEntity({
    this.title,
    this.titleLink,
    this.subtitle,
    this.subtitleLink,
    this.description,
    this.date,
    this.language,
  }) {
    if (title == null) throw new ArgumentError.notNull('title');
  }

  RecordEntity.fromMap(Map map)
      : this(
          title: map['title'],
          titleLink: map['titleLink'],
          subtitle: map['subtitle'],
          subtitleLink: map['subtitleLink'],
          description: map['description'],
          date: DateTime.parse(map['date'] ?? ''),
          language: map['language'],
        );

  @override
  String toString() {
    String titleElement = '', subtitleElement = '', descriptionElement = '';

    bool planned = date?.isAfter(new DateTime.now()) ?? false;

    // link or simple text
    if (titleLink != null) {
      titleElement =
          '''<a class="record__title link" href="${titleLink}" target="_blank">
            ${title ?? ''}</a>
          ''';
    } else {
      titleElement =
          '''<span class="record__title ${planned ? 'record__title--todo' : ''}">
            ${title ?? ''}
          </span>''';
    }

    // link or simple text
    if (subtitle != null) {
      subtitleElement =
          '''<a class="record__event link" href="${subtitleLink}" target="_blank">
            ${subtitle ?? ''}
           </a>''';
    } else {
      subtitleElement = '<span class="record__event">${subtitle ?? ''}</span>';
    }

    // link or simple text
    if (description != null) {
      descriptionElement = '<p class="record__description">${description}</p>';
    }

    return '''
      <div class="record">
        <div class="record__header">
          <div class="record__primary">
            ${titleElement}
            ${subtitleElement}
          </div>
          <div class="record__secondary">
            <div class="record__date">
              ${date != null ? _formatter.format(date) : ''}
            </div>
            <span class="record__language">${language ?? ''}</span>
          </div>
        </div>
        ${descriptionElement}
      </div>
    ''';
  }
}
