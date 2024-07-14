import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smart_tailor/core/common_widgets/adaptive_bottom_sheet.dart';
import 'package:smart_tailor/core/common_widgets/adaptive_diolog.dart';
import 'package:smart_tailor/core/common_widgets/text_field.dart';
import 'package:smart_tailor/core/constants/app_colors.dart';
import 'package:smart_tailor/core/utils/validate_mixin.dart';
import 'package:smart_tailor/features/organization/cubit/organization_cubit.dart';

class CreateOrganizationScreen extends StatefulWidget {
  const CreateOrganizationScreen({super.key});

  @override
  State<CreateOrganizationScreen> createState() =>
      _CreateOrganizationScreenState();
}

class _CreateOrganizationScreenState extends State<CreateOrganizationScreen>
    with FieldValidation {
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  File? _image;
  bool _imageSelected = true;
  Future<void> _getImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {}
    });
  }

  void _checkImage() {
    if (_image == null) {
      setState(() {
        _imageSelected = false;
      });
    } else {
      setState(() {
        _imageSelected = true;
      });
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Организация'),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextFiled(
                    validator: validateInput,
                    controller: _nameController,
                    labelText: 'Название*',
                    hintText: 'максимум 50 символов, минимум 5',
                  ),
                  CustomTextFiled(
                    validator: validateInput,
                    controller: _descriptionController,
                    labelText: 'Описание*',
                    hintText: 'максимум 50 символов, минимум 5',
                  ),
                  CustomPhotoButtom(
                    imageSelected: _imageSelected,
                    hintText:
                        _image != null ? 'Изменить фото' : 'Загрузить фото',
                    labelText: 'Ваш логотип*',
                    onTap: () {
                      AdaptiveBottomSheet.showImageSourceActionSheet(
                        context: context,
                        button1: 'Сделать фотографию',
                        button2: 'Выбрать фотографию',
                        onPressed1: () {
                          _getImage(ImageSource.camera);
                          Navigator.pop(context);
                          setState(() {
                            _imageSelected = true;
                          });
                        },
                        onPressed2: () {
                          _getImage(ImageSource.gallery);
                          Navigator.pop(context);
                          setState(() {
                            _imageSelected = true;
                          });
                        },
                      );
                    },
                    image: _image,
                  ),
                  if (!_imageSelected) ...[
                    const SizedBox(height: 8),
                    const Padding(
                      padding: EdgeInsets.only(left: 12),
                      child: Text(
                        'Требуется фотография',
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      ),
                    )
                  ]
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 50,
            child: SizedBox(
              width: MediaQuery.sizeOf(context).width - 32,
              child: ElevatedButton(
                onPressed: () {
                  _checkImage();
                  if (_formKey.currentState!.validate() && _imageSelected) {
                    showDialog(
                      context: context,
                      builder: (context) => AdaptiveAlertDiolog(
                        title: 'Ура! 🎉',
                        content: 'Вы создали новую организацию!',
                        button1: 'Понятно',
                        onPressed1: () {
                          context.read<OrganizationCubit>().organizationExist();
                          Navigator.of(context).pop();
                          Navigator.of(context).pop();
                        },
                      ),
                    );
                  }
                },
                child: const Text('Создать'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomPhotoButtom extends StatelessWidget {
  final void Function()? onTap;
  final bool imageSelected;
  final String hintText;
  final String labelText;
  final File? image;
  const CustomPhotoButtom({
    super.key,
    this.onTap,
    required this.hintText,
    required this.labelText,
    required this.imageSelected,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Ваш логотип*',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black.withOpacity(0.6),
          ),
        ),
        const SizedBox(height: 8),
        InkWell(
          borderRadius: BorderRadius.circular(6),
          onTap: onTap,
          child: Ink(
            width: MediaQuery.sizeOf(context).width,
            padding: const EdgeInsets.only(left: 12, top: 15, bottom: 12),
            decoration: BoxDecoration(
              border: Border.all(
                color: imageSelected ? Colors.white : Colors.red,
              ),
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              hintText,
              style: TextStyle(
                fontSize: 16,
                color: image != null ? Colors.black : AppColors.darkGrey,
              ),
            ),
          ),
        ),
        if (image != null) ...[
          const SizedBox(height: 8),
          Container(
            width: 60,
            height: 60,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: FileImage(image!),
              ),
            ),
          ),
        ],
      ],
    );
  }
}

class CustomTextFiled extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController _controller;
  final String? Function(String?)? validator;
  const CustomTextFiled({
    super.key,
    required TextEditingController controller,
    required this.labelText,
    required this.hintText,
    this.validator,
  }) : _controller = controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: TextStyle(
            fontSize: 16,
            color: Colors.black.withOpacity(0.6),
          ),
        ),
        const SizedBox(height: 8),
        MyTextField(
          controller: _controller,
          hintText: hintText,
          validator: validator,
          borderColor: Colors.white,
        ),
        const SizedBox(height: 14),
      ],
    );
  }
}
