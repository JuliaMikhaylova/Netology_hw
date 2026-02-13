# Студенты
class Student:
    def __init__(self, name, surname, gender):
        self.name = name
        self.surname = surname
        self.gender = gender
        self.finished_courses = []
        self.courses_in_progress = []
        self.grades = {}

    def add_course(self, course_name):
        self.finished_courses.append(course_name)

    # Получаем оценку за лекцию от студентов
    def rate_lecture(self, lecturer, course, grades):
        if isinstance(lecturer, Lecturer) and course in lecturer.courses_attached and course in student.courses_in_progress:
            if course in lecturer.grades:
                lecturer.grades[course] += [grades]
            else:
                lecturer.grades[course] = [grades]
        else:
            return 'Ошибка'

    # Средняя оценка за домашние задания
    def average_grade(self):
        grades = [grade for course in self.grades.values() for grade in course]
        return round(sum(grades) / len(grades), 2) if grades else 0

    def __str__(self):
        return (f'Имя: {self.name}\n'
                f'Фамилия: {self.surname}\n'
                f'Средняя оценка за домашние задания: {self.average_grade()}\n'
                f'Курсы в процессе изучения: {", ".join(self.courses_in_progress)}\n'
                f'Завершенные курсы: {", ".join(self.finished_courses)}')

    # Сравнение между собой студентов по средней оценке за ДЗ
    def __lt__(self, other):
        return self.average_grade() < other.average_grade()
    def __gt__(self, other):
        return self.average_grade() < other.average_grade()
    def __eq__(self, other):
        return self.average_grade() < other.average_grade()

# Преподаватели
class Mentor:
    def __init__(self, name, surname):
        self.name = name
        self.surname = surname
        self.courses_attached = []

# Лекторы
class Lecturer(Mentor):
    def __init__(self, name, surname):
        super().__init__(name,surname)
        self.grades = {}

    # Средняя оценка за лекции
    def average_grade(self):
        grades = [grade for course in self.grades.values() for grade in course]
        return round(sum(grades) / len(grades), 2) if grades else 0

    def __str__(self):
        return (f'Имя: {self.name}\n'
                f'Фамилия: {self.surname}\n'
                f'Средняя оценка за лекции: {self.average_grade()}')

    # Сравнение между собой лекторов по средней оценке за лекции
    def __lt__(self, other):
        return self.average_grade() < other.average_grade()
    def __gt__(self, other):
        return self.average_grade() < other.average_grade()
    def __eq__(self, other):
        return self.average_grade() < other.average_grade()

# Эксперты, проверяющие домашние задания
class Reviewer(Mentor):
    def __init__(self, name, surname):
        super().__init__(name,surname)

    # Получаем оценку за ДЗ от экспертов
    def rate_hw(self, student, course, grade):
        if isinstance(student, Student) and course in self.courses_attached and course in student.courses_in_progress:
            if course in student.grades:
                student.grades[course] += [grade]
            else:
                student.grades[course] = [grade]
        else:
            return 'Ошибка'

    def __str__(self):
        return (f'Имя: {self.name}\n'
                f'Фамилия: {self.surname}')

# Функция для подсчета средней оценки за ДЗ по всем студентам в рамках конкретного курса
def average_grade_student(students, course):
    total = qty = 0
    for el in students:
        if course in el.grades:
            total += sum(el.grades[course])
            qty += len(el.grades[course])
    return round(total / qty, 2) if qty else 0

# Функция для подсчета средней оценки за лекции всех лекторов в рамках конкретного курса
def average_grade_lecture(lecturers, course):
    total = qty = 0
    for el in lecturers:
        if course in el.grades:
            total += sum(el.grades[course])
            qty += len(el.grades[course])
    return round(total / qty, 2) if qty else 0


# Задание 1
print("Задание 1:")
lecturer = Lecturer('Иван', 'Иванов')
reviewer = Reviewer('Пётр', 'Петров')
print(isinstance(lecturer, Mentor)) # True
print(isinstance(reviewer, Mentor)) # True
print(lecturer.courses_attached)    # []
print(reviewer.courses_attached)    # []

# Задание 2
print(f"\nЗадание 2:")
lecturer = Lecturer('Иван', 'Иванов')
reviewer = Reviewer('Пётр', 'Петров')
student = Student('Ольга', 'Алёхина', 'Ж')

student.courses_in_progress += ['Python', 'Java']
lecturer.courses_attached += ['Python', 'C++']
reviewer.courses_attached += ['Python', 'C++']

print(student.rate_lecture(lecturer, 'Python', 7))   # None
print(student.rate_lecture(lecturer, 'Java', 8))     # Ошибка
print(student.rate_lecture(lecturer, 'С++', 8))      # Ошибка
print(student.rate_lecture(reviewer, 'Python', 6))   # Ошибка

print(lecturer.grades)  # {'Python': [7]}

# Задание 3
print(f"\nЗадание 3:")
student1 = Student('Алексей', 'Смирнов', 'М')
student1.courses_in_progress += ['Python', 'Git']
student1.finished_courses += ['Введение в программирование']
reviewer.rate_hw(student, 'Python', 8)
reviewer.rate_hw(student1, 'Python', 7)

lecturer1 = Lecturer('Сергей', 'Сидоров')
lecturer1.courses_attached += ['Python']
student.rate_lecture(lecturer1, 'Python', 8)

print('У проверяющих:')
print(reviewer)
print('\nУ лекторов:')
print(lecturer)
print('\nУ студентов:')
print(student)

print(f'Сравнение студентов: {student > student1}')
print(f'Сравнение лекторов: {lecturer > lecturer1}')

# Задание 4
print(f"\nЗадание 4:")
student3 = Student('Игорь', 'Aндреев', 'М')
student3.courses_in_progress += ['Python']
student4 = Student('Инна', 'Сергеева', 'Ж')
student4.courses_in_progress += ['Python']
lecturer3 = Lecturer('Павел', 'Васильев')
lecturer3.courses_attached += ['Python']
lecturer4 = Lecturer('Олег', 'Симонов')
lecturer4.courses_attached += ['Python']
reviewer3 = Reviewer('Владимир','Спиридонов')
reviewer3.courses_attached += ['Python']
reviewer4 = Reviewer('Николай','Морозов')
reviewer4.courses_attached += ['Python']

student3.rate_lecture(lecturer3, 'Python', 10)
student3.rate_lecture(lecturer4, 'Python', 9)
student4.rate_lecture(lecturer3, 'Python', 8)
student4.rate_lecture(lecturer4, 'Python', 9)
reviewer.rate_hw(student3,'Python', 9)
reviewer.rate_hw(student4,'Python', 8)
reviewer4.rate_hw(student3,'Python', 8)
reviewer4.rate_hw(student4,'Python', 9)

print(f'Средняя оценка за домашнее задание по курсу Python: '
      f'{average_grade_student([student3, student4], 'Python')}')
print(f'Средняя оценка за лекции по курсу Python: '
      f'{average_grade_lecture([lecturer3, lecturer4], 'Python')}')


# best_student = Student('Ruoy', 'Eman', 'your_gender')
# best_student.courses_in_progress += ['Python']
#
# cool_mentor = Mentor('Some', 'Buddy')
# cool_mentor.courses_attached += ['Python']
#
# cool_mentor.rate_hw(best_student, 'Python', 10)
# cool_mentor.rate_hw(best_student, 'Python', 10)
# cool_mentor.rate_hw(best_student, 'Python', 10)

# print(best_student.grades)
