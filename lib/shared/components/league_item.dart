import 'package:flutter/material.dart';

import '../../layout/cubit/cubit.dart';
import '../../models/leagues_model.dart';

Widget buildLeagueItem(LeagueModel league, context, LiveScoreCubit cubit) =>
    InkWell(
      onTap: () {
        buildBottomSheet(context: context, league: league, cubit: cubit);
      },
      child: CircleAvatar(
        backgroundColor: Colors.white,
        radius: 35,
        child: Image(
          fit: BoxFit.contain,
          width: 40,
          height: 40,
          image: NetworkImage(league.logo!),
        ),
      ),
    );

Future<dynamic> buildBottomSheet({
  required BuildContext context,
  required LeagueModel league,
  required LiveScoreCubit cubit,
}) {
  return showModalBottomSheet(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 15),
          height: MediaQuery.of(context).size.height / 5,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      width: 20,
                      height: 20,
                      image: NetworkImage(
                        league.logo!,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Flexible(
                      child: Text(
                        league.name!,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        // softWrap: true,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    cubit.leagueId = league.id;
                    cubit.changeBottomNav(1);
                    Navigator.pop(context);
                  },
                  child: const Text("View Fixtures"),
                ),
                ElevatedButton(
                  onPressed: () {
                    cubit.changeBottomNav(2);
                    cubit.getStandings(
                      season: league.currentYear.toString(),
                      leagueId: league.id.toString(),
                    );
                    Navigator.pop(context);
                  },
                  child: const Text("View Standings"),
                ),
              ],
            ),
          ),
        );
      });
}
