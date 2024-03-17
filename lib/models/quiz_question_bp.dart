class QuestionBP {
  final String question;
  final List<String> answers;
  const QuestionBP(this.question, this.answers);
  List<String> shuffleAns() {
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}
