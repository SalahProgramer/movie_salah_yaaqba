import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomGridView extends StatefulWidget {
  final Widget? Function(BuildContext, int) builder;
  final ScrollController scrollController;
  final int itemCount;

  const CustomGridView({
    super.key,
    required this.builder,
    required this.scrollController,
    required this.itemCount,
  });

  @override
  State<CustomGridView> createState() => _CustomGridViewState();
}

class _CustomGridViewState extends State<CustomGridView> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      controller: widget.scrollController,
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      itemCount: widget.itemCount,
      physics: AlwaysScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 0.37.h,
        crossAxisCount: 2,
        mainAxisSpacing: 5.sp,
        crossAxisSpacing: 5.sp,
      ),
      itemBuilder: widget.builder,
    );
  }
}
