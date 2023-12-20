import 'package:flutter/material.dart';
import 'package:resume_web/models/skill.dart';

import '../../utils/utils.dart';

class SkillItem extends StatefulWidget {
  final Skill skill;
  final bool isEndOfList;

  const SkillItem({
    Key? key,
    required this.skill,
    required this.isEndOfList,
  }) : super(key: key);

  @override
  State<SkillItem> createState() => _SkillItemState();
}

class _SkillItemState extends State<SkillItem> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    var isDesktop = Utils.isDesktop(context);

    double circleSize = isDesktop ? 20 : 15;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        InkWell(
          onHover: (value) {
            setState(() {
              isHover = value;
            });
          },
          onHighlightChanged: (value) {
            setState(() {
              isHover = value;
            });
          },
          onTap: () {},
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
          focusColor: Colors.transparent,
          splashColor: Colors.transparent,
          child: SizedBox(
            width: 120,
            child: Row(
              textDirection: TextDirection.ltr,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: circleSize,
                  height: circleSize,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).colorScheme.primary,
                      boxShadow: isHover
                          ? const [
                              BoxShadow(
                                color: Color(0x3364CFB3),
                                blurRadius: 10,
                                offset: Offset(4, 4),
                                spreadRadius: 5,
                              ),
                              BoxShadow(
                                color: Color(0x3364CFB3),
                                blurRadius: 10,
                                offset: Offset(-4, -4),
                                spreadRadius: 5,
                              )
                            ]
                          : null),
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        widget.skill.text,
                        style: Theme.of(context).textTheme.headline1?.copyWith(
                              fontSize: isDesktop ? 20 : 15,
                              fontWeight:
                                  isHover ? FontWeight.bold : FontWeight.normal,
                            ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        if (widget.isEndOfList) buildVerticalDivider(context, circleSize)
      ],
    );
  }

  Container buildVerticalDivider(BuildContext context, double circleSize) {
    return Container(
      width: 2,
      height: 50,
      margin: EdgeInsets.only(left: circleSize / 2, top: 2, bottom: 2),
      color: Theme.of(context).colorScheme.primary,
    );
  }
}
