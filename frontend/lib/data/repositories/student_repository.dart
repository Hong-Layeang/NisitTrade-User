import '../../models/student.dart';
import '../mock/mock_data.dart';

abstract class StudentRepository {
  List<Student> getStudents();
}

class StudentRepositoryImpl implements StudentRepository {
  @override
  List<Student> getStudents() {
    return mockStudents;
  }
}
