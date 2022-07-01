class Questions {
  final int id, answer;
  final String question;
  final List<String> options;

  Questions(
      {required this.id,
      required this.answer,
      required this.question,
      required this.options});
}

const List sample_data = [
  {
    "id": 1,
    "question": "Does Saumya Like Goa ? \n શું સૌમ્યાને ગોવા ગમે છે",
    "options": ['Yes', 'No'],
    "answer_index": 0,
  },
  {
    "id": 2,
    "question":
        "Which activity saumya Likes the most\n સૌમ્યાને કઈ પ્રવૃત્તિ સૌથી વધુ ગમે છે?",
    "options": ['Drawing', 'Dancing', 'Gaming', 'Watching TV ()'],
    "answer_index": 0,
  },
  {
    "id": 3,
    "question":
        "Who is saumya's faviorate person? \n સૌમ્યાની પ્રિય વ્યક્તિ કોણ છે?",
    "options": ['Kaka', 'Kaki', 'Motta Pappa', 'Mota Mummy'],
    "answer_index": 2,
  },
  {
    "id": 4,
    "question": "Which one of this is saumya's Faviorate Movie",
    "options": ['Jayeshbhai jordar', 'Kippos', 'The owl house', 'Peppa pig'],
    "answer_index": 0,
  },
  {
    "id": 5,
    "question": "Does saumya like to study ? \n શું સૌમ્યાને ભણવું ગમે છે?",
    "options": ['Yes', 'No'],
    "answer_index": 1,
  },
  {
    "id": 6,
    "question":
        "Does saumya like to Papaya ? \n શું સૌમ્યાને પપૈયું ખાવું ગમે છે?",
    "options": ['Yes', 'No'],
    "answer_index": 1,
  },
  {
    "id": 7,
    "question": "Does saumya like to Cat ? \n શું સૌમ્યાને બિલાડી ગમે છે?",
    "options": ['Yes', 'No'],
    "answer_index": 0,
  },
];
