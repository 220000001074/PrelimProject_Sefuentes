import 'package:riverpod/riverpod.dart';

import '../models/student.dart';
import '../models/course.dart';
import '../services/course_service.dart';

final courseServiceProvider = Provider<CourseService>((ref) {
  return CourseService();
});

class RegistrationController {
  final CourseService courseService;

  RegistrationController(this.courseService);

  void register(Student student, Course course) {
    courseService.registerStudent(student, course);
  }

  List<Course> availableCourses() {
    return courseService.getCourses();
  }
}
