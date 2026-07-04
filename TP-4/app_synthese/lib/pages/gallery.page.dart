import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Required for AssetManifest

class GalleryPage extends StatefulWidget {
  const GalleryPage({super.key});

  @override
  State<GalleryPage> createState() => GalleryPageState();
}

class GalleryPageState extends State<GalleryPage> {
  List<String> _imagePaths = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadGalleryAssets();
  }

  Future<void> _loadGalleryAssets() async {
    try {
      // 1. Use the modern Flutter API to load the manifest bundle
      final assetManifest = await AssetManifest.loadFromAssetBundle(rootBundle);

      // 2. Extract the complete list of assets
      final List<String> allAssets = assetManifest.listAssets();

      // 3. Filter for your root folder name and image extensions
      final List<String> galleryImages = allAssets
          .where((String key) => key.startsWith('gallery/'))
          .where((String key) {
        final path = key.toLowerCase();
        return path.endsWith('.jpg') ||
            path.endsWith('.jpeg') ||
            path.endsWith('.png') ||
            path.endsWith('.webp');
      })
          .toList();

      setState(() {
        _imagePaths = galleryImages;
        _isLoading = false;
      });
    } catch (e) {
      debugPrint('Error loading asset manifest: $e');
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Gallery')),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _imagePaths.isEmpty
          ? const Center(child: Text('No pictures found in root gallery/'))
          : GridView.builder(
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: _imagePaths.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            clipBehavior: Clip.antiAlias,
            elevation: 2,
            child: Image.asset(
              _imagePaths[index],
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}
