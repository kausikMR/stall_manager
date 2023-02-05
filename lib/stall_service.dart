import 'package:firedart/firedart.dart';

import 'models/models.dart';

class StallService {

  const StallService._();

  static const StallService _instance = StallService._();

  static StallService get instance => _instance;

  Future<Student> getStudent(String id){
    return Firestore.instance.collection('students').document(id).get().then((doc) => Student.fromMap(doc.map));
  }

  Stream<List<Student>> getStudents(){
    return Firestore.instance.collection('students').stream.map((docs) => docs.map((doc) => Student.fromMap(doc.map)).toList());
  }

  Future<void> addStudent(Student student){
    return Firestore.instance.collection('students').document(student.id).set(student.toMap());
  }

  Future<void> updateStudent(Student student){
    return Firestore.instance.collection('students').document(student.id).update(student.toMap());
  }

  Future<void> deleteStudent(String id){
    return Firestore.instance.collection('students').document(id).delete();
  }

  Future<Stall> getStall(String id){
    return Firestore.instance.collection('stalls').document(id).get().then((doc) => Stall.fromMap(doc.map));
  }

  Future<Stall> getStallByOwnerId(String ownerId){
    return Firestore.instance.collection('stalls').where('ownerId', isEqualTo: ownerId).get().then((docs) => Stall.fromMap(docs.first.map));
  }

  Future<List<Stall>> getStalls(){
    return Firestore.instance.collection('stalls').stream.map((docs) => docs.map((doc) => Stall.fromMap(doc.map)).toList()).first;
  }

  Future<void> addStall(Stall stall){
    return Firestore.instance.collection('stalls').document(stall.id).set(stall.toMap());
  }

  Future<void> updateStall(Stall stall){
    return Firestore.instance.collection('stalls').document(stall.id).update(stall.toMap());
  }

  Future<void> deleteStall(String id){
    return Firestore.instance.collection('stalls').document(id).delete();
  }
}