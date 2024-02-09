import 'package:flutter/material.dart';
import 'package:text_recognitions/product/mixin/error_mixin.dart';
import 'package:text_recognitions/product/service/pdf_service/pdf_service.dart';

/// PdfViewModel
final class DetailViewModel extends ChangeNotifier with ErrorMixin {
  /// PdfViewModel constructor
  DetailViewModel(this.pdfService, this.pdfText);

  /// PdfService
  final PdfService pdfService;

  /// PdfText
  final String pdfText;

  /// isLoaded
  bool isLoaded = false;

  /// Create pdf
  Future<void> createPdf(BuildContext context) async {
    setLoaded();
    try {
      await pdfService.generateAndSharePdf(pdfText);
      notifyListeners();
    } catch (e) {
      await showError(
        e.toString(),
        context,
      );
    }
    setLoaded();
  }

  /// Set loaded
  void setLoaded() {
    isLoaded = !isLoaded;
    notify();
  }

  /// Notify
  void notify() {
    notifyListeners();
  }
}
