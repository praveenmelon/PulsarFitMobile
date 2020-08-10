import '../enumerations/multimedia_file_type.dart';
import 'exercise_search_request.dart';
import 'plan_search_request.dart';
import 'workout_search_request.dart';
import 'pagination.dart';

class MultimediaFileSearchRequest {
  int id;
  String url;
  String thumbnailUrl;
  String blurhash;
  double sizeMB;
  MultimediaFileType multimediaFileType;

  bool isPublic;
  ExerciseSearchRequest exercises;
  PlanSearchRequest plans;
  WorkoutSearchRequest workouts;
  bool includeExercises;
  bool includePlans;
  bool includeWorkouts;

  Pagination pagination;

  MultimediaFileSearchRequest({
    this.id,
    this.url,
    this.thumbnailUrl,
    this.blurhash,
    this.sizeMB,
    this.multimediaFileType,
    this.isPublic,
    this.exercises,
    this.plans,
    this.workouts,
    this.includeExercises,
    this.includePlans,
    this.includeWorkouts,
    this.pagination,
  }) {
    pagination ??= Pagination();
  }

  MultimediaFileSearchRequest copyWith({
    int id,
    String url,
    String thumbnailUrl,
    String blurhash,
    double sizeMB,
    MultimediaFileType multimediaFileType,
    bool isPublic,
    ExerciseSearchRequest exercises,
    PlanSearchRequest plans,
    WorkoutSearchRequest workouts,
    bool includeExercises,
    bool includePlans,
    bool includeWorkouts,
    Pagination pagination,
  }) {
    return MultimediaFileSearchRequest(
      id: id ?? this.id,
      url: url ?? this.url,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
      blurhash: blurhash ?? this.blurhash,
      sizeMB: sizeMB ?? this.sizeMB,
      multimediaFileType: multimediaFileType ?? this.multimediaFileType,
      isPublic: isPublic ?? this.isPublic,
      exercises: exercises ?? this.exercises,
      plans: plans ?? this.plans,
      workouts: workouts ?? this.workouts,
      includeExercises: includeExercises ?? this.includeExercises,
      includePlans: includePlans ?? this.includePlans,
      includeWorkouts: includeWorkouts ?? this.includeWorkouts,
      pagination: pagination ?? this.pagination,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'url': url,
      'thumbnailUrl': thumbnailUrl,
      'blurhash': blurhash,
      'sizeMB': sizeMB,
      'multimediaFileType': multimediaFileType?.index,
      'isPublic': isPublic,
      'exercises': exercises?.toJson(),
      'plans': plans?.toJson(),
      'workouts': workouts?.toJson(),
      'includeExercises': includeExercises,
      'includePlans': includePlans,
      'includeWorkouts': includeWorkouts,
      'pagination': pagination?.toJson(),
    };
  }
}
