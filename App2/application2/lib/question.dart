class Question {
  String question;
  bool isCorrect;
  String imageURL;

  Question(this.question, this.isCorrect, this.imageURL) {}
}

class QuizzQuestion {
  static int questionNumber = 0;
  static List<Question> questionText = [
    Question('L’homme a plus de poils que la femme ?', false,
        'https://images.pexels.com/photos/842980/pexels-photo-842980.jpeg?cs=srgb&dl=pexels-craig-mckay-842980.jpg&fm=jpg'),
    Question('Le palmier est un arbre ?', false,
        'https://images.pexels.com/photos/5352673/pexels-photo-5352673.jpeg?cs=srgb&dl=pexels-nataliya-vaitkevich-5352673.jpg&fm=jpg'),
    Question('Il est impossible d’éternuer les yeux ouverts ?', true,
        'https://images.pexels.com/photos/906052/pexels-photo-906052.jpeg?cs=srgb&dl=pexels-noelle-otto-906052.jpg&fm=jpg'),
    Question(
        'Les taches blanches sur les ongles sont dues à un manque de calcium ?',
        false,
        'https://images.pexels.com/photos/704815/pexels-photo-704815.jpeg?cs=srgb&dl=pexels-kristina-paukshtite-704815.jpg&fm=jpg'),
    Question('Les chutes du Niagara peuvent geler, vrai ou faux ?', true,
        'https://images.pexels.com/photos/158398/niagara-falls-waterfall-horseshoe-158398.jpeg?cs=srgb&dl=pexels-pixabay-158398.jpg&fm=jpg'),
  ];

  static String getImage() {
    return questionText[questionNumber].imageURL;
  }

  static String getQuestion() {
    return questionText[questionNumber].question;
  }

  static bool getCorrectAnswer() {
    return questionText[questionNumber].isCorrect;
  }

  static bool isFinished() {
    if (questionNumber >= questionText.length - 1)
      return true;
    else
      return false;
  }

  static void nextQuestion() {
    if (questionNumber < questionText.length - 1) {
      questionNumber++;
    }
  }

  static void reset() {
    questionNumber = 0;
  }
}
