import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_5237_provider/presentation/screens/main_screen%20.dart';
import 'package:project_5237_provider/presentation/screens/my_contracts/send_screen.dart';
import 'package:project_5237_provider/provider/home/proposal_provider.dart';
import 'package:provider/provider.dart';

import '../../constants/assets.dart';
import '../../constants/color.dart';
import '../../widgets/contract_widgets.dart';

class MyProposal extends StatefulWidget {
  const MyProposal({super.key});

  @override
  State<MyProposal> createState() => _MyProposalState();
}

class _MyProposalState extends State<MyProposal> {
  TextEditingController searchController = TextEditingController();
  String searchText = '';

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

      // Filtered proposals based on search text
      final filteredProposals = proposals.where((proposal) {
        final projectName = proposal.projectId?.title?.toLowerCase() ?? '';
        final freelancerName =
            '${proposal.clientDetails?.firstName} ${proposal.clientDetails?.lastName}'
                .toLowerCase();

        return projectName.contains(searchText.toLowerCase()) ||
            freelancerName.contains(searchText.toLowerCase());
      }).toList();

      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => MainScreen()));
              },
              icon: const Icon(Icons.arrow_back_ios),
              color: MyColors.black,
            ),
            title: Text(
              'My Proposals',
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 14.h),
                  Center(
                    child: SizedBox(
                      height: 47.h,
                      width: 336.w,
                      child: TextFormField(
                        controller: searchController,
                        onChanged: (value) {
                          setState(() {
                            searchText = value;
                          });
                        },
                        decoration: InputDecoration(
                          suffixIcon: const Icon(CupertinoIcons.search),
                          hintText: 'Search for projects',
                          hintStyle: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w400,
                              color: MyColors.lightGrey),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 16),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: filteredProposals.length,
                      itemBuilder: (context, index) {
                        final proposal = filteredProposals[index];

                        return InkWell(
                          child: ProjectTile1(
                            proposal: proposal,
                            image: Assets.bag,
                            title: proposal.projectId?.title ?? "Project Title",
                            title1:
                                '${proposal.clientDetails?.firstName ?? ''} ${proposal.clientDetails?.lastName ?? ''}',
                            subtitle: proposal.createdAt ?? '',
                            tralingicon: Assets.message,
                            tralingtext:
                                '\$${proposal.proposedBudget?.numberDecimal ?? '0'}',
                            btnText: proposal.status ?? 'Status',
                            btnColor: MyColors.btnColor.withOpacity(0.5),
                            btntextColor: MyColors.black1,
                            image1: proposal.clientDetails?.profileImage ??
                                'https://pub-261021c7b68740ffba855a7e8a6f3c1e.r2.dev/undefined/vasily-koloda-8CqDvPuo_kI-unsplash.jpg',
                          ),
                        );
                      })
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  void _showDialogBox(
    BuildContext context,
    String text,
    String text1,
    String btntext1,
    String btntext2,
  ) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Center(
                child: TextWidget(
                  text: 'Are you Sure?',
                  color: MyColors.btnColor,
                  size: 20.sp,
                  fontweight: FontWeight.w700,
                ),
              ),
              content: RichText(
                text: TextSpan(
                  text: text,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15.sp,
                    color: MyColors.black,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: text1,
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w700,
                        color: MyColors.black,
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: MyColors.btnColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                            side: BorderSide(color: MyColors.btnColor),
                          )),
                      onPressed: () {
                        Get.back();
                      },
                      child: TextWidget(
                        text: btntext1,
                        color: MyColors.white,
                        size: 12.sp,
                        fontweight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: MyColors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: MyColors.btnColor),
                            borderRadius: BorderRadius.circular(100),
                          )),
                      onPressed: () {
                        Get.back();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: TextWidget(
                          text: btntext2,
                          color: MyColors.black,
                          size: 12.sp,
                          fontweight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                )
              ]);
        });
  }
}
