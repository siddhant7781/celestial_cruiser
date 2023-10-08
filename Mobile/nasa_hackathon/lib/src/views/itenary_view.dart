// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_hackathon/src/blocs/booking_cubit.dart';
import 'package:nasa_hackathon/src/components/booking_bottomsheet.dart';
import 'package:warped_bloc/warped_bloc.dart';

import 'package:nasa_hackathon/src/blocs/itenary_fetch_cubit.dart';
import 'package:nasa_hackathon/src/components/main_btn.dart';
import 'package:nasa_hackathon/src/di/injection_instance.dart';
import 'package:nasa_hackathon/src/views/iternary_fragment.dart';
import 'package:nasa_hackathon/src/views/training_plan_fragment.dart';

class ItenaryView extends StatefulWidget {
  final String packageId;
  const ItenaryView({
    Key? key,
    required this.packageId,
  }) : super(key: key);

  @override
  State<ItenaryView> createState() => _ItenaryViewState();
}

class _ItenaryViewState extends State<ItenaryView> {
  int index = 0;

  late PageController controller;
  final ItenaryFetchCubit cubit = g();

  final BookingCubit bookingCubit = g();

  @override
  void initState() {
    super.initState();
    controller = PageController();
    cubit.fetch(widget.packageId);
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
      bottomNavigationBar: BlocBuilder<ItenaryFetchCubit, BlocState>(
        bloc: cubit,
        builder: (context, state) {
          return BottomAppBar(
            elevation: 0,
            color: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: MainBtn(
                onTap: (state is ItenaryFetchLoaded)
                    ? () {
                        if (index == 0) {
                          _onNext();
                        } else {
                          bookingCubit.book(widget.packageId);
                        }
                      }
                    : () {
                        if (index == 0) {
                          _onNext();
                        }
                      },
                title: index == 1 ? "Book Now" : "Next",
              ),
            ),
          );
        },
      ),
      body: BlocListener<BookingCubit, BlocState>(
        bloc: bookingCubit,
        listener: defaultListener<BookingSuccess, void>(
          onData: (context, state) {
            showBookingBottomsheet(context);
          },
        ),
        child: PageView(
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
      ),
    );
  }
}
