class Task {
  final String id;
  final String title;
  final String category;
  final int priority; // 1–5
  final DateTime createdAt;
  final DateTime? dueAt;
  final bool isComplete;

  const Task({
    required this.id,
    required this.title,
    required this.category,
    required this.priority,
    required this.createdAt,
    this.dueAt,
    this.isComplete = false,
  });

  Task copyWith({
    String? title,
    String? category,
    int? priority,
    DateTime? dueAt,
    bool? isComplete,
  }) {
    return Task(
      id: id,
      title: title ?? this.title,
      category: category ?? this.category,
      priority: priority ?? this.priority,
      createdAt: createdAt,
      dueAt: dueAt ?? this.dueAt,
      isComplete: isComplete ?? this.isComplete,
    );
  }
}
