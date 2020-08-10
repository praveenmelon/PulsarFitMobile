import 'package:flutter/material.dart';
import 'package:pulsar_fit/models/responses/plan.dart';
import 'package:pulsar_fit/presentation/common/level_indicators.dart';
import 'package:pulsar_fit/presentation/common/user_avatar.dart';
import 'package:pulsar_fit/presentation/common/expandable.dart';
import 'package:pulsar_fit/common/extensions.dart';
import 'package:pulsar_fit/presentation/plans/plan_details_screen.dart';

class PlanListTile extends StatelessWidget {
  final Plan plan;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;

  PlanListTile({
    @required this.plan,
    this.padding,
    this.margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
  }) : assert(plan != null);

  @override
  Widget build(BuildContext context) {
    final appTheme = context.appTheme();

    return Container(
      color: appTheme.theme.primaryColorLight,
      margin: margin,
      padding: padding,
      child: Column(
        children: [
          InkWell(
            child: Container(
              color: appTheme.theme.primaryColorLight,
              padding: const EdgeInsets.all(10),
              child: UserAvatar(
                url: plan.trainer?.user?.multimediaFile?.url,
                trailing: '${plan.trainer?.user?.firstName} ${plan.trainer?.user?.lastName}',
              ),
            ),
          ),
          InkWell(
            onTap: () {
              context.navigator().pushNamed(PlanDetailsScreen.route, arguments: plan);
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                AspectRatio(
                  aspectRatio: 7 / 4,
                  child: Material(
                    color: Colors.transparent,
                    child: Image.network(
                      plan.multimediaFile?.url.toNetworkPhotoUrl(),
                      fit: BoxFit.cover,
                      colorBlendMode: BlendMode.darken,
                      color: Colors.black45,
                    ),
                  ),
                ),
                Text(
                  plan.name.cut(25),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 23),
                ),
              ],
            ),
          ),
          Expandable(
            iconColor: appTheme.theme.accentColor,
            header: LevelIndicators(
              cardioLevel: plan.cardioLevel,
              strengthLevel: plan.strengthLevel,
              planLevel: plan.planLevel,
            ),
            body: Padding(
              padding: const EdgeInsets.all(10),
              child: Wrap(
                children: plan.planTags
                        ?.map(
                          (x) => Padding(
                            padding: const EdgeInsets.all(2),
                            child: Chip(
                              backgroundColor: appTheme.theme.scaffoldBackgroundColor,
                              label: Text(x.name ?? '', style: TextStyle(color: Colors.white)),
                            ),
                          ),
                        )
                        ?.toList() ??
                    [],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
