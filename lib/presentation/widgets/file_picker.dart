import 'dart:io';
import 'dart:math'; // Import the dart:math library
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:path/path.dart';
import 'package:intl/intl.dart'; //

class FilePickerWidget extends StatefulWidget {
  final Function(XFile?) onFilePicked; // Callback to parent

  const FilePickerWidget({super.key, required this.onFilePicked});

  @override
  _FilePickerWidgetState createState() => _FilePickerWidgetState();
}

class _FilePickerWidgetState extends State<FilePickerWidget> {
  final ImagePicker _picker = ImagePicker();
  XFile? _selectedFile;

  Future<void> _pickFile() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedFile = pickedFile;
      });
      widget.onFilePicked(_selectedFile);
    }
  }

  void _removeFile() {
    setState(() {
      _selectedFile = null;
    });
    widget.onFilePicked(null);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _pickFile,
      child: Container(
        height: 80.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey),
        ),
        child: Center(
          child: _selectedFile != null
              ? Row(
                  children: [
                    const SizedBox(width: 8),
                    SvgPicture.asset(
                      "assets/icons/fa-solid_file-pdf.svg",
                      color: Colors.red,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            basename(_selectedFile!.path),
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            _getFileSize(_selectedFile!),
                            style: const TextStyle(
                              fontSize: 11,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.clear, color: Colors.red),
                      onPressed: _removeFile,
                    ),
                  ],
                )
              : _buildPlaceholder(),
        ),
      ),
    );
  }

  String _getFileSize(XFile file) {
    final bytes = File(file.path).lengthSync();
    return _formatBytes(bytes, 2);
  }

  String _formatBytes(int bytes, int decimals) {
    if (bytes <= 0) return "0 B";
    const suffixes = ["B", "KB", "MB", "GB", "TB"];
    final i = (log(bytes) / log(1024)).floor();
    return '${(bytes / pow(1024, i)).toStringAsFixed(decimals)} ${suffixes[i]}';
  }

  Widget _buildPlaceholder() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "+Attach Images",
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: Colors.grey,
          ),
        ),
        SvgPicture.asset(
          "assets/images/ant-design_file-image-twotone.svg",
          height: 24.0,
        ),
      ],
    );
  }
}
