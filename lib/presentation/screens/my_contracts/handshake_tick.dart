import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_5237_provider/provider/home/proposal_provider.dart';
import 'package:provider/provider.dart';

import '../../constants/assets.dart';
import '../../constants/color.dart';
import '../../widgets/contract_widgets.dart';

class HandShakeTick extends StatefulWidget {
  const HandShakeTick({super.key});

  @override
  State<HandShakeTick> createState() => _HandShakeTickState();
}

class _HandShakeTickState extends State<HandShakeTick> {
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
        return status == 'reviewed' ||
            status == 'accepted' ||
            status == 'rejected';
      }).toList();
      if (filteredProposals == null || filteredProposals.isEmpty) {
        return const Center(
          child: Text("No proposals available"),
        );
      }
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 15.h,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: filteredProposals.length,
              itemBuilder: (context, index) {
                final proposal = filteredProposals[index];

                return ProjectTile1(
                  proposal: proposal,
                  image: Assets.bag,
                  title: proposal.projectId?.title ?? "",
                  title1: '${proposal.projectId?.clientId?.userName ?? ''}',
                  subtitle: proposal.createdAt ?? '',
                  tralingicon: Assets.message,
                  tralingtext: '\$${proposal.proposedBudget?.numberDecimal}',
                  btnText: proposal.status,
                  btnColor: MyColors.btnColor.withOpacity(0.5),
                  btntextColor: MyColors.black1,
                  image1: proposal.clientDetails?.profileImage ??
                      'https://pub-261021c7b68740ffba855a7e8a6f3c1e.r2.dev/undefined/vasily-koloda-8CqDvPuo_kI-unsplash.jpg',
                );
              },
            ),
            SizedBox(height: 16.h),
          ],
        ),
      );
    });
  }
}
