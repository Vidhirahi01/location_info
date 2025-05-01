import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/location_model.dart';

class LocationInfoScreen extends StatelessWidget {
  const LocationInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final locations = [
      LocationModel(
        name: 'San Francisco',
        imageUrl: 'https://images.unsplash.com/photo-1502920514313-52581002a659',
        latitude: 37.7749,
        longitude: -122.4194,
      ),
      LocationModel(
        name: 'New York',
        imageUrl: 'https://images.unsplash.com/photo-1549921296-3a73f8e80d96',
        latitude: 40.7128,
        longitude: -74.0060,
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: Text('Locations', style: TextStyle(fontSize: 20.sp))),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          final location = locations[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
            child: ListTile(
              leading: CachedNetworkImage(
                imageUrl: location.imageUrl,
                width: 80.w,
                height: 80.h,
                fit: BoxFit.cover,
                placeholder: (context, url) => const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              title: Text(location.name, style: TextStyle(fontSize: 16.sp)),
              onTap: () => context.push('/details', extra: location),
            ),
          );
        },
      ),
    );
  }
}
