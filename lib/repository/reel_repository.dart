import 'package:dio/dio.dart';
import 'package:media_reels/core/log/log.dart';
import 'package:media_reels/model/object_model/reel_model/reel_model.dart';
import 'package:media_reels/network/dio_client.dart';

class ReelRepository {
  Future<ReponseReelModel> fetchListReel() async {
    try {
      Log.error('call ---');
      Response? reponse = await DioClient.instance.post(
          'https://ouk4ac913a.execute-api.ap-northeast-2.amazonaws.com/v1/get-video-link',
          '');
      Log.info(reponse!.data);
      return ReponseReelModel.fromJson(reponse.data);
    } catch (e) {
      Log.error(e);
      rethrow;
    }
  }
}
