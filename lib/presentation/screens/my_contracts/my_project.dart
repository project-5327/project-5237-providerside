import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
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

  String formatDateTime(String createdAt) {
    DateTime dateTime = DateTime.parse(createdAt);
    String day = DateFormat('EEEE').format(dateTime);
    String date = DateFormat('d MMMM').format(dateTime);
    String time = DateFormat('h:mm a').format(dateTime);
    return "$day, $date - $time";
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
                      //  width: 336.w,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
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

                        return Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                    width: 360.w,
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                              height: 45.h,
                                              width: 45.w,
                                              child:
                                                  SvgPicture.asset(Assets.bag)),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                proposal.projectId?.title ?? "",
                                                style: TextStyle(
                                                    fontSize: 16.sp,
                                                    fontWeight: FontWeight.w600,
                                                    color: MyColors.black),
                                              ),
                                              Text(
                                                  formatDateTime(
                                                      proposal.createdAt ?? ""),
                                                  style: TextStyle(
                                                      fontSize: 10.sp,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color:
                                                          MyColors.lightGrey)),
                                            ],
                                          ),
                                          Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 10,
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                      '\$${proposal.proposedBudget!.numberDecimal.toString()}',
                                                      style: TextStyle(
                                                          fontSize: 13.sp,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color:
                                                              MyColors.green)),
                                                  SizedBox(
                                                    height: 4.h,
                                                  ),
                                                  Container(
                                                    height: 28.h,
                                                    width: 85.w,
                                                    child: Center(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(2.0),
                                                        child: Text(
                                                            proposal.status ??
                                                                "",
                                                            style: TextStyle(
                                                              fontSize: 12.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: _getButtonColors(
                                                                      proposal.status ??
                                                                          "")[
                                                                  'textColor'],
                                                            )),
                                                      ),
                                                    ),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              24.r),
                                                      color: _getButtonColors(
                                                              proposal.status ??
                                                                  "")[
                                                          'buttonColor'],
                                                      // widget.btnColor!
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 5.h,
                                                  ),
                                                ],
                                              ))
                                        ]))
                              ]),
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

  Map<String, Color> _getButtonColors(String status) {
    switch (status.toLowerCase()) {
      case 'rejected':
        return {
          'buttonColor': const Color(0xffFFB2B2),
          'textColor': MyColors.red
        };
      case 'reviewed':
        return {
          'buttonColor': const Color(0xffFFF2B2),
          'textColor': MyColors.black
        };
      case 'accepted':
        return {
          'buttonColor': const Color(0xff447604),
          'textColor': MyColors.white
        };
      case 'submitted':
        return {
          'buttonColor': const Color(0xffB2D6FF),
          'textColor': MyColors.black
        };
      default:
        return {
          'buttonColor': MyColors.btnColor.withOpacity(0.5),
          'textColor': MyColors.black // Default black text
        };
    }
  }
}
