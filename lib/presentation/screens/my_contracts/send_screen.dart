import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_5237_provider/presentation/constants/color.dart';
import 'package:project_5237_provider/provider/home/proposal_provider.dart';
import 'package:provider/provider.dart';
import 'package:path/path.dart' as path;

import '../../constants/assets.dart';
import '../../widgets/contract_widgets.dart';

class SendScreen extends StatefulWidget {
  const SendScreen({super.key});

  @override
  _SendScreenState createState() => _SendScreenState();
}

class _SendScreenState extends State<SendScreen> {
  int? expandedIndex;

  void _handleProjectTileTap(int index) {
    setState(() {
      expandedIndex = expandedIndex == index ? null : index;
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ProposalProvider>(context, listen: false)
          .fetchAllProposal(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProposalProvider>(
        builder: (context, proposalProvider, child) {
      final proposals = proposalProvider.proposalByUser?.data ?? [];
      debugPrint("proposal data ========> $proposals");
      if (proposalProvider.loading) {
        return Center(
          child: CircularProgressIndicator(
            color: MyColors.blue,
          ),
        );
      }
      if (proposals == null || proposals.isEmpty) {
        return const Center(
          child: Text("No proposals available"),
        );
      }
      final filteredProposals = proposals.where((proposal) {
        final status = proposal.status?.toLowerCase();
        return status == 'submitted';
      }).toList();
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: filteredProposals.length,
                  itemBuilder: (context, index) {
                    final proposal = filteredProposals[index];

                    return ProjectTile2(
                      proposal: proposal,
                      image: Assets.bag,
                      title: proposal.projectId?.title ?? "",
                      title1: '${proposal.projectId?.clientId?.userName ?? ''}',
                      subtitle: proposal.createdAt ?? "",
                      trailingText:
                          '\$${(proposal.proposedBudget?.numberDecimal ?? "")}',
                      image1: proposal.clientDetails?.profileImage ??
                          'https://th.bing.com/th/id/R.e5fe7d5b03fa11c16c80a7bddb63dc6c?rik=KPCJr8sgAungvw&riu=http%3a%2f%2fcdn.wallpapersafari.com%2f18%2f4%2ff6SdYa.jpg&ehk=cq1hCv1JtLpCF40gnczGRCHjMcMVlnCCGg7NKrGHhuc%3d&risl=&pid=ImgRaw&r=0',
                    );
                  }),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      );
    });
  }
}

class PdfContainer extends StatefulWidget {
  final String fileName;
  final String fileSize;
  const PdfContainer(
      {super.key, required this.fileName, required this.fileSize});

  @override
  _PdfContainerState createState() => _PdfContainerState();
}

class _PdfContainerState extends State<PdfContainer> {
  String? fileName;
  String? fileSize;

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      // Get the file name and size
      setState(() {
        fileName = path.basename(result.files.first.path!); // Extract file name
        fileSize = '${(result.files.first.size / 1024).toStringAsFixed(2)} KB';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickFile,
      child: Container(
        height: 57.h,
        width: 161.w,
        decoration: BoxDecoration(
          color: const Color(0xffBEBEBE),
          border: Border.all(width: 1.16),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(Assets.pdf),
            SizedBox(width: 10.w),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  fileName ?? widget.fileName,
                  style: TextStyle(fontSize: 12.sp),
                ),
                Text(
                  fileSize ?? widget.fileSize,
                  style: TextStyle(fontSize: 10.sp),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TextWidget extends StatelessWidget {
  final String text;
  final size;
  final align;
  final Color color;
  final String? fontfamily;
  final fontweight;
  const TextWidget(
      {super.key,
      required this.text,
      this.size,
      this.align,
      required this.color,
      this.fontweight,
      this.fontfamily});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: size,
          fontWeight: fontweight,
          color: color,
          fontFamily: fontfamily ?? "Inter"),
    );
  }
}
