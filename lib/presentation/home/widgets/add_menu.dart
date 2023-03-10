import 'package:finance_app/presentation/expenses/page/add_expense_page.dart';
import 'package:finance_app/presentation/income/page/add_income_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import '../../../resources/colors.dart';
import '../../../resources/strings.dart';

class AddMenu extends StatefulWidget {
  const AddMenu({
    Key? key,
    required this.color,
  }) : super(key: key);

  final Color color;

  @override
  State<AddMenu> createState() => _AddMenuState();
}

class _AddMenuState extends State<AddMenu> {
  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      animatedIcon: AnimatedIcons.menu_close,
      backgroundColor: widget.color,
      overlayOpacity: 0.4,
      children: [
        SpeedDialChild(
          backgroundColor: AppColors.redWine,
          child: const Icon(
            Icons.keyboard_arrow_down_outlined,
            color: AppColors.whiteSnow,
          ),
          label: Strings.expense,
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddExpensePage(transaction: null),
            ),
          ),
        ),
        SpeedDialChild(
          backgroundColor: AppColors.greenVibrant,
          child: const Icon(
            Icons.keyboard_arrow_up_outlined,
            color: AppColors.whiteSnow,
          ),
          label: Strings.income,
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddIncomePage(transaction: null),
            ),
          ),
        ),
      ],
    );
  }
}
