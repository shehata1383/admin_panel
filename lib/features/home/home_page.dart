import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../controller/category/category_controller.dart';
import '../../controller/home_controller/home_controller.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/images.dart';
import '../../core/widget/custom_image_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeControllerImp>(
      init: HomeControllerImp(),
      builder: (homeControllerImp) {
        return Scaffold(
          backgroundColor: Colors.grey[50], // خلفية هادئة تبرز البطاقات البيضاء
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                // ==================== start Appbar ====================
                Container(
                  padding: EdgeInsetsDirectional.only(
                    start: 16.w,
                    end: 16.w,
                    top:
                        MediaQuery.of(context).padding.top +
                        10.h, // مراعاة حافة الشاشة العلوية (Notch)
                    bottom: 20.h,
                  ),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.themApp,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25.r),
                      bottomRight: Radius.circular(25.r),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(Images.logo, width: 45.w, height: 45.h),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.map_outlined,
                              color: Colors.white,
                              size: 28.sp,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12.h),
                      Row(
                        children: [
                          Text(
                            "welcome".tr,
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: 6.w),
                          Text(
                            homeControllerImp.name,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15.h),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: double.infinity,
                          height: 48.h,
                          padding: EdgeInsets.symmetric(horizontal: 12.w),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.r),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.search_rounded,
                                color: Colors.grey[600],
                                size: 22.sp,
                              ),
                              SizedBox(width: 10.w),
                              Expanded(
                                // تأمين النص من الـ Overflow في اللغات المختلفة
                                child: Text(
                                  "Search for medications or pharmacies...".tr,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.grey[400],
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // ==================== end Appbar ====================
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20.h),

                      // ==================== start categories ====================
                      Text(
                        "Categories".tr,
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 12.h),

                      // حالة فحص تحميل الأقسام
                      homeControllerImp.listCategories.isEmpty
                          ? const Center(child: CircularProgressIndicator())
                          : SizedBox(
                              height: 95
                                  .h, // زيادة مرنة لمنع كتم النصوص السفلية للأقسام
                              width: double.infinity,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                physics: const BouncingScrollPhysics(),
                                itemCount:
                                    homeControllerImp.listCategories.length,
                                itemBuilder: (context, i) {
                                  var category =
                                      homeControllerImp.listCategories[i];
                                  return GestureDetector(
                                    onTap: () async {
                                      await Get.find<CategoryControllerImp>()
                                          .getProductsCategory(
                                            categoryId: category.id,
                                          );
                                      // Get.to(
                                      //   () => CategoryScreen(
                                      //     image: category.icon,
                                      //     title: category.name,
                                      //   ),
                                      // );
                                    },
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.only(
                                        end: 14.w,
                                      ),
                                      child: Column(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(12.w),
                                            decoration: BoxDecoration(
                                              color: AppColors.themApp
                                                  .withOpacity(0.08),
                                              borderRadius:
                                                  BorderRadius.circular(16.r),
                                            ),
                                            child: Image.asset(
                                              category.icon,
                                              width: 32.w,
                                              height: 32.h,
                                              errorBuilder:
                                                  (
                                                    context,
                                                    error,
                                                    stackTrace,
                                                  ) => Icon(
                                                    Icons.category_outlined,
                                                    color: AppColors.themApp,
                                                    size: 32.w,
                                                  ),
                                            ),
                                          ),
                                          SizedBox(height: 6.h),
                                          Text(
                                            category.name,
                                            style: TextStyle(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black87,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),

                      SizedBox(height: 15.h),

                      // ==================== start Best Selling products ====================
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Best Selling Products".tr,
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          TextButton(
                            // استبدال الكاستم بوتن بـ TextButton لمرونة النص والترجمة
                            onPressed: () {},
                            child: Text(
                              "View All".tr,
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                                color: AppColors.themApp,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.h),

                      // حالة فحص تحميل المنتجات الأكثر مبيعاً
                      homeControllerImp.listBestProducts.isEmpty
                          ? const Center(
                              child: Padding(
                                padding: EdgeInsets.all(20.0),
                                child: CircularProgressIndicator(),
                              ),
                            )
                          : GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount:
                                  homeControllerImp.listBestProducts.length > 6
                                  ? 6 // يفضل دائماً الأعداد الزوجية في الـ Grid (2, 4, 6) لمنع الفراغات بآخر الصف
                                  : homeControllerImp.listBestProducts.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 14.h,
                                    crossAxisSpacing: 14.w,
                                    childAspectRatio:
                                        0.78, // الحل الذهبي البديل لـ mainAxisExtent لضمان تجاوب الطول مع العرض تلقائياً
                                  ),
                              itemBuilder: (context, i) {
                                var product =
                                    homeControllerImp.listBestProducts[i];
                                return GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    padding: EdgeInsets.all(10.w),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(16.r),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.08),
                                          spreadRadius: 1,
                                          blurRadius: 8,
                                          offset: const Offset(0, 4),
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          // تجعل محتوى الصورة يأخذ المساحة العلوية المتاحة بمرونة
                                          child: Center(
                                            child: CustomImageWidget(
                                              image: product.productImage,
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 8.h),
                                        Text(
                                          product.productName,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black87,
                                          ),
                                        ),
                                        SizedBox(height: 2.h),
                                        Text(
                                          product.pharmacyName,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 11.sp,
                                            color: Colors.grey[500],
                                          ),
                                        ),
                                        SizedBox(height: 6.h),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                "${NumberFormat("#,###.##").format(product.price)} L.E",
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  fontSize: 13.sp,
                                                  fontWeight: FontWeight.bold,
                                                  color: AppColors.themApp,
                                                ),
                                              ),
                                            ),
                                            Icon(
                                              Icons.add_circle_rounded,
                                              color: AppColors.themApp,
                                              size: 24.sp,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                      SizedBox(height: 25.h), // مسافة أمان نهائية مريحة بالأسفل
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
