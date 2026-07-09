import 'dart:io';
import 'package:new_fiap_rest/app/core/network/response_types/response.dart';

abstract class UploadService {
  Future<({Response result, String? imageUrl})> uploadImage(File imageFile);
}
