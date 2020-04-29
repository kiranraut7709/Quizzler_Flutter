import 'questions.dart';

class QuizBrain {
  int _questionNo = 0;
  List<Question> _questionBank = [
    Question('Some cats are actually allergic to humans', true),
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('A slug\'s blood is green.', true),
    Question('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
    Question('It is illegal to pee in the Ocean in Portugal.', true),
    Question(
        'No piece of square dry paper can be folded in half more than 7 times.',
        false),
    Question(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        true),
    Question(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
    Question(
        'The total surface area of two human lungs is approximately 70 square metres.',
        true),
    Question('Google was originally called \"Backrub\".', true),
    Question(
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        true),
    Question(
        'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        true),
  ];

//Create a getNextQuestion() method here that Increment questionNo by 1 to get next question
  void getNextQuestion() {
    if (_questionBank.length - 1 != _questionNo) {
      _questionNo++;
    }
  }

//Create a getQuestion() method here that returns the question
  String getQuestion() {
    return _questionBank[_questionNo].question;
  }

//Create a getAnswer() method here that returns the answer
  bool getAnswer() {
    return _questionBank[_questionNo].answer;
  }

//Here that checks to see if we have reached the last question. It should return (have an output)
// true if we've reached the last question and it should return false if we're not there yet.
  bool isFinished() {
    if (_questionBank.length - 1 == _questionNo) {
      return true;
    } else {
      return false;
    }
  }

//Create a reset() method here that sets the questionNumber back to 0.
  void reset() {
    _questionNo = 0;
  }
}
