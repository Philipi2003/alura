import 'dart:io';

import 'package:dio/dio.dart';
import 'package:new_fiap_rest/app/core/client/api_client.dart';
import 'package:new_fiap_rest/app/core/network/response_types/response.dart' as response;
import 'package:new_fiap_rest/app/features/home/services/upload/upload_service.dart';

class UploadServiceRemote implements UploadService{
  @override
  Future<({String? imageUrl, response.Response result})> uploadImage(File imageFile) async {
    
    final result = await ApiClient.client.post('/api/v1/files/upload',
      data: FormData.fromMap({
        'file' : await MultipartFile.fromFile(imageFile.path)
      }) 
    );

    final imageUrl = result.data['location'] as String;

    return (imageUrl: imageUrl, result: response.Success());

  }

}