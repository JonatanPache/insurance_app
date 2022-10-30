import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:insurance_app/src/pages/dashboard/side_menu_page.dart';
import 'package:insurance_app/src/pages/enums.dart';
import 'package:insurance_app/src/utils/component/appBarActionItems.dart';
import 'package:insurance_app/src/utils/component/barChartComponent.dart';
import 'package:insurance_app/src/utils/component/custom_bottom_nav_bar.dart';
import 'package:insurance_app/src/utils/component/header.dart';
import 'package:insurance_app/src/utils/component/historyTable.dart';
import 'package:insurance_app/src/utils/component/infoCard.dart';
import 'package:insurance_app/src/utils/component/paymentDatilList.dart';
import 'package:insurance_app/src/utils/config/responsive.dart';
import 'package:insurance_app/src/utils/config/size_config.dart';
import 'package:insurance_app/src/utils/style/colors.dart';
import 'package:insurance_app/src/utils/style/style.dart';

class DashboardPage extends StatelessWidget {
  //const DashboardPage({Key key}) : super(key: key);
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      bottomNavigationBar: CustomBottomNavBar(
        selectMenu: MenuState.dashboard,
      ),
      /*key: _drawerKey,
      drawer: SizedBox(width: 60, child: SideMenu()),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.white,
        /*leading: IconButton(
          onPressed: () {
            _drawerKey.currentState.openDrawer();
          },
          icon: Icon(
            Icons.menu,
            color: AppColors.black,
          ),
        ),
        actions: [AppBarActionItems()],*/
      ),*/
      body: SafeArea(
          child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: 130,
              child: SafeArea(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Header(),
                      SizedBox(height: SizeConfig.blockSizeVertical * 3),
                      // buscador
                      TextField(
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: AppColors.white,
                            contentPadding:
                                EdgeInsets.only(left: 5.0, right: 5),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(color: AppColors.white)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(color: AppColors.white)),
                            prefixIcon: Icon(
                              Icons.search,
                              color: AppColors.black,
                            ),
                            hintText: 'Buscar',
                            hintStyle: TextStyle(
                                color: AppColors.secondary, fontSize: 14)),
                      ),
                      SizedBox(height: 40),
                      SizedBox(
                        width: SizeConfig.screenWidth,
                        child: Wrap(
                          spacing: 10,
                          runSpacing: 15,
                          alignment: WrapAlignment.spaceBetween,
                          children: [
                            InfoCard(
                              icon: 'assets/svg/transfer.svg',
                              label: 'Cotizar       \nOnline',
                              amount: '\$150',
                            ),
                            InfoCard(
                              icon: 'assets/svg/car.svg',
                              label: 'Reportar         \nSiniestro   ',
                              amount: '\$1500',
                            ),
                            InfoCard(
                              icon: 'assets/svg/invoice.svg',
                              label: 'Validar Poliza \nVia QR',
                              amount: '\$1500',
                            ),
                            InfoCard(
                              icon: 'assets/svg/credit-card.svg',
                              label: 'Pagar poliza \nCard numero',
                              amount: '\$1200',
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: SizeConfig.blockSizeVertical * 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              /*PrimaryText(
                                  text: 'Balance',
                                  size: 16,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.secondary,
                                ),
                                PrimaryText(
                                  text: 'as',
                                  size: 30,
                                  fontWeight: FontWeight.w800,
                                )*/
                            ],
                          ),
                          /*PrimaryText(
                              text: 'Past 30 days',
                              size: 16,
                              fontWeight: FontWeight.w400,
                              color: AppColors.secondary,
                            ),*/
                        ],
                      ),
                      SizedBox(height: SizeConfig.blockSizeVertical * 3),
                      /*Container(
                          height: 180,
                          child: BarChartComponent(),
                        ),*/
                      SizedBox(height: SizeConfig.blockSizeVertical * 5),
                      /*Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            PrimaryText(
                              text: 'Historia',
                              size: 30,
                              fontWeight: FontWeight.w800,
                            ),
                            PrimaryText(
                              text: 'Transacciones ultimos 6 meses',
                              size: 16,
                              fontWeight: FontWeight.w400,
                              color: AppColors.secondary,
                            ),
                          ],
                        ),*/
                      SizedBox(height: SizeConfig.blockSizeVertical * 3),
                      //HistoryTable(),
                      //if(!Responsive.isDesktop(context)) PaymentDetailList()
                    ],
                  ),
                ),
              )),
          if (Responsive.isDesktop(context))
            Expanded(
              flex: 4,
              child: SafeArea(
                child: Container(
                    width: double.infinity,
                    height: SizeConfig.screenHeight,
                    decoration: BoxDecoration(color: AppColors.secondaryBg),
                    child: SingleChildScrollView(
                      padding:
                          EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                      child: Column(
                        children: [
                          //AppBarActionItems(),
                          //PaymentDetailList(),
                        ],
                      ),
                    )),
              ),
            ),
        ],
      )),
    );
  }
}
