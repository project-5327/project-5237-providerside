import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_5237_provider/presentation/constants/fonts.dart';
import 'package:project_5237_provider/presentation/constants/responsive_view.dart';
import 'package:project_5237_provider/presentation/screens/login_register/Add_projects.dart';

import 'package:project_5237_provider/presentation/screens/login_register/home_screen.dart';
import 'package:project_5237_provider/presentation/screens/login_register/message.dart';
import 'package:project_5237_provider/presentation/screens/main_screen%20.dart';
import 'package:project_5237_provider/presentation/screens/milestones/milestone.dart';
import 'package:project_5237_provider/presentation/screens/update_Project/chat_screen.dart';

class DashBoardView extends StatefulWidget {
  // final int? currentIndex;
  const DashBoardView({super.key});

  @override
  State<DashBoardView> createState() => _DashBoardViewState();
}

class _DashBoardViewState extends State<DashBoardView> {
  int _currentIndex = 0;
  // final List<Widget> _pages = const [
  //   AddProjects(),
  //   Scaffold(),
  //   Scaffold(),
  //   AddProjects(),
  //   AddProjects(),
  // ];
  final List<Widget> _pages = [
    const HomeScreen(),
    const MilestoneScreen(),
    const MessageScreen(),
    const ChatScreen(),
    const AddProjects(),

    // //0
    // const HomeProjectDetails(),
    // const ProposalScreen(),
    // const SuccesfullyScreen(),
    // const NotificationScreen(),

    // const BookedClient(),
    // const AddProjects(),
    // const AddProject1(),
    // const ForgetPasswordScreen(),
    // const OtpScreen(),
    // const ChangePassword(),
    // const MilestoneScreen(),
    // const MycontractScreen(),
    // //2
    // const ChatScreen(),
  ];
  SideMenuController sideMenu = SideMenuController();
  PageController pageController = PageController();

  @override
  void initState() {
    // Connect SideMenuController and PageController together
    sideMenu.addListener((index) {
      pageController.jumpToPage(index);
    });
    setState(() {
      // _currentIndex = widget.currentIndex ?? 0;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveView(
      mobile: _mobile(),
      tablet: _desktop(context),
      desktop: _desktop(context),
    );
  }

  Widget _mobile() {
    return MainScreen();
  }

  _desktop(BuildContext context) {
    final responsive = ResponsiveCheck(context);
    sideMenu.changePage(0);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: responsive.isTablet ? AppBar() : _appBar(context),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SideMenu(
            // collapseWidth: responsive.isTablet ? 80 : 260,
            // alwaysShowFooter: true,

            controller: sideMenu,
            style: SideMenuStyle(
              openSideMenuWidth: 200,
              compactSideMenuWidth: 100,
              selectedTitleTextStyleExpandable: TextStyle(
                  fontFamily: Fonts.fontsinter,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: const Color.fromRGBO(34, 49, 63, 1)),
              unselectedTitleTextStyle: TextStyle(
                  fontFamily: Fonts.fontsinter,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: const Color.fromRGBO(34, 49, 63, 1)),
              decoration: const BoxDecoration(
                border: Border(
                  right: BorderSide(
                    color: Color.fromRGBO(215, 220, 224, 1),
                  ),
                ),
              ),
              showTooltip: true,
              itemBorderRadius: const BorderRadius.all(Radius.circular(10)),
              displayMode: responsive.isTablet
                  ? SideMenuDisplayMode.compact
                  : SideMenuDisplayMode.auto,
              showHamburger: false,
              hoverColor: const Color.fromRGBO(0, 100, 210, 0.1),
              selectedHoverColor: Colors.blue[100],
              selectedColor: const Color.fromRGBO(0, 100, 210, 0.1),
              selectedTitleTextStyle:
                  const TextStyle(color: Color.fromRGBO(34, 49, 63, 1)),
              selectedIconColor: Colors.blue,
              backgroundColor: Colors.white,
              unselectedIconColor: const Color.fromRGBO(34, 49, 63, 1),
              itemOuterPadding:
                  const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
            ),
            items: [
              SideMenuItem(
                title: 'Home',
                onTap: (index, _) {
                  sideMenu.changePage(index);
                },
                icon: const Icon(Icons.home_filled),
                // badgeContent: const Text(
                //   '3',
                //   style: TextStyle(color: Colors.white),
                // ),
                tooltipContent: "This is a tooltip for Dashboard item",
              ),
              SideMenuItem(
                title: 'Projects',
                onTap: (index, _) {
                  sideMenu.changePage(index);
                },
                icon: const Icon(Icons.group_outlined),
              ),
              SideMenuItem(
                title: 'Payment',
                onTap: (index, _) {
                  sideMenu.changePage(index);
                },
                icon: const Icon(Icons.card_travel_outlined),
              ),
              SideMenuItem(
                title: 'Messages',
                onTap: (index, _) {
                  sideMenu.changePage(index);
                },
                icon: const Icon(Icons.chat_bubble),
              ),
              SideMenuItem(
                title: 'My Project',
                onTap: (index, _) {
                  sideMenu.changePage(index);
                },
                icon: const Icon(Icons.message),
              ),
            ],
            footer: responsive.isTablet
                ? null
                : Container(
                    height: 300,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    width: double.infinity,
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/cat.png",
                          height: 68,
                          width: 113,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "First steps",
                          style: TextStyle(
                            fontFamily: Fonts.fontsinter,
                            fontSize: 12,
                            color: const Color.fromRGBO(64, 81, 137, 1),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "Customize your dashboard and lean about out features",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: Fonts.fontsinter,
                            fontSize: 12,
                            color: const Color.fromRGBO(64, 81, 137, 1),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextButton(
                          child: Text(
                            "Get Started",
                            style: TextStyle(
                              fontFamily: Fonts.fontsinter,
                              fontSize: 12,
                              color: const Color.fromRGBO(0, 100, 210, 1),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          onPressed: () {},
                        ),
                        const SizedBox(height: 40),
                        Row(
                          children: [
                            SvgPicture.asset(
                                "assets/svg_icon/majesticons_logout.svg"),
                            const SizedBox(width: 10),
                            Text(
                              "Logout",
                              style: TextStyle(
                                fontFamily: Fonts.fontsinter,
                                fontSize: 18,
                                color: const Color.fromRGBO(34, 49, 63, 1),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
          ),
          const VerticalDivider(
            width: 0,
          ),
          Expanded(
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: pageController,
              children: _pages,
            ),
          ),
        ],
      ),
    );
  }

  Widget _appBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(
          border: Border(
        bottom: BorderSide(color: Color.fromRGBO(215, 220, 224, 1)),
      )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 15,
                backgroundImage: NetworkImage(
                  'https://upload.wikimedia.org/wikipedia/commons/thumb/3/32/Googleplex_HQ_%28cropped%29.jpg/1200px-Googleplex_HQ_%28cropped%29.jpg', // Replace with your image URL
                ),
              ),
              const SizedBox(width: 20),
              Text(
                "App Name",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  fontFamily: Fonts.fontsinter,
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.height * 0.4,
                  child: TextFormField(
                    validator: (value) {
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: const TextStyle(
                          color: Color.fromRGBO(215, 220, 224, 1),
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                      fillColor: Colors.white,
                      filled: true,
                      contentPadding: const EdgeInsets.symmetric(vertical: 10),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(top: 12, bottom: 12),
                        child: SvgPicture.asset(
                          'assets/icons/search.svg',
                          width: 18.0,
                          height: 18.0,
                          color: Color.fromRGBO(215, 220, 224, 1),
                        ),
                      ),
                      // contentPadding: const EdgeInsets.symmetric(horizontal: 5),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          width: 1,
                          color: Color.fromRGBO(215, 220, 224, 1),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          width: 1,
                          color: Color.fromRGBO(215, 220, 224, 1),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          width: 1,
                          color: Color.fromRGBO(215, 220, 224, 1),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              SvgPicture.asset(
                "assets/svg_icon/notifica.svg",
                height: 32,
                width: 32,
              ),
              const SizedBox(width: 20),
              Container(
                height: 55,
                width: 218,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 14),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(0, 100, 210, 0.1),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 15,
                          backgroundImage: NetworkImage(
                            'https://upload.wikimedia.org/wikipedia/commons/thumb/3/32/Googleplex_HQ_%28cropped%29.jpg/1200px-Googleplex_HQ_%28cropped%29.jpg', // Replace with your image URL
                          ),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Jos Creative",
                              style: TextStyle(
                                fontFamily: Fonts.fontsinter,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              "Client",
                              style: TextStyle(
                                fontFamily: Fonts.fontsinter,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    IconButton(
                      icon: const Icon(Icons.arrow_drop_down_outlined),
                      onPressed: () {},
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
