import '../models/course.dart';
import '../models/student.dart';

class CourseService {
  final List<Course> availableCourses = [
    Course(title: 'Math 101', code: 'MATH101'),
    Course(title: 'Physics 101', code: 'PHYS101'),
  ];

  void registerStudent(Student student, Course course) {
    print('Student ${student.name} registered for ${course.title}');
  }

  List<Course> getCourses() {
    return availableCourses;
  }
}
