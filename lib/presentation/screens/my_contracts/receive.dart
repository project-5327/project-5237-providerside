import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_5237_provider/presentation/constants/assets.dart';
import 'package:project_5237_provider/presentation/widgets/contract_widgets.dart';
import 'package:project_5237_provider/provider/home/proposal_provider.dart';

import 'package:provider/provider.dart';

import '../../constants/color.dart';

class ReceivedProposal extends StatefulWidget {
  const ReceivedProposal({super.key});

  @override
  State<ReceivedProposal> createState() => _ReceivedProposalState();
}

class _ReceivedProposalState extends State<ReceivedProposal> {
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
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
                  tralingtext:
                      '\$${proposal.proposedBudget?.numberDecimal ?? ""}',
                  btnText: proposal.status ?? '',
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
