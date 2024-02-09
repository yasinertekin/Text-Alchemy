// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:share_plus/share_plus.dart';
import 'package:text_recognitions/product/core/constants/string_constants.dart';
import 'package:text_recognitions/product/mixin/error_mixin.dart';
import 'package:text_recognitions/product/utility/custom_exception.dart';

// PdfService sınıfını bir arayüze dönüştürmek için bir soyut sınıf tanımlayın.
abstract class PdfService {
  // PDF oluşturma ve paylaşma işlemini gerçekleştiren metot.
  Future<void> generateAndSharePdf(String text);
}

// PdfService arayüzünü uygulayan bir sınıf tanımlayın.
final class PdfServiceImpl with ErrorMixin implements PdfService {
  // Kurucu metot.
  PdfServiceImpl();

  @override
  Future<void> generateAndSharePdf(String text) async {
    // PDF belgesi oluşturun.
    final documents = pw.Document();
    try {
      // PDF belgesine sayfa ekleyin.
      documents.addPage(
        pw.Page(
          build: (pw.Context context) {
            return pw.Text(text);
          },
        ),
      );

      // Uygulama belgeleri dizinini alın.
      final directory = await getApplicationDocumentsDirectory();

      // Dosya adı için benzersiz bir zaman damgası oluşturun.
      final date = DateTime.now().microsecondsSinceEpoch.toString();

      // Dosya yolu ve adını oluşturun.
      final path = directory.path;
      final file = File('$path/$date.pdf');

      // PDF belgesini diske yazın.
      await file.writeAsBytes(await documents.save());

      // PDF dosyasını paylaşın.
      await Share.shareXFiles([XFile(file.path)]);
    } on Exception catch (e) {
      // Hata durumunda hata mesajını gösterin.
      throw CustomException('${StringConstants.pdfError} $e');
    }
  }
}
