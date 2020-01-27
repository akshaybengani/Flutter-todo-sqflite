class TodoData {
  int _id;
  String _name;
  String _todo;

  TodoData(this._name, [this._todo]);

  TodoData.withId(this._id,this._name, this._todo);

  int get id => _id;
  String get name => _name;
  String get todo => _todo;

  set name(String newName) {
    if(newName.length <= 255){
      this._name = newName; 
    }
  }

  set todo(String newTodo) {
    if(newTodo.length <= 255){
      this._todo = newTodo; 
    }    
  }

  Map<String, dynamic> toMap(){
    var map = Map<String, dynamic>();

    if(id != null){
      map['id'] =_id;
    }
    map['name'] = _name;
    map['todo'] = _todo;

    return map;
  }

  TodoData.fromMapObject(Map<String, dynamic> map ){
    this._id = map['id'];
    this._name = map['name'];
    this._todo = map['todo'];    
  }



}
