enum SubjectEnum {
  English,
  ComputerScience,
  Science,
  GeneralKnowledge,
  SocialScience
}

extension SubjectEnumExtension on SubjectEnum {
  String get name {
    switch (this) {
      case SubjectEnum.English:
        return 'Eng';
      case SubjectEnum.ComputerScience:
        return 'CS';
      case SubjectEnum.Science:
        return 'Sci';
      case SubjectEnum.GeneralKnowledge:
        return 'GK';
      case SubjectEnum.SocialScience:
        return 'So.Sci';
      default:
        return '';
    }
  }

  String get fullName {
    switch (this) {
      case SubjectEnum.English:
        return 'English';
      case SubjectEnum.ComputerScience:
        return 'Computer Science';
      case SubjectEnum.Science:
        return 'Science';
      case SubjectEnum.GeneralKnowledge:
        return 'General Knowledge';
      case SubjectEnum.SocialScience:
        return 'Social Science';
      default:
        return '';
    }
  }
}
