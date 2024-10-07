import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_5237_provider/provider/home/proposal_provider.dart';
import 'package:provider/provider.dart';

import '../../constants/assets.dart';
import '../../constants/color.dart';
import '../../widgets/contract_widgets.dart';

class HandshakeWidget extends StatefulWidget {
  const HandshakeWidget({super.key});

  @override
  State<HandshakeWidget> createState() => _HandshakeWidgetState();
}

class _HandshakeWidgetState extends State<HandshakeWidget> {
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
        return status == 'submitted';
      }).toList();

      return SingleChildScrollView(
        child: Center(
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
                    title1:
                        '${proposal.clientDetails?.firstName ?? ''} ${proposal.clientDetails?.lastName ?? ''}',
                    subtitle: proposal.createdAt ?? '',
                    tralingicon: Assets.message,
                    tralingtext:
                        '\$${proposal.proposedBudget?.numberDecimal ?? ''}',
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
        ),
      );
    });
  }
}
