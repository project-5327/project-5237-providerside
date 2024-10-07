import 'package:flutter/material.dart';
import 'package:project_5237_provider/config/baseclient/CustomInterceptor.dart';
import 'package:project_5237_provider/config/baseclient/base_client.dart';
import 'package:project_5237_provider/config/baseclient/endpoints.dart';
import 'package:project_5237_provider/data/models/filter_model.dart';

class FilterProvider with ChangeNotifier {
  bool _loading = false;
  String? _errorMessage;
  FilterModel? filterModel;

  bool get loading => _loading;
  String? get errorMessage => _errorMessage;

  Map<String, List<String>> getFilterOptions() {
    Map<String, List<String>> options = {};

    if (filterModel != null && filterModel!.projects != null) {
      options['Category'] = filterModel!.projects!
          .expand((project) => project.category?.cast<String>() ?? [])
          .toSet()
          .toList()
          .cast<String>();
      debugPrint("Catgory========>${options['Category']} ");

      options['Subcategory'] = filterModel!.projects!
          .expand((project) => project.subCategory?.cast<String>() ?? [])
          .toSet()
          .toList()
          .cast<String>();
      debugPrint("Sub Catgory========>${options['Subcategory']} ");

      options['Skills'] = filterModel!.projects!
          .expand((project) => project.skillsRequired?.cast<String>() ?? [])
          .toSet()
          .toList()
          .cast<String>();
      debugPrint("Skills========>${options['Skills']} ");

      options['Timeline'] = filterModel!.projects!
          .map((project) => project.timelineType ?? '')
          .toSet()
          .toList()
          .cast<String>();

      options['Budget'] = filterModel!.projects!
          .map((project) =>
              'R\$ ${project.budget?.min} - R\$ ${project.budget?.max}')
          .toSet()
          .toList()
          .cast<String>();
    }

    return options;
  }

  Future<void> fetchAllFilters(BuildContext context) async {
    _loading = true;
    notifyListeners();
    String? token = await CustomInterceptor.getToken();
    try {
      final response = await BaseClient.get(
        api: EndPoints.FILTER,
      );

      if (response != null && response.statusCode == 200) {
        final data = response.data;
        debugPrint('response ==========> $data');

        if (data != null) {
          filterModel = FilterModel.fromJson(data);
          _errorMessage = '';
          debugPrint('==== Filters retrieved successfully.=====');
          debugPrint("Filters======> :$filterModel");
        } else {
          _errorMessage = 'No data found';
          debugPrint('Error=======> No data found');
        }
      } else {
        debugPrint('Error=======> ${response?.statusCode}, ${response?.data}');
        _errorMessage = response?.data['message'] ?? 'Failed to load data';
        debugPrint('Error: ${response?.statusCode}, ${response?.data}');
      }
    } catch (e) {
      _errorMessage = 'An error occurred while fetching data: ${e.toString()}';
      debugPrint("Error======> ${e.toString()}");
    } finally {
      _loading = false;
      notifyListeners();

      if (_errorMessage != null) {
        _showSnackBar(context, _errorMessage);
      }
    }
  }

  void _showSnackBar(BuildContext context, String? message) {
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message ?? "Error")),
      );
    }
  }
}

// class FilterProvider with ChangeNotifier {
//   bool _loading = false;
//   String? _errorMessage;
//   FilterModel? filterModel;

//   bool get loading => _loading;
//   String? get errorMessage => _errorMessage;

//   Future<void> fetchAllFilters(BuildContext context) async {
//     _loading = true;
//     notifyListeners();
//     String? token = await CustomInterceptor.getToken();
//     try {
//       final response = await BaseClient.get(
//         api: EndPoints.FREELANCERS,
//       );

//       if (response != null && response.statusCode == 200) {
//         final data = response.data;
//         debugPrint('response ==========> ${data}');

//         if (data != null) {
//           filterModel =
//               FilterModel.fromJson(data); // Ensure correct model mapping
//           _errorMessage = '';
//           debugPrint('==== Filters retrieved successfully.=====');
//           debugPrint("Filters======> :${filterModel?.projects}");

//           Map<String, List<String>> getFilterOptions() {
//             Map<String, List<String>> options = {};

//             if (filterModel != null && filterModel!.projects != null) {
//               // Populate filter options based on the fetched data
//               options['Category'] = filterModel!.projects!
//                   .expand((project) => project.category?.cast<String>() ?? [])
//                   .toSet()
//                   .toList()
//                   .cast<String>();

//               options['Subcategory'] = filterModel!.projects!
//                   .expand(
//                       (project) => project.subCategory?.cast<String>() ?? [])
//                   .toSet()
//                   .toList()
//                   .cast<String>();

//               options['Skills'] = filterModel!.projects!
//                   .expand(
//                       (project) => project.skillsRequired?.cast<String>() ?? [])
//                   .toSet()
//                   .toList()
//                   .cast<String>();

//               options['Timeline'] = filterModel!.projects!
//                   .map((project) => project.timelineType ?? '')
//                   .toSet()
//                   .toList()
//                   .cast<String>();

//               options['Budget'] = filterModel!.projects!
//                   .map((project) =>
//                       'R\$ ${project.budget?.min} - R\$ ${project.budget?.max}')
//                   .toSet()
//                   .toList()
//                   .cast<String>();
//             }

//             return options;
//           }

//           Map<String, List<String>> filterOptions = getFilterOptions();
//           debugPrint('Filter Options: $filterOptions');
//         } else {
//           _errorMessage = 'No data found';
//           debugPrint('Error=======> No data found');
//         }
//       } else {
//         debugPrint('Error=======> ${response?.statusCode}, ${response?.data}');
//         _errorMessage = response?.data['message'] ?? 'Failed to load data';
//         debugPrint('Error: ${response?.statusCode}, ${response?.data}');
//       }
//     } catch (e) {
//       _errorMessage = 'An error occurred while fetching data: ${e.toString()}';
//       debugPrint("Error======> ${e.toString()}");
//     } finally {
//       _loading = false;
//       notifyListeners();

//       if (_errorMessage != null) {
//         _showSnackBar(context, _errorMessage);
//       }
//     }
//   }

//   void _showSnackBar(BuildContext context, String? message) {
//     if (context.mounted) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(message ?? "Error")),
//       );
//     }
//   }
// }
