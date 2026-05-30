import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/data_upload_controller.dart';

class AdminUploadPage extends StatelessWidget {
  final DataUploadController controller = Get.put(DataUploadController());

  AdminUploadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("لوحة تحكم البيانات"),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.cloud_upload_outlined,
                size: 100,
                color: Colors.indigo,
              ),
              SizedBox(height: 20),
              Text(
                "رفع بيانات المحافظات والمدن",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Obx(
                () => Text(
                  controller.statusMessage.value,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey[700]),
                ),
              ),
              SizedBox(height: 40),
              Obx(
                () => controller.isLoading.value
                    ? CircularProgressIndicator()
                    : ElevatedButton.icon(
                        onPressed: () => controller.startUpload(),
                        icon: Icon(Icons.send),
                        label: Text("ابدأ عملية الرفع الآن"),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 15,
                          ),
                          backgroundColor: Colors.indigo,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
