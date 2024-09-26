import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:project_5237_provider/presentation/constants/color.dart';
import 'package:project_5237_provider/provider/home/proposal_provider.dart';
import 'package:provider/provider.dart';

import '../../constants/assets.dart';
import '../../widgets/contract_widgets.dart';

class SendScreen extends StatefulWidget {
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
      final proposals = proposalProvider.proposalByUser?.data;
      debugPrint("proposal data ========> ${proposals}");
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
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: proposals.length,
                  itemBuilder: (context, index) {
                    final proposal = proposals![index];

                    return InkWell(
                      //  onTap: () => _handleProjectTileTap(0),
                      child: ProjectTile2(
                        proposal: proposal,
                        image: Assets.bag,
                        title: proposal.projectId?.title,
                        title1:
                            '${proposal.clientDetails?.firstName} ${proposal.clientDetails?.lastName}',
                        subtitle: proposal.createdAt,
                        trailingText:
                            '\$${(proposal.proposedBudget?.numberDecimal)}',
                        image1: proposal.clientDetails?.profileImage ??
                            'https://pub-261021c7b68740ffba855a7e8a6f3c1e.r2.dev/undefined/vasily-koloda-8CqDvPuo_kI-unsplash.jpg',
                      ),
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
  const PdfContainer({super.key});

  @override
  _PdfContainerState createState() => _PdfContainerState();
}

class _PdfContainerState extends State<PdfContainer> {
  String fileName = 'Choose File';
  String fileSize = '0 KB';

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      // Get the file name and size
      setState(() {
        fileName = result.files.first.name;
        fileSize =
            '${result.files.first.size / 1024} KB'; // Convert bytes to KB
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
          color: Color(0xffBEBEBE),
          border: Border.all(width: 1.16),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(Assets.pdf),
            SizedBox(
              width: 10.w,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(fileName), // Display the selected file name
                Text(fileSize), // Display the file size
              ],
            )
          ],
        ),
      ),
    );
  }
}

class TextWidget extends StatelessWidget {
  final String text;
  final fontFamily;
  final size;
  final align;
  final Color color;
  final fontweight;
  const TextWidget(
      {super.key,
      required this.text,
      this.size,
      this.align,
      required this.color,
      this.fontweight,
      this.fontFamily});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: size,
          fontWeight: fontweight,
          color: color,
          fontFamily: fontFamily),
    );
  }
}
