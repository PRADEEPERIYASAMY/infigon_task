
enum SubjectEnum {
  English,
  ComputerScience,
  Science,
  GeneralKnowledge,
  SocialScience
}

extension SubjectEnumExtension on SubjectEnum{
  String get name {
    switch (this){
      case SubjectEnum.English: return 'Eng';
      case SubjectEnum.ComputerScience: return 'CS';
      case SubjectEnum.Science: return 'Sci';
      case SubjectEnum.GeneralKnowledge: return 'GK';
      case SubjectEnum.SocialScience: return 'So.Sci';
      default: return '';
    }
  }
}
