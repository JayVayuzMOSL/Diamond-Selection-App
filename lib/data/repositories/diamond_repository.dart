import 'package:excel/excel.dart';
import 'package:flutter/services.dart';
import 'package:kgk_diamonds_group_app/data/models/diamond_model.dart';
import 'package:kgk_diamonds_group_app/domain/repositories/diamond_repository_interface.dart';

class DiamondRepository implements DiamondRepositoryInterface {
  /// Load diamonds from Excel file in assets
  @override
  Future<List<DiamondModel>> loadDiamondsFromExcel() async {
    ByteData data = await rootBundle.load('assets/Flutter-test-dataset.xlsx');
    Uint8List bytes = data.buffer.asUint8List();
    var excel = Excel.decodeBytes(bytes);

    Sheet sheet = excel.sheets.values.first;

    List<DiamondModel> diamonds = [];
    for (var row in sheet.rows.skip(2)) {
      diamonds.add(DiamondModel(
        qty: row[3]?.value.toString() ?? '',
        lotId: row[4]?.value.toString() ?? '',
        size: row[5]?.value.toString() ?? '0',
        carat: double.tryParse(row[6]?.value.toString() ?? '0') ?? 0.0,
        lab: row[7]?.value.toString() ?? '',
        shape: row[8]?.value.toString() ?? '',
        color: row[9]?.value.toString() ?? '',
        clarity: row[10]?.value.toString() ?? '',
        cut: row[11]?.value.toString() ?? '',
        polish: row[12]?.value.toString() ?? '',
        symmetry: row[13]?.value.toString() ?? '',
        fluorescence: row[14]?.value.toString() ?? '',
        discount: double.tryParse(row[15]?.value.toString() ?? '0') ?? 0.0,
        perCaratRate: double.tryParse(row[16]?.value.toString() ?? '0') ?? 0.0,
        keyToSymbol: row[18]?.value.toString() ?? '',
        labComment: row[19]?.value.toString() ?? '',
      ));
    }
    return diamonds;
  }

  @override
  Future<List<DiamondModel>> getFilteredDiamonds({Map<String, dynamic>? filters}) async {
    final diamondData = await loadDiamondsFromExcel();
    if (filters == null || filters.isEmpty) return diamondData;

    List<DiamondModel> filteredDiamonds = [];

    for (var diamond in diamondData) {
      bool matches = true; // Assume it matches, then check conditions

      if (filters.containsKey('lab') && filters['lab'].isNotEmpty) {
        matches &= (diamond.lab == filters['lab']);
      }

      if (filters.containsKey('shape') && filters['shape'].isNotEmpty) {
        matches &= (diamond.shape == filters['shape']);
      }

      if (filters.containsKey('color') && filters['color'].isNotEmpty) {
        matches &= (diamond.color == filters['color']);
      }

      if (filters.containsKey('clarity') && filters['clarity'].isNotEmpty) {
        matches &= (diamond.clarity == filters['clarity']);
      }

      if (filters.containsKey('caratFrom') && filters['caratFrom'] is double) {
        matches &= (diamond.carat >= filters['caratFrom']);
      }

      if (filters.containsKey('caratTo') && filters['caratTo'] is double) {
        matches &= (diamond.carat <= filters['caratTo']);
      }

      if (matches) {
        filteredDiamonds.add(diamond);
      }
    }

    return filteredDiamonds;
  }
}
