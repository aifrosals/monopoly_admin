import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:monopoly_admin/api/api_constants.dart';
import 'package:monopoly_admin/models/admin.dart';
import 'package:monopoly_admin/models/feedback.dart' as feedback;

class FeedbackProvider extends ChangeNotifier {
  FeedbackProvider.admin(Admin admin) {
    getFeedbacks(admin);
  }

  FeedbackProvider();

  bool _feedbackLoading = false;

  String _errorMessage = '';

  bool _feedbackPaginationLoading = false;

  List<feedback.Feedback> _feedbacks = [];


  getFeedbacks(Admin admin) async {
    try {
      debugPrint('getFeedback called');
      _feedbackLoading = true;
      Uri url = Uri.parse('${ApiConstants.domain}${ApiConstants.getFeedback}');
      var response = await http.get(
        url,
        //TODO: Create jwt on server
        headers: {
          'Content-Type': 'application/json',
          'x-access-token': admin.token
        },
      );
      debugPrint('FeedbackProvider getFeedback  response ${response.body}');
      if (response.statusCode == 200) {
        debugPrint('FeedbackProvider getFeedback response ${response.body}');
        var resData = json.decode(response.body) as List;
        _feedbacks = resData.map((e) => feedback.Feedback.fromJson(e)).toList();
        _errorMessage = '';
      } else {
        _errorMessage = response.body;
      }
    } catch (error, st) {
      debugPrint('FeedbackProvider getFeedback $error $st');
    } finally {
      _feedbackLoading = false;
      notifyListeners();
    }
  }

  getPaginatedFeedbacks(Admin admin) async {
    if (_feedbacks.isNotEmpty) {
      try {
        _feedbackPaginationLoading = true;
        Uri url = Uri.parse(
            '${ApiConstants.domain}${ApiConstants.getPaginatedFeedback}');
        var body = {'lastDate': _feedbacks.last.date};
        var response = await http.post(
          url,
          body: json.encode(body),
          headers: {
            'Content-Type': 'application/json',
            'x-access-token': admin.token
          },
        );
        debugPrint('FeedbackProvider getFeedbacks response ${response.body}');
        if (response.statusCode == 200) {
          debugPrint('FeedbackProvider getFeedbacks response ${response.body}');
          var resData = json.decode(response.body) as List;
          _feedbacks.addAll(
              resData.map((e) => feedback.Feedback.fromJson(e)).toList());
          _errorMessage = '';
        } else {
          _errorMessage = response.body;
        }
      } catch (error, st) {
        debugPrint('TransactionProvider getTransaction $error $st');
        _errorMessage = "Unknown error";
      } finally {
        _feedbackPaginationLoading = false;
        notifyListeners();
      }
    }
  }

  bool get feedbackLoading => _feedbackLoading;

  bool get feedbackPaginationLoading => _feedbackPaginationLoading;

  List<feedback.Feedback> get feedbacks => _feedbacks;
}
