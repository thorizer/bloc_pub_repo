// ignore_for_file: lines_longer_than_80_chars, avoid_print
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:gdm_bloc/app.dart';
import 'package:gdm_bloc/asset/asset.dart';
import 'package:gdm_bloc/authentication/authentication.dart';
import 'package:ngi_repository/ngi_repository.dart';
import 'package:quickalert/quickalert.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.assetRepository}) : super(key: key);
  final AssetRepository assetRepository;
  static Route route() {
    return MaterialPageRoute<void>(
      builder: (_) => HomePage(assetRepository: AssetRepository()),
    );
  }

  @override
  Widget build(BuildContext context) {

    final lang = context.locale.toString();
    print('lang ' + lang);
    return RepositoryProvider.value(
      value: assetRepository,
      child: BlocProvider(
        create: (BuildContext context) => AssetBloc(
          assetRepository: assetRepository,
        )
          ..add(SetLanguage(lang))
          ..add(RtAssetsLoaded())
          ..add(RealtimeAssetSubscriptionRequested())
          ..add(AlertSubscriptionRequested()),
        lazy: false,
        child: Scaffold(
          drawerScrimColor: Colors.transparent,
          primary: true,
          //drawer: const LeftDrawer(),
          //endDrawer: const RightDrawer(),
          appBar: AppBar(
            title: Text(
              'Fleet Tracker',
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 5, 81, 143),
              ),
            ),
            toolbarHeight: 46,
            leading: Builder(builder: (context) {
              final dataStatus =
                  context.select((AssetBloc bloc) => bloc.state.dataStatus);
              /* final adressStatus =
                  context.select((AssetBloc bloc) => bloc.state.adressStatus); */
              final noData = dataStatus == DataStatus.initial ||
                  //adressStatus == AdressStatus.initial ||
                  dataStatus == DataStatus.retry ||
                  dataStatus == DataStatus.Unauthorized ||
                  dataStatus == DataStatus.failure;
              return IconButton(
                icon: Icon(
                  MaterialCommunityIcons.car_arrow_right,
                  size: 28,
                  color: noData
                      ? Color.fromARGB(255, 93, 95, 96)
                      : Color.fromARGB(255, 5, 81, 143),
                ),
                onPressed: () =>
                    noData ? null : Scaffold.of(context).openDrawer(),
                alignment: Alignment.centerLeft,
              );
            }),
            elevation: 0,
            centerTitle: false,
            leadingWidth: 35,
            backgroundColor: Color.fromARGB(0, 26, 70, 133),
            actions: [
              Builder(builder: (context) {
                final user = context.select(
                  (AuthenticationBloc bloc) => '${bloc.state.user!.first_name}',
                );
                return Align(
                  alignment: Alignment.centerRight,
                  child: Text(user,
                      style: TextStyle(
                        color: Color.fromARGB(255, 5, 81, 143),
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      )),
                );
              }),
              Builder(builder: (context) {
                return IconButton(
                  icon: const Icon(
                    FontAwesome5Solid.user_cog,
                    color: Color.fromARGB(255, 5, 81, 143),
                  ),
                  iconSize: 20,
                  alignment: Alignment.centerLeft,
                  onPressed: () {
                    //open drawer
                    Scaffold.of(context).openEndDrawer();
                  },
                );
              }),
              Padding(padding: const EdgeInsets.only(right: 10)),
            ],
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          extendBodyBehindAppBar: true,
          body: Builder(builder: (context) {

            print('HomePage build');
            return BlocListener<AssetBloc, AssetState>(
           key:  globalKey,
              listenWhen: (previous, current) =>
                  previous.dataStatus != current.dataStatus,
              listener: (context, state) {
                if (state.dataStatus == DataStatus.Unauthorized) {
                  QuickAlert.show(
                    context: context,
                    type: QuickAlertType.error,
                    //autoCloseDuration: Duration(seconds: 15),
                    //customAsset: "assets/images/sidebar/car_fleet_2.png",
                    barrierDismissible: false,
                    title: 'alert.unothorized_access'.tr(),
                    text: 'alert.unothorized_access_message'.tr(),
                    confirmBtnText: 'alert.reconnect'.tr(),
                    confirmBtnColor: Color.fromARGB(255, 186, 6, 48),
                    onConfirmBtnTap: () {
                      BlocProvider.of<AssetBloc>(context).close();
                      BlocProvider.of<AuthenticationBloc>(context).add(
                        AuthenticationLogoutRequested(),
                      );
                      Navigator.pop(context, true);
                    },
                  );
                }
                if (state.dataStatus == DataStatus.failure) {
                  QuickAlert.show(
                    context: context,
                    type: QuickAlertType.error,
                    //autoCloseDuration: Duration(seconds: 15),
                    //customAsset: "assets/images/sidebar/car_fleet_2.png",
                    barrierDismissible: true,
                    title: 'alert.data_loading_error'.tr(),
                    text: 'alert.data_loading_error_message'.tr(),
                    confirmBtnText: 'alert.try_again'.tr(),
                    confirmBtnColor: Color.fromARGB(255, 186, 6, 48),
                    
                    onConfirmBtnTap: () {
                      BlocProvider.of<AssetBloc>(context).add(RtAssetsLoaded());
                      Navigator.pop(context, true);
                    },
                  );
                }
                if (state.dataStatus == DataStatus.success) {
                  context.read<AssetBloc>().add(RtAdressLoaded());
                }
              },
              //child: MapHome(),
            );
          }),
        ),
      ),
    );
  }
}
