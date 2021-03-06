import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:resume_web/utils/R.dart';
import 'package:resume_web/utils/utils.dart';
import 'package:resume_web/widgets/assets/svg_asset.dart';

import 'app_bar_button.dart';

class HomeAppBar extends StatefulWidget implements PreferredSizeWidget {
  var height = 100.0;
  Function(int selectedIndex) onSelectedChange;

  HomeAppBar({
    Key? key,
    required this.onSelectedChange,
  }) : super(key: key);

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(height);
}

class _HomeAppBarState extends State<HomeAppBar> {
  List<bool> isSelected = [true, false, false];

  _onHomeTap() {
    setState(() {
      _unSelectAll();
      isSelected[0] = true;
    });
    widget.onSelectedChange(0);
  }

  _onSkillsTap() {
    setState(() {
      _unSelectAll();
      isSelected[1] = true;
    });
    widget.onSelectedChange(1);
  }

  _onPortfolioTap() {
    setState(() {
      _unSelectAll();
      isSelected[2] = true;
    });
    widget.onSelectedChange(2);
  }

  void _unSelectAll() {
    isSelected = isSelected.map((e) => e = false).toList();
  }

  void _onFarsiTap() {
    context.setLocale(const Locale('fa', 'IR'));
  }

  void _onEnglishTap() {
    context.setLocale(const Locale('en', 'US'));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
      child: Row(
        children: [
          const SizedBox(
            width: 10,
          ),
          AppBarButton(
            onTap: _onHomeTap,
            text: 'home'.tr(),
            isSelected: isSelected[0],
          ),
          const SizedBox(
            width: 10,
          ),
          AppBarButton(
            onTap: _onSkillsTap,
            text: 'skills'.tr(),
            isSelected: isSelected[1],
          ),
          const SizedBox(
            width: 10,
          ),
          AppBarButton(
            onTap: _onPortfolioTap,
            text: 'portfolio'.tr(),
            isSelected: isSelected[2],
          ),
          const Spacer(),
          buildLanguageDropdown()
        ],
      ),
    );
  }

  Widget buildLanguageDropdown() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: DropdownButton(
        isDense: true,
        dropdownColor: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(20),
        underline: Container(),
        focusColor: Colors.transparent,
        elevation: 0,
        hint: Text(
          'language'.tr(),
          style: Theme.of(context).textTheme.headline2,
        ),
        alignment: Utils.isRtlLocale(context)
            ? Alignment.centerLeft
            : Alignment.centerRight,
        icon: const Icon(
          Icons.arrow_drop_down,
          color: Colors.white,
          size: 25,
        ),
        items: ['farsi'.tr(), 'english'.tr()].map((String value) {
          return DropdownMenuItem<String>(
            alignment: Alignment.center,
            value: value,
            child: Row(
              children: [
                SvgAsset(
                  asset:
                      value == 'farsi'.tr() ? R.icons.ic_iran : R.icons.ic_usa,
                  width: 25,
                  height: 25,
                ),
                const SizedBox(width: 5),
                Text(
                  value,
                  style: Theme.of(context).textTheme.headline2,
                ),
              ],
            ),
          );
        }).toList(),
        onChanged: (value) {
          if (value == 'farsi'.tr()) {
            _onFarsiTap();
          } else if (value == 'english'.tr()) {
            _onEnglishTap();
          }
        },
      ),
    );
  }
}
