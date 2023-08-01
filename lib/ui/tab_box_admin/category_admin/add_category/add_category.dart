import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:planeta_uz/data/model/category_model.dart';
import 'package:planeta_uz/provider/category_provider.dart';
import 'package:planeta_uz/ui/tab_box_admin/category_admin/add_category/upload_img.dart';
import 'package:planeta_uz/ui/utils/global_textf.dart';
import 'package:provider/provider.dart';

class CategoryADD extends StatefulWidget {
  const CategoryADD({super.key});

  @override
  State<CategoryADD> createState() => _CategoryADDState();
}

class _CategoryADDState extends State<CategoryADD> {
  XFile? _imageFile;
  String? _imageUrl;

  Future<void> _pickImage() async {
    XFile? pickedFile = await pickImage();
    setState(() {
      _imageFile = pickedFile;
    });
  }

  Future<void> _uploadImage() async {
    String? downloadUrl = await uploadImageToFirebase(_imageFile);
    setState(() {
      _imageUrl = downloadUrl;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Category Add"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.h),
        child: ListView(
          children: [
            SizedBox(height: 10.h),
            const Text('Name'),
            SizedBox(height: 10.h),
            GlobalTextField(
                hintText: "Add Category name",
                textAlign: TextAlign.start,
                controller:
                    context.read<CategoryProvider>().categoryNamecontroller),
            SizedBox(height: 10.h),
            const Text('Description'),
            SizedBox(height: 10.h),
            GlobalTextField(
                hintText: "Add Category description",
                maxLines: 5,
                textAlign: TextAlign.start,
                controller:
                    context.read<CategoryProvider>().categoryDesccontroller),
            SizedBox(height: 10.h),
            ElevatedButton(
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.redAccent),
              ),
              onPressed: () async {
                await _pickImage();

                await _uploadImage();
              },
              child: _imageFile != null
                  ? Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.file(
                File(
                    _imageFile!.path,
                ),
                height: 70,
              ),
                  )
                  : const Text('Upload image'),
            ),
            const SizedBox(width: 20),
            ElevatedButton(
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Color(0xFFF83758)),
              ),
              onPressed: () {
                print(_imageUrl);
                if (context
                        .read<CategoryProvider>()
                        .categoryNamecontroller
                        .text
                        .isNotEmpty &&
                    context
                        .read<CategoryProvider>()
                        .categoryDesccontroller
                        .text
                        .isNotEmpty &&
                    _imageUrl != null) {
                  context.read<CategoryProvider>().addCategory(
                        context: context,
                        categoryModel: CategoryModel(
                          categoryId: '',
                          categoryName: context
                              .read<CategoryProvider>()
                              .categoryNamecontroller
                              .text,
                          description: context
                              .read<CategoryProvider>()
                              .categoryDesccontroller
                              .text,
                          imageUrl: _imageUrl!,
                          createdAt: DateTime.now().toString(),
                        ),
                      );
                  Navigator.pop(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Maydonlar to\'ldirilmagan'),
                    ),
                  );
                }
              },
              child: const Text(
                "Add Category",
              ),
            ),
          ],
        ),
      ),
    );
  }
}