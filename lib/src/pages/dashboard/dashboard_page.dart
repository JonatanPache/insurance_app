import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:insurance_app/src/pages/dashboard/side_menu_page.dart';
import 'package:insurance_app/src/utils/component/appBarActionItems.dart';
import 'package:insurance_app/src/utils/component/barChartComponent.dart';
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
  GlobalKey<ScaffoldState> _drawerKey=GlobalKey();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      key: _drawerKey,
      drawer: SizedBox(width: 50, child: SideMenu()),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.white,
        leading: IconButton(
          onPressed: (){
            _drawerKey.currentState.openDrawer();
            },
          icon: Icon(
            Icons.menu,
            color: AppColors.black,
          ),
        ),
        actions: [AppBarActionItems()],
      ),
      //appBar: ,
      body: SafeArea(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /*if (Responsive.isDesktop(context))
                Expanded(
                  flex: 1,
                  child: SideMenu(),
                ),*/
              Expanded(
                flex: 28,
                child: SafeArea(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Header(),
                        SizedBox(height: SizeConfig.blockSizeVertical*3),
                        SizedBox(
                          width: SizeConfig.screenWidth,
                          child: Wrap(
                            spacing: 20,
                            runSpacing: 20,
                            alignment: WrapAlignment.spaceBetween,
                            children: [
                              InfoCard(
                                icon: 'assets/svg/credit-card.svg',
                                label: 'Transferencia via \nCard numero',
                                amount: '\$1200',
                              ),
                              InfoCard(
                                icon: 'assets/svg/transfer.svg',
                                label: 'Transferencia via \nOnline Banks',
                                amount: '\$150',
                              ),
                              InfoCard(
                                icon: 'assets/svg/bank.svg',
                                label: 'Transferencia via \nMismo Banco',
                                amount: '\$1500',
                              ),
                              InfoCard(
                                icon: 'assets/svg/invoice.svg',
                                label: 'Transferencia to \nOtro banco',
                                amount: '\$1500',
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: SizeConfig.blockSizeVertical*4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                PrimaryText(
                                  text: 'Balance',
                                  size: 16,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.secondary,
                                ),
                                PrimaryText(
                                  text: 'as',
                                  size: 30,
                                  fontWeight: FontWeight.w800,
                                )
                              ],
                            ),
                            PrimaryText(
                              text: 'Past 30 days',
                              size: 16,
                              fontWeight: FontWeight.w400,
                              color: AppColors.secondary,
                            ),
                          ],
                        ),
                        SizedBox(height: SizeConfig.blockSizeVertical*3),
                        Container(
                          height: 180,
                          child: BarChartComponent(),
                        ),
                        SizedBox(height: SizeConfig.blockSizeVertical*5),
                        Column(
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
                        ),
                        SizedBox(height: SizeConfig.blockSizeVertical*3),
                        HistoryTable(),
                        if(!Responsive.isDesktop(context)) PaymentDetailList()
                      ],
                    ),
                  ),
                )
              ),
              if(Responsive.isDesktop(context))
                Expanded(
                  flex: 4,
                  child: SafeArea(
                    child: Container(
                      width: double.infinity,
                      height: SizeConfig.screenHeight,
                      decoration: BoxDecoration(color: AppColors.secondaryBg),
                      child: SingleChildScrollView(
                        padding: EdgeInsets.symmetric(vertical: 30,horizontal: 30),
                        child: Column(
                          children: [
                            //AppBarActionItems(),
                            //PaymentDetailList(),
                          ],
                        ),
                      )
                    ),
                  ),
                ),
            ],
          )
      ),
    );
  }
}



