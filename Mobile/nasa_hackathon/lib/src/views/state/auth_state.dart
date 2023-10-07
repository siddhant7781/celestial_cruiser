import 'package:flutter/material.dart';
import 'package:nasa_hackathon/src/res/styles.dart';
import 'package:nasa_hackathon/src/views/state/faded_image_view_state.dart';

abstract class AuthState<T extends StatefulWidget>
    extends FadedImageViewState<T> {
  AuthState({
    required super.assetName,
    super.height = 400,
  });

  String getHeaderSubText(BuildContext context) =>
      '"Your Gateway to Musical Bliss: Sign In and Tune In!"';

  @override
  Widget getHeader(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SafeArea(
          child: BackButton(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(getHeaderText(context), style: Styles.header),
              const SizedBox(height: 16),
              Text(
                getHeaderSubText(context),
                style: Styles.subheading,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
