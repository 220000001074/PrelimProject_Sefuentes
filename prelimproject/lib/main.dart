import 'dart:io';
import 'package:riverpod/riverpod.dart';
import 'controllers/registration_controller.dart';
import 'models/student.dart';
// import 'models/course.dart';

final registrationControllerProvider = Provider<RegistrationController>((ref) {
  final courseService = ref.read(courseServiceProvider);
  return RegistrationController(courseService);
});

void main() {
  final container = ProviderContainer();
  final registrationController = container.read(registrationControllerProvider);

  print('Welcome to the Student Course Registration System');
  print('Please enter your name:');
  String name = stdin.readLineSync() ?? '';
  print('Please enter your student ID:');
  int id = int.parse(stdin.readLineSync() ?? '0');

  final student = Student(name: name, id: id);

  print('Available courses:');
  final courses = registrationController.availableCourses();
  for (int i = 0; i < courses.length; i++) {
    print('${i + 1}. ${courses[i].title}');
  }

  print('Please select a course by entering the number:');
  int courseIndex = int.parse(stdin.readLineSync() ?? '1') - 1;
  final selectedCourse = courses[courseIndex];

  registrationController.register(student, selectedCourse);
}


// int calculate() {
//   return 6 * 7;
// }
