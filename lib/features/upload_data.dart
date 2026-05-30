// lib/screens/upload_screen.dart

import 'package:flutter/material.dart';

import '../core/functions/upload_services.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  _UploadScreenState createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  final UploadService _uploadService = UploadService();
  bool _isLoading = false;
  String _status = '';

  Future<void> _uploadCategories() async {
    setState(() {
      _isLoading = true;
      _status = 'جاري رفع التصنيفات...';
    });

    try {
      await _uploadService.uploadCategories();
      setState(() {
        _status = '✅ تم رفع التصنيفات بنجاح!';
      });
    } catch (e) {
      setState(() {
        _status = '❌ خطأ: $e';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _clearCategories() async {
    setState(() {
      _isLoading = true;
      _status = 'جاري مسح التصنيفات...';
    });

    try {
      await _uploadService.clearCategories();
      setState(() {
        _status = '✅ تم مسح التصنيفات بنجاح!';
      });
    } catch (e) {
      setState(() {
        _status = '❌ خطأ: $e';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('رفع بيانات التصنيفات')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_isLoading)
              const Column(
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text('جاري المعالجة...'),
                ],
              )
            else
              Column(
                children: [
                  ElevatedButton(
                    onPressed: _uploadCategories,
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    child: const Text('رفع التصنيفات'),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _clearCategories,
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      backgroundColor: Colors.red,
                    ),
                    child: const Text('مسح التصنيفات'),
                  ),
                ],
              ),
            const SizedBox(height: 24),
            if (_status.isNotEmpty)
              Text(
                _status,
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
          ],
        ),
      ),
    );
  }
}
