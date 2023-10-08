import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_hackathon/src/blocs/package_fetch_cubit.dart';
import 'package:nasa_hackathon/src/components/carousel.dart';
import 'package:nasa_hackathon/src/components/common_drawer.dart';
import 'package:nasa_hackathon/src/components/main_btn.dart';
import 'package:nasa_hackathon/src/di/injection_instance.dart';
import 'package:nasa_hackathon/src/views/itenary_view.dart';
import 'package:nasa_hackathon/src/views/package_fragment.dart';
import 'package:warped_bloc/warped_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int index = 0;

  late GlobalKey<ScaffoldState> sKey;

  late PageController controller;
  late PackageFetchCubit cubit;

  @override
  void initState() {
    super.initState();
    sKey = GlobalKey<ScaffoldState>();
    controller = PageController();
    cubit = g<PackageFetchCubit>();
    cubit.fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: sKey,
      drawer: const CommonDrawer(),
      bottomNavigationBar: BlocBuilder<PackageFetchCubit, BlocState>(
        bloc: cubit,
        builder: (context, state) {
          if (state is PackageFetchLoaded) {
            final packages = state.data;
            return BottomAppBar(
              elevation: 0,
              color: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: MainBtn(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (c) => ItenaryView(
                          packageId: packages[index].id,
                        ),
                      ),
                    );
                  },
                  title: "View Itenary",
                ),
              ),
            );
          }
          return Container();
        },
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: kToolbarHeight,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      sKey.currentState!.openDrawer();
                    },
                    icon: const Icon(Icons.line_style),
                  ),
                  BlocBuilder<PackageFetchCubit, BlocState>(
                    bloc: cubit,
                    builder: (context, state) {
                      return Carousel(
                        count: (state is PackageFetchLoaded)
                            ? state.data.length
                            : 0,
                        current: index,
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: BlocBuilder<PackageFetchCubit, BlocState>(
                bloc: cubit,
                builder: defaultBuilder<PackageFetchLoaded, void>(
                  onData: (state) {
                    final packages = state.data;
                    return PageView.builder(
                      physics: const BouncingScrollPhysics(),
                      onPageChanged: (i) {
                        setState(() {
                          index = i;
                        });
                      },
                      itemCount: packages.length,
                      itemBuilder: (c, i) => PackageFragment(
                        package: packages[i],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
