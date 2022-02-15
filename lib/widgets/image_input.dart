import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import "package:path/path.dart" as path;
import 'package:path_provider/path_provider.dart' as syspath;

class ImageInput extends StatefulWidget {
  final Function returnFinalImg;
  const ImageInput(this.returnFinalImg, {Key? key}) : super(key: key);

  @override
  _ImageInputState createState() => _ImageInputState();
}

File? _pickedImage;

class _ImageInputState extends State<ImageInput> {
  Future<void> takePic() async {
    final imageInput = ImagePicker();
    final img =
        await imageInput.pickImage(source: ImageSource.camera, maxWidth: 600);
    setState(() {
      if (img?.path == null) {
        return;
      }
      _pickedImage = File(img!.path);
    });
    if (img?.path == null) {
      return;
    }

    final appDir = await syspath.getApplicationDocumentsDirectory();
    final imgName = path.basename(img!.path);
    final finalImage = await _pickedImage?.copy('${appDir.path}/$imgName');
    widget.returnFinalImg(finalImage);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 100,
          width: 150,
          decoration: BoxDecoration(border: Border.all()),
          child: _pickedImage != null
              ? Image.file(
                  _pickedImage!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )
              : const Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 2.0,
                    color: Colors.black,
                  ),
                ),
        ),
        InkWell(
          onTap: () {
            takePic();
          },
          child: Row(
            children: const [
              Icon(Icons.camera_alt_sharp),
              Text("TAKE PICTURE"),
            ],
          ),
        )
      ],
    );
  }
}
