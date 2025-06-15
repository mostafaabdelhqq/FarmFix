import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:farmfix/features/landscanner/data/model/SoilDataModel.dart';
import 'package:latlong2/latlong.dart';
import 'package:meta/meta.dart';

part 'soilgrids_state.dart';

class SoilGridsCubit extends Cubit<SoilGridsState> {
  SoilGridsCubit() : super(SoilGridsInitial());

  final Dio dio = Dio();

  Future<void> fetchSoilGridsFromLatLng(LatLng point) async {
    emit(SoilGridsLoading());
    try {
      final response = await dio.get(
        'https://rest.soilgrids.org/query',
        queryParameters: {
          'lon': point.longitude,
          'lat': point.latitude,
          'value': 'mean',
          'depths': '0-5cm,5-15cm,15-30cm',
        },
      );
      print('Response status: ${response.statusCode}');
      print('Response data: ${response.data}');

      final soilData = SoilDataModel.fromJson(response.data);
      emit(SoilGridsLoaded(soilData));
    } catch (e, s) {
      print(' Error: $e');
      print(' Stacktrace: $s');
      emit(SoilGridsError(e.toString()));
    }
  }
}

