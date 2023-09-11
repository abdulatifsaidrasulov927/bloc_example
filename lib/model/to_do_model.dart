class TODOModel {
  // the property below is used to get the id of the task
  int? id;
  // property below is used for getting the title
  String? title;
  // property below is used to check that whether the task is done or not
  bool? done;

  // the code below is used to create a constructor for initialization
  TODOModel({
    this.id,
    this.title,
    this.done = false,
  });

  // the code below is used to create a factory method for converting the json Data
  // to dart object
  factory TODOModel.fromJSON(Map<String, dynamic> json) {
    return TODOModel(
      id: json['id'],
      title: json['title'],
      done: json['is_done'] == 0
          ? false
          : true, // since the sqlite does not have the boolean type
      // so we are using 0 to denote false and 1 to denote true
    );
  }

  // the code below is used to create a method for converting dart object to json to
  // be stored in the database
  Map<String, dynamic> toJSON() {
    return {
      'id': id,
      'title': title,
      'is_done': done == false
          ? 0
          : 1, // since the sqlite does not have the boolean type
      // so we are using 0 to denote false and 1 to denote true
    };
  }
}
