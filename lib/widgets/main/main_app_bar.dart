import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:resume_web/utils/R.dart';
import 'package:resume_web/utils/utils.dart';
import 'package:resume_web/widgets/assets/svg_asset.dart';

import 'app_bar_button.dart';

class MainAppBar extends StatefulWidget implements PreferredSizeWidget {
  var height = 100.0;
  final Map<String, Widget> tabs;
  final int selectedIndex;
  final Function(int selectedIndex) onSelectedChange;

  MainAppBar({
    Key? key,
    required this.tabs,
    required this.selectedIndex,
    required this.onSelectedChange,
  }) : super(key: key);

  @override
  State<MainAppBar> createState() => _MainAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(height);
}

class _MainAppBarState extends State<MainAppBar> {

  void _onFarsiTap() {
    context.setLocale(const Locale('fa', 'IR'));
  }

  void _onEnglishTap() {
    context.setLocale(const Locale('en', 'US'));
  }

  @override
  Widget build(BuildContext context) {
    var isDesktop = Utils.isDesktop(context);
    return Container(
      color: Colors.transparent,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (isDesktop)
            const SizedBox(
              width: 70,
            ),
          Expanded(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Utils.isRtlLocale(context)
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  for (int i = 0; i < widget.tabs.entries.length; i++)
                    Row(
                      children: [
                        AppBarButton(
                          onTap: () {
                            widget.onSelectedChange(i);
                          },
                          text: widget.tabs.entries.toList()[i].key.tr(),
                          isSelected: widget.selectedIndex == i,
                        ),
                        if (i != widget.tabs.entries.length - 1)
                          const SizedBox(
                            width: 10,
                          ),
                      ],
                    ),
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          buildLanguageDropdown(),
          if (isDesktop)
            const SizedBox(
              width: 20,
            ),
        ],
      ),
    );
  }

  Widget buildLanguageDropdown() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: DropdownButton(
        isDense: true,
        dropdownColor: const Color(0xFF313131),
        borderRadius: BorderRadius.circular(20),
        underline: Container(),
        focusColor: Colors.transparent,
        elevation: 0,
        hint: Container(
          width: 90,
          height: 35,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            // color: const Color(0xFF313131),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                width: 8,
              ),
              Container(
                width: 20,
                height: 20,
                margin: const EdgeInsets.symmetric(vertical: 3),
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
                alignment: Alignment.center,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7)),
                ),
                child: SvgAsset(
                  asset: Utils.isRtlLocale(context)
                      ? R.icons.ic_iran
                      : R.icons.ic_usa,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                  child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  Utils.isRtlLocale(context) ? 'farsi'.tr() : 'english'.tr(),
                  style: Theme.of(context)
                      .textTheme
                      .headline2
                      ?.copyWith(fontSize: 15),
                ),
              )),
              const Icon(
                Icons.arrow_drop_down,
                color: Colors.white,
                size: 20,
              )
            ],
          ),
        ),
        alignment: Utils.isRtlLocale(context)
            ? Alignment.centerLeft
            : Alignment.centerRight,
        icon: const SizedBox.shrink(),
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
