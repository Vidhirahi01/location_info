import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../models/location_model.dart';

class DetailScreen extends StatelessWidget {
  final LocationModel location;
  const DetailScreen({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(location.name)),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: location.imageUrl,
              width: double.infinity,
              height: 200.h,
              fit: BoxFit.cover,
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            SizedBox(height: 20.h),
            Text("Latitude: ${location.latitude}", style: TextStyle(fontSize: 16.sp)),
            SizedBox(height: 10.h),
            Text("Longitude: ${location.longitude}", style: TextStyle(fontSize: 16.sp)),
          ],
        ),
      ),
    );
  }
}
