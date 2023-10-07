import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_hackathon/src/blocs/itenary_fetch_cubit.dart';
import 'package:nasa_hackathon/src/components/booking_bottomsheet.dart';
import 'package:nasa_hackathon/src/components/main_btn.dart';
import 'package:nasa_hackathon/src/di/injection_instance.dart';
import 'package:nasa_hackathon/src/views/iternary_fragment.dart';
import 'package:nasa_hackathon/src/views/training_plan_fragment.dart';
import 'package:warped_bloc/warped_bloc.dart';

class ItenaryView extends StatefulWidget {
  const ItenaryView({super.key});

  @override
  State<ItenaryView> createState() => _ItenaryViewState();
}

class _ItenaryViewState extends State<ItenaryView> {
  int index = 0;

  late PageController controller;
  final ItenaryFetchCubit cubit = g()..fetch('');

  @override
  void initState() {
    super.initState();
    controller = PageController();
  }

  _onNext() {
    controller.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: MainBtn(
            onTap: () {
              if (index == 0) {
                _onNext();
              } else {
                showBookingBottomsheet(context);
              }
            },
            title: index == 1 ? "Book Now" : "Next",
          ),
        ),
      ),
      body: PageView(
        controller: controller,
        onPageChanged: (page) {
          setState(() {
            index = page;
          });
        },
        physics: const BouncingScrollPhysics(),
        children: [
          TrainingPlanFragment(
            onNextTap: _onNext,
          ),
          BlocBuilder<ItenaryFetchCubit, BlocState>(
            bloc: cubit,
            builder: defaultBuilder<ItenaryFetchLoaded, void>(
              onData: (state) {
                return ItenaryFragment(
                  itenaries: state.data,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
