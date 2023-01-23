import 'dart:convert';

import 'package:race/domain/api_client/api_client.dart';
import 'package:race/entity/dashboard/task.dart';
import 'package:race/entity/products/recipe_specification.dart';
import 'package:race/entity/supplier/supplier_project.dart';

class TaskCardService extends ApiClient {
  int _tasksCount = 0;
  int get tasksCount => _tasksCount;

  Future<List<Task>> getOpenTask(Map<String, dynamic>? params) async {
    final response = await getRequest("/tasks/api/v0/tasks/", params);
    final request = await jsonDecode(utf8.decode(response.bodyBytes));
    _tasksCount = int.parse(response.headers['x-total-count']!);
    List<Task> result = [];
    for (var element in (request as List<dynamic>)) {
      result.add(Task.fromJson(element));
    }

    return result;
  }

  Future<List<RecipeSpecification>> getPendingSpecs(Map<String, dynamic>? params) async {
    final response = await getRequest("/products/api/v0/recipe-specifications/", params);
    final request = await jsonDecode(utf8.decode(response.bodyBytes));
    _tasksCount = int.parse(response.headers['x-total-count']!);
    List<RecipeSpecification> result = [];
    for (var element in (request as List<dynamic>)) {
      result.add(RecipeSpecification.fromJson(element));
    }

    return result;
  }

    Future<List<RecipeSpecification>> getNewSubmissions(Map<String, dynamic>? params) async {
    final response = await getRequest("/approval/api/v0/submissions/", params);
    final request = await jsonDecode(utf8.decode(response.bodyBytes));
    _tasksCount = int.parse(response.headers['x-total-count']!);
    List<RecipeSpecification> result = [];
    for (var element in (request as List<dynamic>)) {
      result.add(RecipeSpecification.fromJson(element));
    }

    return result;
  }

    Future<List<SupplierProject>> getOpenSupplierTask(Map<String, dynamic>? params) async {
    final response = await getRequest("/suppliers/api/v0/supplier-projects/", params);
    final request = await jsonDecode(utf8.decode(response.bodyBytes));
    _tasksCount = int.parse(response.headers['x-total-count']!);
    List<SupplierProject> result = [];
    for (var element in (request as List<dynamic>)) {
      result.add(SupplierProject.fromJson(element));
    }

    return result;
  }
}
